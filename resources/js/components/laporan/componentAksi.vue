<template>
    <div >
        <button  @click="loadDetailPenjualan()">
            <i class="fa fa-eye"></i>
        </button>

        
       

                        <div v-if="showModalPenjualan">
                            <transition name="modal">
                            <div class="modal-mask">
                                <div class="modal-wrapper">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" @click="showModalPenjualan=false">
                                        <span aria-hidden="true">&times;</span>
                                        </button>
                                        <h4 class="modal-title">Detail Penjualan</h4>
                                    </div>
                                    <div class="modal-body">
                                        
                                        <div class="row invoice-info">
                                        <!-- accepted payments column -->
                                            <div class="col-xs-6">
                                            <p class="text-muted well well-sm no-shadow" style="margin-top: 10px;">
                                                <strong>Customer :</strong> {{data.pelangganNota}}<br>
                                                <b> Tgl : </b>{{data.tglNota}}<br>
                                                <b> Meja No : </b>{{data.noMeja}}<br>
                                                <b>Waiter : </b>{{data.waiterNota}}<br>
                                                <b>Bayar : </b>{{data.bayarNota | currency}}<br>
                                                <b>Kembalian : </b>{{data.kembalianNota | currency}}<br>
                                            </p>
                                            </div>
                                            <!-- /.col -->
                                            <div class="col-xs-6">
                                            <p class="text-muted well well-sm no-shadow" style="margin-top: 10px;">
                                                <b>No Inv: </b>{{data.noNota}}<br>
                                                <b>Kasir : </b>{{ data.name }}<br>
                                                <b>Type : </b>
                                                <span v-if="data.typePembayaran === '1'">
                                                    Cash
                                                </span>
                                                <span v-else-if="data.typePembayaran === '2'">
                                                    Debit
                                                </span>
                                                <span v-else-if="data.typePembayaran === '3'">
                                                    E-Money
                                                </span>
                                                <br>
                                                <b>Tax: </b>{{data.taxNota | currency}}<br>
                                                <b>Diskon : </b>{{ data.diskonNota | currency }}<br>
                                                <b>Card Charge : {{ data.chargePembayaran }} %</b>
                                            </p>
                                            </div>
                                            <!-- /.col -->
                                        
                                    </div>
                                        <h3 class="profile-username text-left">
                                            <label>Total : </label>
                                            {{ data.totalNota  || 0 | currency }}</h3>
                                        
                                        <p class="text-muted text-center">
                                        </p>
                                        
                                        <div v-if="adminuser === 'Admin'">
                                            <a href="#"  @click="rePrint()" class="btn btn-md btn-success"><b>Re-Print</b></a>
                                            <!-- <a href="#"   @click.prevent="DeletePenjualan(id = data.id)" class="btn btn-md btn-success"><b>Delete</b></a> -->
                                        </div>
                                        <span v-if="load">Loading...</span>
                                        <div v-else-if="adminuser === 'Operator'">
                                            <a href="#"  @click="rePrint()" class="btn btn-md btn-success"><b>Re-Print</b></a>
                                        </div>
                                        <div v-else-if="adminuser === 'Kasir'">
                                            <a href="#"  @click="rePrint()" class="btn btn-md btn-success"><b>Re-Print</b></a>
                                        </div>
                                        <br>
            <div id="printMe">
            <section class="invoice">
                <!-- info row -->
                <p class="text-muted text-center">
                <img :src="'/image/logoNota.png'" >
                </p>
               <p class="text-bold text-center">
               
                    Phone / Wa: 081 239 099 998<br>
                    Email: warungdaladesa@gmail.com<br>
                    FB : warungdaladesa<br>
                    IG : warung.daladesa.sangeh
                  
                </p>
              <div class="row invoice-info">
                  <!-- accepted payments column -->
                    <div class="col-xs-6">
                    <p class="text-muted" style="margin-top: 2px;">
                        <strong>Customer :</strong> {{data.pelangganNota}}<br>
                        <b> Tgl : </b>{{data.tglNota}}<br>
                        <b> Meja No : </b>{{data.noMeja}}<br>
                        <b>Waiter : </b>{{data.waiterNota}}<br>
                    </p>
                    </div>
                    <!-- /.col -->
                    <div class="col-xs-6">
                    <p class="text-muted" style="margin-top: 2px;">
                        <b>Inv: </b>{{data.noNota}}<br>
                        <b>Kasir : </b>{{ data.name }}<br>
                        <b>Pax: </b>{{data.pax}}<br>
                        <b>Type : </b>
                        <span v-if="data.typePembayaran === '1'">
                            Cash
                        </span>
                        <span v-else-if="data.typePembayaran === '2'">
                            Debit
                        </span>
                        <span v-else-if="data.typePembayaran === '3'">
                            E-Money
                        </span>
                    </p>
                    </div>
                    <!-- /.col -->
                    
                    <div class="col-xs-12 table-responsive">
                        
                  <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>Nama </th>
                                    <th>Qty</th>
                                    <th>Harga</th>
                                    <th>Total</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="trx in pem" :key="trx.noN">
                                    <td>{{ trx.nmBarang }} </td>
                                    <td>{{ trx.qty}}</td>
                                    <td>{{ trx.hrgJual | currency }}</td>
                                    <td>{{ trx.qty * trx.hrgJual | currency }}</td>
                                </tr>
                                </tbody>
                                
                                    <tr>
                                        <th colspan="3">subTotal :</th>
                                        <th>{{ totalJ | currency}}</th>
                                    </tr>
                                    <tr>
                                        <th colspan="3">Tax & Service : {{ data.pajakPembayaran }} %</th>
                                        <th>{{ data.taxNota | currency}}</th>
                                    </tr>
                                    <tr>
                                        <th colspan="3">Discount {{ data.diskonPembayaran }} %</th>
                                        <th>{{ data.diskonNota | currency}}</th>
                                    </tr>
                                    <tr>
                                        <th colspan="3">subTotal :</th>
                                        <th>{{ data.totalNota | currency }}</th>
                                    </tr>
                                    <tr v-if="data.typePembayaran === '1'">
                                    </tr>
                                    <tr v-else-if="data.typePembayaran === '2'">
                                        <th colspan="3">Card Charge : {{ data.chargePembayaran }} %</th>
                                        <th>{{ data.chargeNota | currency }}</th>
                                    </tr>

                                    <tr>
                                        <th colspan="3">Payment :</th>
                                        <th>{{ data.bayarNota | currency }}</th>
                                    </tr>

                                    <tr v-if="data.typePembayaran === '1'">
                                        <th colspan="3">Kembalian :</th>
                                        <th>{{ data.kembalianNota | currency }}</th>
                                    </tr>
                                    <tr v-else-if="data.typePembayaran === '2'">
                                    </tr>
                                </table>
                                <p class="text-bold text-center">
                                Terima Kasih <br>
                                Belanja Anda Hal Baik Bagi Dunia<br>
                                Tidak enak Kasi Tau Kami, ENAK kasi tau temanmu<br>                              
                            </p>

                </div>
                
              </div>
              <!-- /.row -->
                
            </section>
            </div>

                                        
                                        

                                                    <table class="table table-hover table-bordered">
                                                        <thead>
                                                        <tr>
                                                            <th>Nama </th>
                                                            <th>Qty</th>
                                                            <th>Harga</th>
                                                            <th>Total</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <tr v-for="pe in pem" :key="pe.id">
                                                            <td>{{ pe.nmBarang }} </td>
                                                            <td>{{ pe.qty}}</td>
                                                            <td>{{ pe.hrgJual | currency }}</td>
                                                            <td>{{ pe.qty * pe.hrgJual | currency }}</td>

                                                        </tr>
                                                        </tbody>
                                                    </table>
      
                                        

                                    </div>
                                    </div>
                                </div>
                                </div>
                            </div>
                            </transition>
                        </div>
       
    </div>
