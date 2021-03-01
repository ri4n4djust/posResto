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
                <vue-single-select
                            v-model="post"
                            :options="posts"
                            :required="true"
                            optionLabel="nmSupplier" 
                ></vue-single-select>
                

                
                </p>
                <p class="text-muted text-center">
                <input type="hidden" class="form-control" v-model="post.kdSupplier" placeholder="No nota">
                </p>
                <p class="text-muted text-center">
                <input type="text" class="form-control" v-model="noNotaPembelian" placeholder="No nota">
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

                 
                  <form  @submit.prevent="PostItemPembelian" >
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
                        <div class="col-xs-3">
                          <button type="submit" class="btn btn-md btn-success">Add</button>                        
                        </div>
                    </div>
                    
                    </form>
                    </div>
                    
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
                                <tr v-for="pe in pem" :key="pe.id">
                                    <td>{{ pe.nmBarang }} </td>
                                    <td>{{ pe.qtyBeli}}</td>
                                    <td>{{ pe.hrgPokok | currency }}</td>
                                    <td>{{ pe.totalBeli | currency }}</td>
                                    <td class="text-center">
                                        <button @click.prevent="PostDeleteTrx(pe.id)" class="btn btn-sm btn-danger">HAPUS</button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
              
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>

 <!-- /Modal -->
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
                

                <form  @submit.prevent="PostPembelian" >
                <p class="text-muted text-center">
                </p>
                <p class="text-muted text-center">
                  <vue-single-select
                            v-model="post"
                            :options="posts"
                            :required="true"
                            optionLabel="nmSupplier" 
                ></vue-single-select>

                <input type="hidden" class="form-control" v-model="post.id" placeholder="Supplier" required>
                <input type="text" class="form-control" v-model="tglPembelian"  >
                </p>
                <p class="text-muted text-center">
                <input type="text" class="form-control" v-model="noNotaPembelian" placeholder="No nota">
                </p>
                <p class="text-muted text-center">
                <input type="text" class="form-control" v-model="subtotal">
                </p>
               
                <p class="text-muted text-center">
                <input type="number" class="form-control" v-model="totalBayar" placeholder="Bayar" required>
                </p>
                      
                <h3 class="profile-username ">Total {{ subtotal || 0 | currency }}</h3>
                <h3 class="profile-username ">Kembali : {{ totalBayar - subtotal  || 0 | currency }}</h3>
                <p class="text-muted text-center">
                <button type="submit"  class="btn btn-md btn-success">Bayar</button>                
                </p>
              </form>


              </div>
            </div>
          </div>
        </div>
      </div>
    </transition>
  </div>

    
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
                posts: {},
                post1: {},
                users: {},
                pem: {},
                qtyBeli: '',
                hrgBeli: '',
                subTotal: '',
                totalBayar: '',
                subtotal: '',
                ntp:'',
                noNotaPembelian: '',
                totalPembelian: '',
                tglPembelian: new Date().toJSON().slice(0,10).replace(/-/g,'/'),
                validation: [],
                showModal: false,
                showModalMenu: false,
                showModalBayar: false,
            }
        },

       watch: {
          post: function() {
            this.$emit('input', this.post);
          }
        },
        //props: ['value'],
        props: ['value'],

        methods: {
            loadTotal:function(){
                let uri = '/api/totalTrxPembelian';
                this.axios.post(uri, {
                    ntp: this.noNotaPembelian,
                }).then(response => {
                  //alert('mount' + this.noNotaPembelian)
                this.subtotal = response.data.subTotalBeli;
                
            });
            },
            loadNotaPembelian:function(){
                let uri = `/api/kodePembelian/`;
                this.axios.get(uri).then(response => {
                this.noNotaPembelian = response.data.kdPembelian;
                
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
            loadTransaksiPembelian:function(){
                let uri = '/api/dataPembelian/'+ this.noNotaPembelian;
                this.axios.post(uri).then(response => {
                    this.pem = response.data.data;
                   // alert('no nota '+ this.data.noNota);
            });
            },
            PostDeleteTrx(id)
            {
              if(confirm("Do you really want to delete?")){
                this.axios.delete(`/api/pembelianDelete/${id}`)
                    .then(response => {
                        alert('Berhasil Di Hapus');
                        this.loadTotal()
                        this.loadTransaksiPembelian()
                    }).catch(error => {
                    
                });
              }
            },
            PostItemPembelian() {
                let uri = '/api/addItemPembelian/store';
                this.axios.post(uri, 
                {
                    noNotaPembelian: this.noNotaPembelian,
                    kdBarang: this.post1.kdBarang,
                    hrgBeli: this.post1.hrgPokok,
                    qtyBeli: this.qtyBeli,
                    totalBeli: this.post1.hrgPokok * this.qtyBeli,
                    tglNotaPembelian: this.tglPembelian,
                })
                    .then((response) => {
                        this.loadTotal()
                        this.loadTransaksiPembelian()
                        alert('sukses donkkkkkkkk');
                        //this.loadTransaksiPenjualan()
                        //this.loadTotal()
                    });
                
            },
            PostPembelian() {
                let uri = '/api/addPembelian/store';
                this.axios.post(uri, 
                {
                    noNotaPembelian: this.noNotaPembelian,
                    idSupplier: this.post.kdSupplier,
                    tglNotaPembelian: this.tglPembelian,
                    totalNotaPembelian: this.subtotal,
                    
                })
                    .then((response) => {
                        alert('Transaksi Selesai');
                        this.$router.go(0);
                        //this.$router.push({name: 'pembelian'});
                    });
                
            }
        },
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            }
        },
        created() {
            this.loadNotaPembelian()
            this.loadBarang()
            this.LoadSupplier()
            this.loadTransaksiPembelian()
            this.loadTotal()
            
            
        },
    }
</script>
