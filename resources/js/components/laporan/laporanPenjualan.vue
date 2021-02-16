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

                            <data-table
                                url="/api/posts"
                                :per-page="perPage"
                                :columns="columns">
                            </data-table>

                        </div>

                

</template>


<script>
import Vue from 'vue';
import DataTable from 'laravel-vue-datatable';
Vue.use(DataTable);

    export default {

        data() {
            return {
                posts: [],
                perPage: ['10', '25', '50'],
                columns: [
                    {
                        label: 'Kode Barang',
                        name: 'kdBarang',
                        filterable: true,
                    },
                    {
                        label: 'Nama Barang',
                        name: 'nmBarang',
                        filterable: true,
                    },
                    {
                        label: 'Harga',
                        name: 'hrgPokok',
                        filterable: true,
                    },
                    {
                        label: 'Action',
                        name: 'View',
                        filterable: false,
                    },
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