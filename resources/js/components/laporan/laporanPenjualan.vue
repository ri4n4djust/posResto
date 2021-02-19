<template>

                    <div class="card-body">
                        <h3>Laporan Penjualan</h3>
                        <div class="box box-primary">
                        <div class="box-body box-profile">
                        <form  @submit.prevent="lapPenjualan" >
                            
                                <p class="text-muted text-left">
                                <label>Start Date</label>
                            <date-picker v-model="startDate" value-type="format" format="YYYY/MM/DD" :required="true"></date-picker>
                                </p>
                                <p class="text-muted text-left">
                                <label>End Date</label>
                            <date-picker v-model="endDate" value-type="format" format="YYYY/MM/DD" :required="true"></date-picker>
                                </p>
                                <p class="text-muted text-left">
                            <button type="submit" class="btn btn-md btn-success">View Data</button> 
                                </p>                       
                            
                        </form>
                        </div>
                        </div>

                        <div class="box box-primary">
                        <div class="box-body box-profile">
                            <table class="table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>No Nota</th>
                                    <th>Customer</th>
                                    <th>Tgl</th>
                                    <th>Total</th>
                                    <th>Bayar</th>
                                    <th>Kembalian</th>
                                    <th>Aksi</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="post1 in posts1" :key="post1.id">
                                    <td>{{ post1.noNota }}</td>
                                    <td>{{ post1.pelangganNota }}</td>
                                    <td>{{ post1.tglNota }}</td>
                                    <td>{{ post1.totalNota | currency }}</td>
                                    <td>{{ post1.bayarNota | currency }}</td>
                                    <td>{{ post1.kembalianNota | currency}}</td>
                                    <td class="text-center">
                                        <router-link :to="{name: 'detail', params: { id: post1.id }}" class="btn btn-sm btn-primary">Detail</router-link>
                                        <router-link :to="{name: 'edit', params: { id: post1.id }}" class="btn btn-sm btn-primary">EDIT</router-link>
                                    </td>
                                </tr>
                                </tbody>
                                
                            </table>

                        </div>
                        </div>


                        <div class="box box-primary">
                        <div class="box-body box-profile">    
                            <div>
                                <data-table v-bind="bindings" @actionTriggered="ActionButtons"/>
                            </div>
                        </div>
                        </div>

                    </div>

                

</template>


<script>
import Vue from 'vue';
import "@andresouzaabreu/vue-data-table/dist/DataTable.css";
import DataTable from "@andresouzaabreu/vue-data-table";

import DatePicker from 'vue2-datepicker';
import 'vue2-datepicker/index.css';
import VueSingleSelect from "vue-single-select";

import ActionButtons from './componentAksi.vue';
Vue.component("data-table", DataTable);
    export default {
        components: { DatePicker, VueSingleSelect },
        data() {
            return {
                posts: [],
                posts1: [],
                startDate: '',
                endDate: '',
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
            lapPenjualan() {
                let uri = '/api/lapPenjualan';
                this.axios.post(uri, 
                {
                    startDate: this.startDate,
                    endDate: this.endDate,
                })
                    .then((response) => {
                        this.posts1 = response.data.data;
                        //alert('Data Ditampilkan');
                        this.loadDataSorting()
                        this.loadTotal()
                    });
                
            },
           
        },
        
    }
</script>