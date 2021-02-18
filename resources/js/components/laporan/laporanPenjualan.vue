<template>

                    <div class="card-body">
                        <h3>Laporan Penjualan</h3>

                        <form  @submit.prevent="PostItemPembelian" >
                        <div class="row">
                            
                            <div class="col-xs-3">
                            <input type="text" v-model="hrgPokok" class="form-control" placeholder="Harga">
                            </div>
                            <div class="col-xs-3">
                            <input type="text" v-model="qtyBeli" class="form-control" placeholder="Qty">
                            </div>
                            <div class="col-xs-3">
                            <button type="submit" class="btn btn-md btn-success">Add</button>                        
                            </div>
                        </div>
                        
                        </form>
                            
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
                            key: "noNota",
                            title: "No Nota",
                            sortable: false,
                        },
                        {
                            key: "pelangganNota",
                            title: "Pelanggan",
                            sortable: false,
                        },
                        {
                            key: "tglNota",
                            title: "Tgl Nota",
                            sortable: false,
                        },
                        {
                            key: "totalNota",
                            title: "Total",
                            sortable: false,
                            searchable: false,
                            /* this will make this column appear to the right of the table
                            since its index is greater than others*/
                            
                        },
                        {
                            key: "bayarNota",
                            title: "Bayar",
                            sortable: false,
                            searchable: false,
                            /* this will make this column appear to the right of the table
                            since its index is greater than others*/
                            
                        },
                        {
                            key: "kembalianNota",
                            title: "Kembalian",
                            sortable: false,
                            searchable: false,
                            /* this will make this column appear to the right of the table
                            since its index is greater than others*/
                            
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
            let uri = '/api/penjualan';
            this.axios.get(uri).then(response => {
                this.posts = response.data.data;
            });
        },
        methods: {
            PostDelete(id, index)
            {
                this.axios.delete(`/api/penjualan/${id}`)
                    .then(response => {
                        this.posts.splice(index, 1);
                    }).catch(error => {
                    alert('system error!');
                });
            },
            
           
        },
        
    }
</script>