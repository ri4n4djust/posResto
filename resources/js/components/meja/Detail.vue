<template>
    <div class="mt-3">
    <section class="content">

      <div class="row">
        <div class="col-md-3">

          <div id="printableArea">
      <h1>Print me</h1>
</div>

<input type="button" @onclick="printDiv('printableArea')" value="print a div!" />

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">

              <h3 class="profile-username text-center">Meja No. {{post.noMeja}}</h3>

              <p class="text-muted text-center">Max Pax {{post.paxMeja}}</p>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          <!-- About Me Box -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Billing</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">

              
                <p class="text-muted text-center">
                <date-picker v-model="tglNota" value-type="format" format="YYYY/MM/DD"></date-picker>
                </p>
                <p class="text-muted text-center">
                <input type="text" class="form-control" v-model="pelanggan" placeholder="Customer">
                </p>
                <p class="text-muted text-center">
                <input type="text" class="form-control" v-model="noNota" placeholder="No nota">
                </p>
                
                <input type="hidden" class="form-control" :value="subtotal" :name="totalTransaksi" >
                <h3 class="profile-username text-center">Total {{ subtotal  || 0 | currency }}</h3>
                
                <p class="text-muted text-center">
                <a href="#" @click="showModalBayar = true" class="btn btn-primary btn-block"><b>Payment</b></a>
                </p>
              

            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#activity" data-toggle="tab">Activity</a></li>
              <li><a href="#timeline" data-toggle="tab">Timeline</a></li>
              <li><a href="#settings" data-toggle="tab">Settings</a></li>
            </ul>
            <div class="tab-content">
              <div class="active tab-pane" id="activity">

                <!-- Post -->
                <a href="#"  @click="showModal = true" class="btn btn-md btn-success"><b>Add Item</b></a>
                <a href="#"  @click="showModalMenu = true" class="btn btn-md btn-success"><b>Add Menu</b></a>
                <a href="#"  @click="showModalMove = true" class="btn btn-md btn-success"><b>Pindah Meja</b></a>
                <router-link :to="{ name: 'meja' }" class="btn btn-primary btn-success">KEMBALI</router-link>
                isi tab aktiifiti
                <!-- /.post -->
                <table class="table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>Nama </th>
                                    <th>Qty</th>
                                    <th>Harga</th>
                                    <th>Total</th>
                                    <th>AKSI</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="trx in trxs" :key="trx.id">
                                    <td>{{ trx.nmBarangTmp }} </td>
                                    <td>{{ trx.qtyTmp}}</td>
                                    <td>{{ trx.hrgJualTmp | currency }}</td>
                                    <td>{{ trx.totalTmp | currency }}</td>
                                    <td class="text-center">
                                        <button @click.prevent="PostDeleteTrx(trx.id)" class="btn btn-sm btn-danger">HAPUS</button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="timeline">
                <!-- The timeline -->
                isi timeline
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
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>



