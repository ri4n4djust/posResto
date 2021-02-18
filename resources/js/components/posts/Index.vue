<template>

                    <div class="card-body">
                        <h3>Daftar barang</h3>
                        <h3>
                        <router-link :to="{ name: 'create' }" class="btn btn-md btn-success">TAMBAH BARANG</router-link>
                        </h3>
                            
                            <div>
                                
                                <data-table v-bind="bindings" @actionTriggered="ActionButtons"/>
                                
                            </div>
                            
                        

                        </div>

                

</template>


<script>
import Vue from 'vue';
import "@andresouzaabreu/vue-data-table/dist/DataTable.css";
import DataTable from "@andresouzaabreu/vue-data-table";

import ActionButtons from './componentAksi.vue';
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
                    actionMode: "multiple",
                    //name: "ActionButtons",
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
                            title: "Harga Pokok",
                            sortable: false,
                            searchable: false,
                        },
                        {
                            key: "stkBarang",
                            title: "Stok",
                            sortable: false,
                            searchable: false,
                        },
                        {
                            key: "satuanBarang",
                            title: "Satuan",
                            sortable: false,
                            searchable: false,
                        },
                        {
                            key: "ktgBarang",
                            title: "Kategori",
                            sortable: false,
                            searchable: false,
                        },
                        {
                            title: "Action",
                            sortable: false,
                            searchable: false,
                            /* this will make this column appear to the right of the table
                            since its index is greater than others*/
                            
                            component: ActionButtons,
                            index:100,
                        },
                        
                    ],
                    data: this.posts,
                    /* other props...*/
                    
                }
            }
        },
        created() {
            this.loadData()
            //this.pollData()
            //setInterval(this.loadData(),60000)
            
        },
        methods: {
            
            loadData:function(){
                let uri = '/api/posts';
                this.axios.get(uri).then(response => {
                this.posts = response.data.data;
                
            });
            },
            intervalFetchData1: function () {
            setInterval(() => {    
                this.bindings();
                }, 1000);    
            },
            intervalFetchData: function () {
            setInterval(() => {    
                this.loadData();
                }, 1000);    
            }
        },
        mounted () {
            this.intervalFetchData1();
            this.intervalFetchData();
            this.bindings()
            this.loadData()
        },

        beforeDestroy () {
            clearInterval(this.posts)
        },
        
    }
</script>