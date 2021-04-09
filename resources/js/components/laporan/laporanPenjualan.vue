<template>

                    <div class="card-body">
                        <status-login></status-login>
                         <h3>Laporan Penjualan</h3>
                        <div class="col-md-12">
                        <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                            <li class="active"><a href="#activity" data-toggle="tab">All Report</a></li>
                            <li><a href="#timeline" data-toggle="tab">Periodik</a></li>
                            <li><a href="#settings" data-toggle="tab">Settings</a></li>
                            </ul>
                            <div class="tab-content">
                            <div class="active tab-pane" id="activity">

                                <div>
                                <data-table v-bind="bindings" @actionTriggered="ActionButtons"/>
                                </div>
                                
                               
                                
                            </div>
                            <!-- /.tab-pane -->
                            <div class="tab-pane" id="timeline">
                                <!-- The timeline -->
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
                                  
                                <table class="table table-hover table-bordered">
                                    <thead>
                                    <tr>
                                        <th>No Nota</th>
                                        <th>Customer</th>
                                        <th>Tgl</th>
                                        <th>PPn</th>
                                        <th>Diskon</th>
                                        <th>Total</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-for="post1 in posts1" :key="post1.id">
                                        <td>{{ post1.noNota }}</td>
                                        <td>{{ post1.pelangganNota }}</td>
                                        <td>{{ post1.tglNota }}</td>
                                        <td>{{ post1.taxNota | currency }}</td>
                                        <td>{{ post1.diskonNota | currency }}</td>
                                        <td>{{ post1.totalNota | currency}}</td>
                                    </tr>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th>{{pajakS | currency}}</th>
                                            <th>{{diskonS | currency}}</th>
                                            <th>{{totalS | currency}}</th>
                                        </tr>
                                    </tfoot>
                                </table>

                                <div id="printMe1" ref="printMu" >
                                <table width="90%" border="1" style="border:1px solid black; border-collapse: collapse;">
                                    <thead>
                                    <tr>
                                        <th>No Nota</th>
                                        <th>Customer</th>
                                        <th>Tgl</th>
                                        <th>Pajak</th>
                                        <th>Diskon</th>
                                        <th>Total</th>
                                    </tr>
                                    </thead>
                                    <tbody >
                                    <tr v-for="post1 in posts1" :key="post1.id">
                                        <td>{{ post1.noNota }}</td>
                                        <td>{{ post1.pelangganNota }}</td>
                                        <td>{{ post1.tglNota }}</td>
                                        <td>{{ post1.taxNota | currency }}</td>
                                        <td>{{ post1.diskonNota | currency }}</td>
                                        <td>{{ post1.totalNota | currency}}</td>
                                    </tr>
                                    <tfoot>
                                        <tr>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th>{{pajakS | currency}}</th>
                                            <th>{{diskonS | currency}}</th>
                                            <th>{{totalS | currency}}</th>
                                        </tr>
                                    </tfoot>
                                    </tbody>
                                    
                                </table>
                                </div>
                                <!-- OUTPUT -->
                                <button type="button" class="btn btn-primary" @click="print('printMu')">Print</button>

                            </div>
                            <!-- /.tab-pane -->

                            <div class="tab-pane" id="settings">

                                
                            </div>
                            <!-- /.tab-pane -->
                            </div>
                            <!-- /.tab-content -->
                        </div>
                        <!-- /.nav-tabs-custom -->
                        </div>

                       

                            


                    </div>

                

</template>

<style type="text/css">

    #printMe { display: none; }

    @media print
    {
        #non-printable { display: none; }
        #printMe { display: block; }
    }
    </style>

<script>
import Vue from 'vue';
import "@andresouzaabreu/vue-data-table/dist/DataTable.css";
import DataTable from "@andresouzaabreu/vue-data-table";

import DatePicker from 'vue2-datepicker';
import 'vue2-datepicker/index.css';
import VueSingleSelect from "vue-single-select";

import VueHtmlToPaper from 'vue-html-to-paper';

import Print from 'vue-print-plugin';

const options = {
  name: '_blank',
  specs: [
    'fullscreen=yes',
    'titlebar=yes',
    'scrollbars=yes'
  ],
}

Vue.use(VueHtmlToPaper, options, Print);

import ActionButtons from './componentAksi.vue';
Vue.component("data-table", DataTable);
    export default {
        components: { DatePicker, VueSingleSelect,  },
        data() {
            return {
                posts: [],
                posts1: [],
                startDate: '',
                endDate: '',
                ActionButtons: null,
                validation: null,
                //actionTriggered: null,
                totalS: [],
                pajakS: [],
                diskonS: [],
                //totalSum: '',
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
                            key: "noMeja",
                            title: "No Meja",
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
                            key: "taxNota",
                            title: "PPn",
                            sortable: false,
                            searchable: false,
                        },
                        {
                            key: "diskonNota",
                            title: "Diskon",
                            sortable: false,
                            searchable: false,
                        },
                        {
                            key: "totalNota",
                            title: "Total",
                            sortable: false,
                            searchable: false,
                        },
                        {
                            key: "bayarNota",
                            title: "Bayar",
                            sortable: false,
                            searchable: false,
                        },
                        {
                            key: "kembalianNota",
                            title: "Kembalian",
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
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            }
        },
        created() {
            this.loadData();
        },
        mounted () {
            //this.intervalFetchData1();
            this.intervalFetchData();
            //this.bindings()
            //this.loadData()
        },
        methods: {

            print (ref) {
                this.$print(this.$refs[ref])
            },
            
            loadData:function(){
                let uri = '/api/penjualan';
                this.axios.get(uri).then(response => {
                this.posts = response.data.data;
                        
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
                        this.totalS = response.data.notaSum;
                        this.pajakS = response.data.pajakSum;
                        this.diskonS = response.data.diskonSum;
                        //alert('Data Ditampilkan');
                        //this.loadDataSorting()
                        //this.loadTotal()
                    });
                
            },
            intervalFetchData: function () {
            setInterval(() => {    
                this.loadData();
                }, 3000);    
            }
            //print () {
            // Pass the element id here
            //this.$htmlToPaper('printMe');
            //}
           
        },
        
    }
</script>