<!-- modal start -->
  <div v-if="showModalMove">
    <transition name="modal">
      <div class="modal-mask">
        <div class="modal-wrapper">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" @click="showModalMove=false">
                  <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Pindah Ke Meja</h4>
              </div>
              <div class="modal-body">

                
                <select v-model='move1' class="form-control">
                  <option v-for='move1 in mejaKosong' v-bind:value='move1' :key="move1.id">Meja No.{{move1.noMeja}}</option>
                </select>

                <div v-if="move1">
                  <form  @submit.prevent="PostMove" >
                    <div class="form-group">
                      <input type="text" v-model="post.id">
                      <input type="text" class="form-control" v-model="move1.id">
                    </div>
                    <div class="form-group">
                    <button type="submit" class="btn btn-md btn-success">Pindah</button>
                    </div>
                  </form>
                </div>
                <div v-else>
                  no posts
                </div>
                

              </div>
            </div>
          </div>
        </div>
      </div>
    </transition>
  </div>
  <!------End Modal Move ----->


  <div v-if="showModal">
    <transition name="modal">
      <div class="modal-mask">
        <div class="modal-wrapper">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" @click="showModal=false">
                  <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Add Item</h4>
              </div>
              <div class="modal-body">

                <vue-single-select
                            v-model="post1"
                            :options="users"
                            :required="true"
                            optionLabel="nmBarang" 
                ></vue-single-select>
                
                <select v-model='post1' class="form-control">
                  <option v-for='post1 in users' v-bind:value='post1' :key="post1.id">{{post1.nmBarang}}</option>
                </select>

                <div v-if="post1">
                  <form  @submit.prevent="PostItem" >
                    <div class="form-group">
                      <input type="hidden" v-model="post.noMeja">
                      <input type="hidden" v-model="post.id">
                      <input type="hidden" v-model="noNota" placeholder="No nota">
                      <input type="hidden" v-model="post1.kdBarang">
                      <input type="hidden" v-model="post1.stkBarang">
                      <input type="hidden" class="form-control" :value="(post1.stkBarang - qtyBarang)" :name="sisaStok">
                      <input type="hidden" v-model="post1.ktgBarang" placeholder="type">
                      <input type="hidden" class="form-control" v-model="post1.nmBarang">

                    </div>
                    <div class="form-group">
                      <input type="text" class="form-control" v-model="post1.hrgJual">
                    </div>
                    <div class="form-group">
                      <input type="number" class="form-control" v-model="qtyBarang" placeholder="Qty" required>
                    </div>
                    <div class="form-group">
                      <input type="text" class="form-control" :value="(post1.hrgJual * qtyBarang) || 0" :name="total"  placeholder="total">
                    </div>
                    <div class="form-group">
                      <h3 class="profile-username text-center">Sisa sTok {{ post1.stkBarang - qtyBarang  }}</h3>
                    <button type="submit" data-dismiss="showModal" class="btn btn-md btn-success">Add</button>
                    </div>
                  </form>
                </div>
                <div v-else>
                  no posts
                </div>
                

              </div>
            </div>
          </div>
        </div>
      </div>
    </transition>
  </div>
  <div v-if="showModalMenu">
    <transition name="modal">
      <div class="modal-mask">
        <div class="modal-wrapper">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" @click="showModalMenu=false">
                  <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Add Menu</h4>
              </div>
              <div class="modal-body">
                
                <vue-single-select
                            v-model="post2"
                            :options="menus"
                            :required="true"
                            optionLabel="nmMenu" 
                ></vue-single-select>

                <select v-model='post2' class="form-control">
                  <option v-for='post2 in menus' v-bind:value='post2' :key="post2.id">{{post2.nmMenu}}</option>
                </select>

                <div v-if="post2">
                  <form  @submit.prevent="PostMenu" >
                    <div class="form-group">
                      <input type="hidden" v-model="post.noMeja">
                      <input type="hidden" v-model="noNota" placeholder="No nota">
                      <input type="hidden" v-model="post2.id">
                      <input type="hidden" v-model="post2.kdMenu">
                      <input type="hidden" class="form-control" v-model="post2.nmMenu">
                    </div>
                    <div class="form-group">
                      <input type="text" class="form-control" v-model="post2.hargaMenu">
                    </div>
                    <div class="form-group">
                      <input type="number" class="form-control" v-model="qtyBarang" placeholder="Qty" required>
                    </div>
                    <div class="form-group">
                      <input type="text" class="form-control" :value="(post2.hargaMenu * qtyBarang) || 0" :name="total"  placeholder="total">
                    </div>
                    <div class="form-group">
                    <button type="submit"  class="btn btn-md btn-success">Add</button>
                    </div>
                  </form>
                </div>
                <div v-else>
                  no posts
                </div>


              </div>
            </div>
          </div>
        </div>
      </div>
    </transition>
  </div>
  <div v-if="showModalBayar">
    <transition name="modal">
      <div class="modal-mask">
        <div class="modal-wrapper">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" @click="showModalBayar=false">
                  <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Add Payment</h4>
              </div>
              <div class="modal-body">
                

                <form  @submit.prevent="PostTransaksi" >
                <p class="text-muted text-center">
                <input type="hidden" class="form-control" v-model="tglNota" >
                <input type="text" class="form-control" v-model="pelanggan" placeholder="Customer">
                </p>
                <p class="text-muted text-center">
                <input type="text" class="form-control" v-model="noNota" placeholder="No nota">
                </p>
                <p class="text-muted text-center">
                <input type="text" class="form-control" v-model="subtotal">
                </p>
                <p class="text-muted text-center">
                <input type="number" class="form-control" v-model="pajak" placeholder="Tax">
                <input type="hidden" class="form-control" :value="(subtotal * pajak / 100 + subtotal)" :name="totalTransaksipjk" >
                </p>
                <p class="text-muted text-center">
                <input type="number" class="form-control" v-model="diskon" placeholder="Diskon">
                <input type="hidden" class="form-control" :value="((subtotal * pajak / 100 + subtotal) * diskon / 100)" :name="diskon1" >
                </p>

                <p class="text-muted text-center">
                <input type="number" class="form-control" v-model="totalBayar" placeholder="Bayar" required>
                </p>
                <p class="text-muted text-center">
                <input type="hidden" class="form-control" :value="((subtotal * pajak / 100 + subtotal) - ((subtotal * pajak / 100 + subtotal) * diskon / 100))  || 0 " :name="totalTransaksiBayar"  >
                </p>
                
                <h3 class="profile-username ">Total {{ ((subtotal * pajak / 100 + subtotal) - ((subtotal * pajak / 100 + subtotal) * diskon / 100))  || 0 | currency }}</h3>
                <h3 class="profile-username ">Kembali : {{ totalBayar - ((subtotal * pajak / 100 + subtotal) - ((subtotal * pajak / 100 + subtotal) * diskon / 100))  || 0 | currency }}</h3>
                <p class="text-muted text-center">
                <button type="submit"  class="btn btn-md btn-success" >Bayar</button>                
                </p>
              </form>

              <div id="printMe" ref="printMu">
                <!-- info row -->
               <address>
                    <strong>Ala Desa.</strong><br>
                    Sangeh<br>

                    Phone: (804) 123-5432<br>
                    Email: info@almasaeedstudio.com
                  </address>
              <div class="row invoice-info">
                <div class="col-sm-4 invoice-col">
                
                  <address>
                    <strong>Customer :</strong> {{pelanggan}}<br>
                    <b> Tgl : </b>{{tglNota}}<br>
                    <b> Meja No : </b>{{post.noMeja}}<br>
                  </address>
                </div>
                <!-- /.col -->
                <div class="col-sm-4 invoice-col">
                  <b>No Invoice : </b>{{noNota}}<br>
                  <b>Kasir : </b>{{$session.get('user')}}
                  
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->
                
                <div class="row">
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
                                <tr v-for="trx in trxs" :key="trx.id">
                                    <td>{{ trx.nmBarangTmp }} </td>
                                    <td>{{ trx.qtyTmp}}</td>
                                    <td>{{ trx.hrgJualTmp | currency }}</td>
                                    <td>{{ trx.totalTmp | currency }}</td>
                                </tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="3">subTotal :</th>
                                        <th>{{subtotal | currency}}</th>
                                    </tr>
                                    <tr>
                                        <th colspan="3">Tax & Service :</th>
                                        <th>{{ (subtotal * pajak / 100 ) | currency}}</th>
                                    </tr>
                                    <tr>
                                        <th colspan="3">Discount</th>
                                        <th>{{ ((subtotal * pajak / 100 + subtotal) * diskon / 100) | currency}}</th>
                                    </tr>
                                    <tr>
                                        <th colspan="3">subTotal :</th>
                                        <th>{{ ((subtotal * pajak / 100 + subtotal) - ((subtotal * pajak / 100 + subtotal) * diskon / 100))  || 0 | currency }}</th>
                                    </tr>
                                    <tr>
                                        <th colspan="3">Payment :</th>
                                        <th>{{totalBayar | currency}}</th>
                                    </tr>
                                    <tr>
                                        <th colspan="3">Kembalian :</th>
                                        <th>{{ totalBayar - ((subtotal * pajak / 100 + subtotal) - ((subtotal * pajak / 100 + subtotal) * diskon / 100))  || 0 | currency }}</th>
                                    </tr>
                                    <tr>
                                        <th colspan="5">Terima Kasih Telah Berbelanja</th>

                                    </tr>
                                </tfoot>
                            </table>
                </div>
                </div>

              </div>


              </div>
            </div>
          </div>
        </div>
      </div>
    </transition>
  </div>
