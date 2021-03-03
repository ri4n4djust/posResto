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
                                <label>Username </label>
                                <input type="text" class="form-control" v-model="post.username" @keydown.space.prevent >
                                <div v-if="validation.name">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.name[0] }}
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Nama </label>
                                <input type="text" class="form-control" v-model="post.name"
                                       placeholder="Masukkan Nama">
                                <div v-if="validation.name">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.name[0] }}
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Email</label>
                                <input type="text" class="form-control" v-model="post.email"
                                       placeholder="Harga">
                                <div v-if="validation.email">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.email[0] }}
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Password</label>
                                <input type="text" class="form-control" v-model="post.password"
                                       placeholder="Stok">
                                <div v-if="validation.password">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.password[0] }}
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                            <label>Select Role: </label>
                            <select class='form-control' v-model='post.role' required>
                                <option  value='Admin' >Admin</option>
                                <option value='Operator' >Operator</option>
                                <option value='Kasir' >Kasir</option>
                            </select>
                            </div>
                            

                            <div class="form-group">
                                <router-link :to="{ name: 'user' }" class="btn btn-primary btn-success">KEMBALI</router-link>
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
       
      </div>
      <!-- /.row -->

    </section>




                    
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

            }
        },
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            }
        },
        created() {
            let uri = `/api/user/${this.$route.params.id}`;
            this.axios.get(uri).then((response) => {
                this.post = response.data.data;
            });
            this.loadData()
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
        },

        methods: {
            PostUpdate() {
                let uri = `/api/user/update/${this.$route.params.id}`;
                this.axios.post(uri, this.post)
                    .then((response) => {
                        this.$router.push({name: 'menu'});
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            },
            loadData:function(){
                let uri = '/api/user';
                this.axios.get(uri).then(response => {
                this.users = response.data.data;
                
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
        }
    }
</script>