</template>

<style type="text/css">

    #printMe { display: none; }

    @media print
    {
  body * {
    visibility: hidden;
  }
  #printMe, #printMe * {
    visibility: visible;
  }
  #printMe {
    position: absolute;
    left: 0;
    top: 0;
    font-size: 8pt;
    width: 100%;
  }
}
    </style>

<script>

export default {

    name: "ActionButtons",
    data() {
            return {
                posts: [],
                pem: [],
                showModalPenjualan: false,
                np: this.data.noNota,
                sukses: '',
                adminuser: '',
                totalJ:'',
                load: false,
            }

        },
    created() {
            this.loadData()
            //this.something()
            //this.loadDetailPenjualan()
            this.adminuser = this.$session.get('roleID')
        },
    mounted () {
            //this.intervalFetchData1();
            //this.intervalFetchData();
            //this.bindings()
            this.loadData()
    },
       
    methods: {
        rePrint: function(){
            window.print(printMe);
        },
            DeletePenjualan(id)
            {
                if(confirm("Do you really want to delete?")){
                this.axios.delete(`/api/hapuspenjualan/${id}`)
                    .then(response => {
                        //this.posts.splice(index, 1);
                        this.showModalPenjualan = false;
                        this.loadData();
                    }).catch(error => {
                    alert('system error!');
                });
                }
            },
            something() {
                return new Promise((resolve) => {
                resolve('np:'+ this.data.noNota);
                });
            },
            loadData:function(){
                let uri = '/api/penjualan';
                this.axios.get(uri).then(response => {
                this.posts = response.data.data;
                
                
            });
            },
            loadDetailPenjualan:function(){
                this.load = true;
                this.showModalPenjualan = true;
                let uri = '/api/detailpenjualan/'+ this.data.noNota;
                this.axios.get(uri).then(response => {
                    this.pem = response.data.data;
                    this.totalJ = response.data.total;
                    this.load = false;
                   // alert('no nota '+ this.data.noNota);
            });
            },
            intervalFetchData: function () {
            setInterval(() => {    
                this.loadData();
                }, 3000);    
            },
                      
        },
    props: {
        data: {
            type: Object,
            required: true,
        },
    },
};
</script>