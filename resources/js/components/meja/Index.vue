<template>

                    <div class="card-body">
                      <status-login></status-login>
                        <h3>
                        <router-link :to="{ name: 'createMeja' }" class="btn btn-md btn-success">TAMBAH MEJA</router-link>
                        </h3>

                        <div v-for="post in posts" :key="post.id" class="col-lg-3 col-xs-6" >
                        <!-- small box -->
                            <div v-if="post.status === '0' ">
                                <div class="small-box bg-green">
                                    <div class="inner">
                                    <h3>Meja:{{ post.noMeja }}</h3>
                                    <p>{{ post.paxMeja }}</p>
                                    <router-link :to="{name: 'editMeja', params: { id: post.id }}" class="btn btn-md btn-primary">EDIT</router-link>
                                    
                                    <button @click="showModalCekin = post.id" class="btn btn-md btn-success">
                                      <font-awesome-icon icon="user-secret" />
                                      CEK IN</button>
                                    </div>
                                    <div class="icon">
                                    <i class="ion ion-bag"></i>
                                    </div>
                                    
                                </div>
                            </div>
                            <div v-else>
                                <div class="small-box bg-red">
                                    <div class="inner">
                                    <h3>Meja:{{ post.noMeja }}</h3>
                                    <p>{{ post.paxMeja }}</p>
                                    <router-link :to="{name: 'detailMeja', params: { id: post.id }}" class="btn btn-md btn-primary">Detail</router-link>
                                    <button @click.prevent="CancelCekIn(post.id)" class="btn btn-md btn-danger">Cancel</button>
                                    </div>
                                    <div class="icon">
                                    <i class="ion ion-bag"></i>
                                    </div>
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
                <div v-if="waiter">
                  <form  @submit.prevent="PostCekIn" >
                    <p class="text-muted text-center">
                      <div class="input-group">
                        <span class="input-group-addon">Waiter Name</span>
                      <select v-model='waiter' class="form-control" required>
                        <option v-for='waiter in waiters' v-bind:value='waiter' :key="waiter.id">{{waiter.name}}</option>
                      </select>
                      </div>
                    <div class="input-group">
                      <input type="hidden" class="form-control" v-model="waiter.id">
                      <input type="hidden" name="noTable" :value="showModalCekin">
                    </div>
                    <p class="text-muted text-center">
                    <div class="input-group">
                      <span class="input-group-addon">Pax</span>
                      <input type="text" class="form-control" v-model="paxMeja" @keypress="onlyNumber">
                    </div>
                    <p class="text-muted text-center">
                    <div class="input-group">
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
                selectedItem: undefined,
                status: '1',
                paxMeja: '',
                my_timer: 0,
            }
        },
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            }
        },
        created() {
            this.loadData();
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
            onlyNumber ($event) {
                //console.log($event.keyCode); //keyCodes value
                let keyCode = ($event.keyCode ? $event.keyCode : $event.which);
                if ((keyCode < 48 || keyCode > 57) && keyCode !== 46) { // 46 is dot
                    $event.preventDefault();
                }   
            },
            PostCekIn() {
                let uri = '/api/meja/cekin/';
                this.axios.post(uri, {
                    idMeja: this.showModalCekin,
                    idWaiter: this.waiter.id,
                    status: '1',
                    paxMeja: this.paxMeja,
                })
                    .then((response) => {
                        this.showModalCekin = false;
                        //alert('sukses cek in')
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
                        //alert('Cancel cek in')
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
            this.my_timer = setInterval(() => {    
                this.loadData();
                }, 5000);    
            },
            
        },
        mounted () {
            //this.intervalFetchData1();
            this.intervalFetchData();
            //this.bindings()
            //loadData.call(this)
            //this.loadData()
            //location.reload();
        },

        beforeDestroy () {
            clearInterval(this.my_timer)
            console.log('sudah bersih')
        },
    }
</script>