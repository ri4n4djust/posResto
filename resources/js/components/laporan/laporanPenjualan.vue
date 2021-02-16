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

                        
                            <div>
                                <data-table v-bind="bindings"/>
                            </div>
                        

                        </div>

                

</template>


<script>
import Vue from 'vue';
import "@andresouzaabreu/vue-data-table/dist/DataTable.css";
import DataTable from "@andresouzaabreu/vue-data-table";

//import datas from '';

Vue.component("data-table", DataTable);

    export default {

        data() {
            return {
                posts: [],
                
                
            }

        },
        computed: {
            bindings() {
                return {
                    columns: [
                        {
                            key: "kdBarang",
                        },
                        {
                            key: "nmBarang",
                            title: "Nama Barang",
                            sortable: false,
                        },
                        {
                            key: "hrgPokok",
                            sortable: false,
                            searchable: false,
                            /* this will make this column appear to the right of the table
                            since its index is greater than others*/
                            index: 100,
                        },
                        
                    ],
                    data: [],
                    /* other props...*/
                }
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