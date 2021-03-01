<template>
    <div class="mt-3">
        <section class="content">
      <div class="row">
        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">

              <form @submit.prevent="PostUpdate">

                            <div class="form-group">
                                <label>Nama Menu</label>
                                
                                <input type="text" class="form-control" v-model="post.nmMenu"
                                       placeholder="Masukkan Nama">
                                <div v-if="validation.nmMenu">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.nmMenu[0] }}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Harga</label>
                                <input type="text" class="form-control" v-model="post.hargaMenu"
                                       placeholder="Harga">
                                <div v-if="validation.hargaMenu">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.hargaMenu[0] }}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Stok</label>
                                <input type="text" class="form-control" v-model="post.stokMenu"
                                       placeholder="Stok">
                                <div v-if="validation.stokMenu">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.stokMenu[0] }}
                                    </div>
                                </div>
                            </div>
                            

                            <div class="form-group">
                                <router-link :to="{ name: 'menu' }" class="btn btn-primary btn-success">KEMBALI</router-link>
                                <button type="submit" class="btn btn-md btn-success">UPDATE</button>
                                <button type="reset" class="btn btn-md btn-danger">RESET</button>
                            </div>

                        </form>

            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#activity" data-toggle="tab">Komposisi</a></li>
            </ul>
            <div class="tab-content">
              <div class="active tab-pane" id="activity">
                <!-- Post -->
                <a href="#"  @click="showModal = true" class="btn btn-md btn-success"><b>Add Item</b></a>
                
                <table class="table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>Nama </th>
                                    <th>Qty</th>
                                    <th>Satuan</th>
                                    <th>Harga</th>
                                    <th>Total</th>
                                    <th>AKSI</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="post in komposisis" :key="post.id">
                                    <td>{{ post.nmBarang }}</td>
                                    <td>{{ post.qtyBarang }}</td>
                                    <td>{{ post.satuanBarang }}</td>
                                    <td>{{ post.hargaBarang | currency }}</td>
                                    <td>{{ post.totalBarang | currency }}</td>
                                    <td class="text-center">
                                        <button @click.prevent="PostDelete(post.id)" class="btn btn-sm btn-danger">HAPUS</button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                    <h3 class="profile-username text-center">Total Cost Untuk Menu : {{ this.tot | currency }}</h3>
                <!-- /.post -->
              </div>
              <!-- /.tab-pane -->
              <!-- /.tab-pane -->

              
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
                  <option v-for='post1 in users' v-bind:value='post1' :key="post1.id" >{{post1.nmBarang}}</option>
                </select>

                <div v-if="post1">
                  <form  @submit.prevent="PostItem" >
                    <div class="form-group">
                        <input type="hidden" ref="kodebarang" class="form-control" v-model="post1.nmBarang">
                    </div>
                    <div class="form-group">
                        <input type="hidden" class="form-control" v-model="post1.kdBarang">
                        <input type="hidden" class="form-control" v-model="post1.satuanBarang">
                        <input type="text" class="form-control" v-model="post1.hrgJual" placeholder="Harga">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="qtyBarang" v-model="qtyBarang" placeholder="Qty">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" :value="post1.hrgJual * qtyBarang" :name="totalBarang">
                    </div>
                    <button type="submit"  class="btn btn-md btn-success">Add</button>
                  </form>
                </div>
                <div v-else>
                  no Slected
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

<script>
 import VueSingleSelect from "vue-single-select";
    export default {
components: { VueSingleSelect },
        data() {

            return {
                post: {},
                validation: [],
                post1: null,
                komposisis: {},
                users: {},
                showModal: false,
                idMenu: '',
                idBarang: '',
                hargaBarang: '',
                totalBarang: '',
                qtyBarang: '',
                tot: '',
            }
        },
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            }
        },
        created() {
            let uri = `/api/menu/${this.$route.params.id}`;
            this.axios.get(uri).then((response) => {
                this.post = response.data.data;
            });
            this.loadData()
            this.loadDataKomposisi()
        },
        watch: {
          post: function() {
            this.$emit('input', this.post);
          }
        },
        props: ['value'],

        mounted () {
            //this.intervalFetchData1();
            //this.intervalFetchData();
            //this.bindings()
            this.loadData()
            this.loadDataKomposisi()
        },

        methods: {
            PostUpdate() {
                let uri = `/api/menu/update/${this.$route.params.id}`;
                this.axios.post(uri, this.post)
                    .then((response) => {
                        this.$router.push({name: 'menu'});
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            },
            loadData:function(){
                let uri = '/api/semuabarang';
                this.axios.get(uri).then(response => {
                this.users = response.data.data;
                
                });
            },
            
            loadDataKomposisi:function(){
                let uri = `/api/komposisi/detail/${this.$route.params.id}`;
                this.axios.post(uri).then(response => {
                this.komposisis = response.data.data;
                this.tot = response.data.sumtotal;
                
            });
            },
            PostDelete(id)
            {
                this.axios.delete(`/api/komposisi/${id}`)
                    .then(response => {
                        alert('Berhasil Di Hapus');
                        this.loadDataKomposisi()
                    }).catch(error => {
                    
                });
            },
            PostItem() {
                let uri = '/api/komposisi/store';
                this.axios.post(uri, 
                {
                    idMenu: this.post.kdMenu,
                    idBarang: this.post1.kdBarang,
                    hargaBarang: this.post1.hrgJual,
                    satuanBarang: this.post1.satuanBarang,
                    qtyBarang: this.qtyBarang,
                    toalBarang: this.qtyBarang * this.post1.hrgJual,
                })
                    .then((response) => {
                        alert('sukses ditambahkan');
                        this.loadDataKomposisi()
                        this.showModal = false
                    });
                
            }
        }
    }
</script>
