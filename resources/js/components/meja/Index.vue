<template>

                    <div class="card-body">
                        <h3>
                        <router-link :to="{ name: 'createMeja' }" class="btn btn-md btn-success">TAMBAH MEJA</router-link>
                        </h3>

                        <div v-for="post in posts" :key="post.id" class="col-lg-3 col-xs-6" >
                        <!-- small box -->
                            <div v-if="post.status === '0' ">
                                <div class="small-box bg-green">
                                    <div class="inner">
                                    <h3>Meja No :<br>{{ post.noMeja }}</h3>

                                    <p>{{ post.pax }}</p>
                                    </div>
                                    <div class="icon">
                                    <i class="ion ion-bag"></i>
                                    </div>
                                    
                                    <router-link :to="{name: 'editMeja', params: { id: post.id }}" class="btn btn-md btn-primary">EDIT</router-link>
                                    <button @click.prevent="PostCekIn(post.id)" class="btn btn-md btn-success">CEK IN</button>
                                    <a href="#"  @click="showModalCekin.show(post.id)" class="btn btn-md btn-success"><b>Cek In</b></a>
                                        
                                </div>
                            </div>
                            <div v-else>
                                <div class="small-box bg-red">
                                    <div class="inner">
                                    <h3>Meja No :<br>{{ post.noMeja }}</h3>

                                    <p>{{ post.pax }}</p>
                                    </div>
                                    <div class="icon">
                                    <i class="ion ion-bag"></i>
                                    </div>
                                    
                                   
                                    <router-link :to="{name: 'detailMeja', params: { id: post.id }}" class="btn btn-md btn-primary">Detail</router-link>
                                    <button @click.prevent="CancelCekIn(post.id)" class="btn btn-md btn-danger">Cancel</button>
                              

                                        
                                </div>
                            </div>
                        </div>
    
<!-- modal start -->
  <div v-if="showModalCekin">
    <transition name="modal">
      <div class="modal-mask">
        <div class="modal-wrapper">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" @click="showModalCekin=false">
                  <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Waiter</h4>
              </div>
              <div class="modal-body">

                
                <select v-model='waiter' class="form-control">
                  <option v-for='waiter in waiters' v-bind:value='waiter' :key="waiter.id">{{waiter.name}}</option>
                </select>
                <div v-if="waiter">
                  <form  @submit.prevent="PostWaiter" >
                    <div class="form-group">
                      <input type="text" class="form-control" v-model="waiter.id">
                      <input type="text" class="form-control" v-model="post.id"> {{post.noMeja}}
                    </div>
                    <div class="form-group">
                    <button type="submit" class="btn btn-md btn-success">Cek In</button>
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
    
    
    </div>

</template>



<script>
    export default {
        data() {
            return {
                posts: [],
                post:{},
                waiter:{},
                waiters:{},
                showModal: false,
                showModalCekin: false,
                status: '1',
                paxMeja: '',
            }
        },
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            }
        },
        created() {
            let uri = '/api/meja';
            this.axios.get(uri).then(response => {
                this.posts = response.data.data;
            });
            this.loadWaiter();
        },
        watch: {
          post: function() {
            this.$emit('input', this.post);
          }
        },
        props: ['value'],

        methods: {
            loadWaiter:function(){
                let uri = '/api/user/';
                this.axios.get(uri).then(response => {
                this.waiters = response.data.data;
            });
            },

            PostCekIn(id) {
                let uri = '/api/meja/cekin/'+ id;
                this.axios.post(uri, {
                    status: '1'
                })
                    .then((response) => {
                        alert('sukses cek in')
                        this.loadData();
                    }).catch(error => {
                });
            },
            CancelCekIn(id) {
                let uri = '/api/meja/cancelcekin/'+ id;
                this.axios.post(uri, {
                    status: '0'
                })
                    .then((response) => {
                        alert('Cancel cek in')
                        this.loadData();
                    }).catch(error => {
                });
            },
            PostDelete(id, index)
            {
                this.axios.delete(`/api/meja/${id}`)
                    .then(response => {
                        this.posts.splice(index, 1);
                    }).catch(error => {
                    alert('system error!');
                });
            },
            loadData: function () {
                let uri = '/api/meja';
                this.axios.get(uri).then(response => {
                    this.posts = response.data.data;
                });
            },
            intervalFetchData: function () {
            setInterval(() => {    
                this.loadData();
                }, 3000);    
            },
            
        },
        mounted () {
            //this.intervalFetchData1();
            //this.intervalFetchData();
            //this.bindings()
            this.loadData()
        },

        beforeDestroy () {
            clearInterval(this.posts)
        },
    }
</script>