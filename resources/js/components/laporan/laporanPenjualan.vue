<template>

                    <div class="card-body">
                        <h3>Laporan Penjualan</h3>
                            <table class="table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>No Nota</th>
                                    <th>Pelanggan</th>
                                    <th>Total</th>
                                    <th>Bayar</th>
                                    <th>Kembali</th>
                                    <th>AKSI</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="(post, index) in posts" :key="post.id">
                                    <td>{{ post.kdBarang }}</td>
                                    <td>{{ post.nmBarang }}</td>
                                    <td>{{ post.hrgPokok | currency }}</td>
                                    <td>{{ post.hrgJual | currency }}</td>
                                    <td>{{ post.stkBarang }}</td>
                                    <td class="text-center">
                                        <router-link :to="{name: 'edit', params: { id: post.id }}" class="btn btn-sm btn-primary">EDIT</router-link>
                                        <button @click.prevent="PostDelete(post.id, index)" class="btn btn-sm btn-danger">HAPUS</button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                            <div id="vue-root">
                                <datatable :columns="columns" :data="rows" class="table table-hover table-bordered"></datatable>
                            </div>

                        </div>

                

</template>


<script>
import Vue from 'vue';
import { VuejsDatatableFactory } from 'vuejs-datatable';

Vue.use( VuejsDatatableFactory );

    export default {
        components: { VuejsDatatableFactory},
        data() {
            return {
                posts: [],
                columns: [
                    {label: 'id', field: 'id'},
                    {label: 'Username', field: 'user.username', headerClass: 'class-in-header second-class'},
                    {label: 'First Name', field: 'user.firstName'},
                    {label: 'Last Name', field: 'user.lastName'},
                    {label: 'Email', field: 'user.email'},
                    {label: 'Address', representedAs: ({address, city, state}) => `${address}<br />${city}, ${state}`, interpolate: true}
                ],
                rows: [
                    //...
                    {
                        id: 1,
                        user: {
                            username: "dprice0",
                            firstName: "Daniel",
                            lastName: "Price",
                            email: "dprice0@blogs.com"
                        },
                        address: "3 Toban Park",
                        city: "Pocatello",
                        state: "Idaho"
                    },
                    {
                        id: 2,
                        user: {
                            username: "hahah",
                            firstName: "Daniel",
                            lastName: "Price",
                            email: "dprice0@blogs.com"
                        },
                        address: "3 Toban Park",
                        city: "Pocatello",
                        state: "Idaho"
                    }
                    //...
                ]
            }

        },
        created() {
            let uri = '/api/posts';
            this.axios.get(uri).then(response => {
                this.posts = response.data.data;
            });
        },
        methods: {
            PostDelete(id, index)
            {
                this.axios.delete(`/api/posts/${id}`)
                    .then(response => {
                        this.posts.splice(index, 1);
                    }).catch(error => {
                    alert('system error!');
                });
            }
        }
    }
</script>