<!---- Modal End ---->
                    
    </div>


    

</template>

<style type="text/css">

@media print {
    .print-only { display: block; }
}

@media screen {
    .print-only { display: none;}             
}
</style>

<script>
  import DatePicker from 'vue2-datepicker';
  import 'vue2-datepicker/index.css';
  import VueSingleSelect from "vue-single-select";
 
  
    export default {
      components: { DatePicker, VueSingleSelect, },
        data() {
            return {
                post: {},
                move1: null,
                post1: null,
                post2: null,
                users: {},
                menus: {},
                trxs: {},
                mejaKosong: {},
                validation: [],
                showModalMove: false,
                showModal: false,
                showModalMenu: false,
                showModalBayar: false,
                nmBarang: '',
                idBarang: '',
                hargaJual: '',
                qtyBarang: '',
                sisaStok: '',
                noNota: '',
                pelanggan: 'Cash',
                noMeja: '',
                total: '',
                subtotal: '',
                pajak: '0',
                diskon: '0',
                diskon1: '',
                totalTransaksi: '',
                totalTransaksipjk: '',
                totalBayar: '',
                kembalianBayar: '0',
                totalTransaksiBayar: '',
                type: '',
                brg: '',
                //optionLabel: users.nmBarang,
                tglNota: new Date().toJSON().slice(0,10).replace(/-/g,'/'),
                
            }
        },
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            }
        },
        created() {
            let uri = `/api/meja/${this.$route.params.id}`;
            this.axios.get(uri).then((response) => {
                this.post = response.data.data;
            });
            this.loadMejaKosong()
            this.loadTotal()
            this.loadNota()
            this.loadData()
            this.loadDataMenu()
            this.loadDataTransaksi()
            
            
        },
        watch: {
          post: function() {
            this.$emit('input', this.post);
          }
        },
        //props: ['value'],
        props: ['optionLabel', 'value'],
        

        methods: {
            cekStok() {
                this.brg = this.post1 - this.qtyBarang;
            },

            PostUpdate() {
                let uri = `/api/posts/update/${this.$route.params.id}`;
                this.axios.post(uri, this.post)
                    .then((response) => {
                        this.$router.push({name: 'posts'});
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            },
            loadTotal:function(){
                let uri = `/api/totalTrx/${this.$route.params.id}`;
                this.axios.post(uri).then(response => {
                  this.subtotal = response.data.subTotal;
                }).catch(error => {
                    console.log(error.response)
                });
            },
            loadNota:function(){
                let uri = `/api/noNota/${this.$route.params.id}`;
                this.axios.post(uri).then(response => {
                this.noNota = response.data.noNota;
                
            });
            },
            loadData:function(){
                let uri = '/api/posts';
                this.axios.get(uri).then(response => {
                this.users = response.data.data;
                
            });
            },
            loadDataMenu:function(){
                let uri = '/api/menu';
                this.axios.get(uri).then(response => {
                this.menus = response.data.data;
                
            });
            },
            loadDataTransaksi:function(){
                let uri = `/api/transaksi/${this.$route.params.id}`;
                this.axios.post(uri).then(response => {
                this.trxs = response.data.data;
                
                
            });
            },
            PostMove() {
                let uri = '/api/meja/pindah';
                this.axios.post(uri, {
                  noMejaLama: this.post.id,
                  noMejaBaru: this.move1.id,
                })
                    .then((response) => {
                        this.$router.push({name: 'meja'});
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            },
            loadMejaKosong:function(){
                let uri = '/api/mejakosong/';
                this.axios.get(uri).then(response => {
                this.mejaKosong = response.data.data;
                
                
            });
            },
            PostDeleteTrx(id)
            {
                this.axios.delete(`/api/orderDelete/${id}`)
                    .then(response => {
                        alert('Berhasil Di Hapus');
                        this.loadDataTransaksi()
                        this.loadTotal()
                    }).catch(error => {
                    
                });
            },
            PostItem() {
                let uri = '/api/addItem/store';
                this.axios.post(uri, 
                {
                    noNota: this.noNota,
                    noMeja: this.post.id,
                    nmBarang: this.post1.nmBarang,
                    idBarang: this.post1.kdBarang,
                    hargaJual: this.post1.hrgJual,
                    qtyBarang: this.qtyBarang,
                    total: this.post1.hrgJual * this.qtyBarang,
                    //sisaStok: this.post1.stkBarang - this.qtyBarang,
                    type: this.post1.ktgBarang,
                    tglNota: this.tglNota,
                })
                    .then((response) => {
                        //alert('sukses donkkkkkkkk');
                        alert('sukses ditambahkan');
                        this.loadDataTransaksi()
                        this.loadTotal()
                        this.showModal = false
                    });
                
            },
            PostMenu() {
                let uri = '/api/addMenu/store';
                this.axios.post(uri, 
                {
                    noNota: this.noNota,
                    noMeja: this.post.id,
                    nmBarang: this.post2.nmMenu,
                    idBarang: this.post2.kdMenu,
                    hargaJual: this.post2.hargaMenu,
                    qtyBarang: this.qtyBarang,
                    total: this.post2.hargaMenu * this.qtyBarang,
                    type: this.post2.kdMenu,
                    tglNota: this.tglNota,
                })
                    .then((response) => {
                        //alert('sukses donkkkkkkkk');
                        alert('sukses ditambahkan');
                        this.loadDataTransaksi()
                        this.loadTotal()
                        this.showModalMenu = false
                    });
                
            },
            PostTransaksi() {
                let uri = '/api/addTransaksi/store';
                this.axios.post(uri, 
                {
                    noNota: this.noNota,
                    noMeja: this.post.id,
                    pelanggan: this.pelanggan,
                    tglNota: this.tglNota,
                    taxNota: (this.subtotal * this.pajak / 100),
                    diskonNota: ((this.subtotal * this.pajak / 100 + this.subtotal) * this.diskon / 100),
                    totalNota: ((this.subtotal * this.pajak / 100 + this.subtotal) - ((this.subtotal * this.pajak / 100 + this.subtotal) * this.diskon / 100)),
                    bayarNota: this.totalBayar,
                    userNota: this.$session.get('userId'),
                    kembalianNota: this.totalBayar - ((this.subtotal * this.pajak / 100 + this.subtotal) - ((this.subtotal * this.pajak / 100 + this.subtotal) * this.diskon / 100)),
                    
                })
                    .then((response) => {
                        //this.print (ref)
                        window.print()
                        //this.print(this.$refs['printMu'])
                        //alert('Transaksi Selesai');
                        this.$router.push({name: 'meja'});
                    });
                
            },
        },
        
    }
</script>
