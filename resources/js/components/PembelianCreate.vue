<template>
    <div class="mt-3">

        <section class="content">

      <div class="row">
        <div class="col-md-3">

          <!-- About Me Box -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Pembelian</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">

              
                <p class="text-muted text-center">
                <date-picker v-model="tglPembelian" value-type="format" format="YYYY/MM/DD"></date-picker>
                </p>
                <p class="text-muted text-center">
                <input type="text" class="form-control" v-model="supplier" placeholder="supplier">
                </p>
                <p class="text-muted text-center">
                <input type="text" class="form-control" v-model="noPembelian" placeholder="No nota">
                </p>
                
                <input type="hidden" class="form-control" :value="subtotal" :name="totalPembelian" >
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

                <div class="box box-danger">
                    <div class="box-header with-border">
                    <h3 class="box-title">Cari Barang</h3>
                    </div>
                    <div class="box-body">

                      <vue-single-select
                            v-model="post1"
                            :options="users"
                            :required="true"
                            optionLabel="nmBarang" 
                ></vue-single-select>

                 

                    <div class="row">
                        <div class="col-xs-3">
                        <select v-model='post1' class="form-control">
                        <option v-for='post1 in users' v-bind:value='post1' :key="post1.id">{{post1.nmBarang}}</option>
                        </select>
                        </div>
                        <div class="col-xs-3">
                        <input type="text" v-model="post1.hrgPokok" class="form-control" placeholder="Harga">
                        </div>
                        <div class="col-xs-3">
                        <input type="text" v-model="qtyBeli" class="form-control" placeholder="Qty">
                        </div>
                        <div class="col-xs-3">
                        <input type="text" :value="(post1.hrgPokok * qtyBeli) || 0" :name="subTotal" class="form-control" placeholder="Total">
                        </div>
                    </div>
                    
                    </div>
                    <button type="submit" class="btn btn-md btn-success">Add</button>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->

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

    
    
    </div>
      
  
  
</template>


<script>
  import DatePicker from 'vue2-datepicker';
  import 'vue2-datepicker/index.css';
  import VueSingleSelect from "vue-single-select";
  
    export default {
        components: { DatePicker, VueSingleSelect },         
        data() {
            return {
                post: {},
                post1: {},
                users: {},
                tglPembelian: new Date().toJSON().slice(0,10).replace(/-/g,'/'),
                validation: [],
            }
        },
        created() {
            this.loadBarang()
            
            
        },
        watch: {
          post: function() {
            this.$emit('input', this.post);
          }
        },
        //props: ['value'],
        props: ['optionLabel', 'value'],

        methods: {
            loadTotal:function(){
                let uri = `/api/totalTrxPembelian/${this.$route.params.id}`;
                this.axios.post(uri).then(response => {
                this.subtotal = response.data.subTotal;
                
            });
            },
            loadNotaPembelian:function(){
                let uri = `/api/noNotaPembelian/${this.$route.params.id}`;
                this.axios.post(uri).then(response => {
                this.noNota = response.data.noNota;
                
            });
            },
            LoadSupplier() {
            let uri = '/api/supplier';
            this.axios.get(uri).then(response => {
                this.posts = response.data.data;
            });
            },
            loadBarang:function(){
                let uri = '/api/posts';
                this.axios.get(uri).then(response => {
                this.users = response.data.data;
                
            });
            },
            loadTransaksiPenjualan:function(){
                let uri = `/api/datapembelian/${this.$route.params.id}`;
                this.axios.post(uri).then(response => {
                this.trxs = response.data.data;
            });
            },
            PostDeleteTrx(id)
            {
                this.axios.delete(`/api/pembelianDelete/${id}`)
                    .then(response => {
                        alert('Berhasil Di Hapus');
                        this.loadDataTransaksi()
                        this.loadTotal()
                    }).catch(error => {
                    
                });
            },
            PostItemPembelian() {
                let uri = '/api/addItemPembelian/store';
                this.axios.post(uri, 
                {
                    noPembelian: this.noPembelian,
                    idBarang: this.post1.kdBarang,
                    hargaBeli: this.post1.hargaBeli,
                    qtyBeli: this.qtyBeli,
                    total: this.post1.hrgBeli * this.qtyBeli,
                })
                    .then((response) => {
                        //alert('sukses donkkkkkkkk');
                        this.loadTransaksiPenjualan()
                        this.loadTotal()
                    });
                
            },
            SimpanTransaksiPembelian() {
                let uri = '/api/addTransaksi/store';
                this.axios.post(uri, 
                {
                    noNota: this.noNota,
                    supplier: this.pelanggan,
                    tglNota: this.tglNota,
                    totalNota: ((this.subtotal * this.pajak / 100 + this.subtotal) - ((this.subtotal * this.pajak / 100 + this.subtotal) * this.diskon / 100)),
                    bayarNota: this.totalBayar,
                    kembalianNota: this.totalBayar - ((this.subtotal * this.pajak / 100 + this.subtotal) - ((this.subtotal * this.pajak / 100 + this.subtotal) * this.diskon / 100)),
                    
                })
                    .then((response) => {
                        alert('Transaksi Selesai');
                        this.$router.push({name: 'meja'});
                    });
                
            }
        }
    }
</script>
