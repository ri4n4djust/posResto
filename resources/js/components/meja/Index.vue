<template>

                    <div class="card-body">
                        <h3>
                        <router-link :to="{ name: 'createMeja' }" class="btn btn-md btn-success">TAMBAH MEJA</router-link>
                        </h3>

                        <div v-for="(post, index) in posts" :key="post.id" class="col-lg-3 col-xs-6" >
                        <!-- small box -->
                        <div class="small-box bg-aqua">
                            <div class="inner">
                            <h3>{{ post.noMeja }}</h3>

                            <p>{{ post.pax }}</p>
                            </div>
                            <div class="icon">
                            <i class="ion ion-bag"></i>
                            </div>
                                {{post.status}}
                            <div v-if="post.status === 1 ">
                            ISI tamu
                            <router-link :to="{name: 'detailMeja', params: { id: post.id }}" class="btn btn-sm btn-primary">Detail</router-link>

                            </div>
                            <div v-if="post.status === 0 ">
                            Kosong
                             <router-link :to="{name: 'editMeja', params: { id: post.id }}" class="btn btn-sm btn-primary">EDIT</router-link>
                            </div>

                                
                                <a @click.prevent="PostDelete(post.id, index)" class="btn btn-sm btn-danger"></a>
                        </div>
                        </div>

    
    
    
    </div>

</template>



<script>
    export default {
        data() {
            return {
                posts: [],
                post:{},
                showModal: false,
                status: '1',
                paxMeja: '',
            }
        },
        created() {
            let uri = '/api/meja';
            this.axios.get(uri).then(response => {
                this.posts = response.data.data;
            });
        },
        watch: {
          post: function() {
            this.$emit('input', this.post);
          }
        },
        props: ['value'],
        methods: {
            PostDelete(id, index)
            {
                this.axios.delete(`/api/meja/${id}`)
                    .then(response => {
                        this.posts.splice(index, 1);
                    }).catch(error => {
                    alert('system error!');
                });
            },
            
        }
    }
</script>