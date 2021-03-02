<template>
    <div class="mt-3">

        <section class="content">

      <div class="row">
        <div class="col-md-3">

          <!-- About Me Box -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Stok Opname barang</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">

                <p class="text-muted text-center">
                <date-picker v-model="tglStokOpname" value-type="format" format="YYYY/MM/DD"></date-picker>
                </p>
                <p class="text-muted text-center">
                <input type="text" class="form-control" v-model="noStokOpname" placeholder="No nota">
                </p>                
                <p class="text-muted text-center">
                <a href="#" @click="showModalBayar = true" class="btn btn-primary btn-block"><b>Simpan</b></a>
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
                        <div class="col-xs-2">
                          <label>Nama</label>
                        <select v-model='post1' class="form-control" >
                        <option v-for='post1 in users' v-bind:value='post1' :key="post1.id" >{{post1.nmBarang}}</option>
                        </select>
                        </div>
                        <div class="col-xs-1">
                          <label>Stok</label>
                        <input type="text" v-model="post1.stkBarang " class="form-control" placeholder="stok" disabled>
                        </div>
                        <div class="col-xs-2">
                          <label>Satuan</label>
                        <input type="text" v-model="post1.satuanBarang " class="form-control" placeholder="stok" disabled>
                        </div>
                        <div class="col-xs-1">
                          <label>Real</label>
                        <input type="text" v-model="qtyGudang" class="form-control" placeholder="Qty">
                        </div>
                        <div class="col-xs-2">
                          <label>Selisih</label>
                        <input type="text" :value="(qtyGudang - post1.stkBarang  ) || 0" :name="selisih" class="form-control" placeholder="Selisih" disabled>
                        </div>
                        <div class="col-xs-2">
                          <label>Keterangan</label>
                        <input type="text" v-model="keterangan" class="form-control" placeholder="Ket">
                        </div>
                        <div class="col-xs-2">
                          <label>Aksi</label>
                          <button type="submit" class="btn btn-md btn-success form-control">Add</button>                        
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
                qtyGudang: '',
                keterangan: '',
                ntp:'',
                noNotaPembelian: '',
                totalPembelian: '',
                tglStokOpname: new Date().toJSON().slice(0,10).replace(/-/g,'/'),
                validation: [],
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
                    noStokOpname: this.noStokOpname,
                    kdBarang: this.post1.kdBarang,
                    qtyGudang: this.qtyGudang,
                    selisihStok: this.selisihStok,
                    keteranganStok: this.keterangan,
                    tglStokOpname: this.tglStokOpname,
                    satuanStok: this.satuanStok,
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
