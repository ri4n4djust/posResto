<template>
    <div class="mt-3">
                    <div class="card-header">EDIT SUPPLIER</div>

                    <div class="card-body">

                        <form @submit.prevent="PostUpdate">

                            <div class="form-group">
                                <label>No Meja</label>
                                <input type="text" class="form-control" v-model="post.noMeja"
                                       placeholder="No Meja">
                                <div v-if="validation.noMeja">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.noMeja[0] }}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Max Accupannci</label>
                                <input type="text" class="form-control" v-model="post.paxMeja"
                                       placeholder="Accupanci">
                                <div v-if="validation.paxMeja">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.paxMeja[0] }}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Cek In</label>
                                <input type="text" class="form-control" v-model="post.status"
                                       placeholder="Accupanci">
                                <div v-if="validation.status">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.status[0] }}
                                    </div>
                                </div>
                            </div>
                            

                            <div class="form-group">
                                <button type="submit" class="btn btn-md btn-success">UPDATE</button>
                                <button @click.prevent="PostDeleteTrx(post.id)" class="btn btn-md btn-danger">HAPUS</button>
                                <router-link :to="{ name: 'meja' }" class="btn btn-primary btn-success">KEMBALI</router-link>
                            </div>

                        </form>

                    </div>
                </div>

</template>

<script>
    export default {

        data() {
            return {
                post: {},
                validation: [],
            }
        },
        created() {
            let uri = `/api/meja/${this.$route.params.id}`;
            this.axios.get(uri).then((response) => {
                this.post = response.data.data;
            });
        },
        methods: {
            PostUpdate() {
                let uri = `/api/meja/update/${this.$route.params.id}`;
                this.axios.post(uri, this.post)
                    .then((response) => {
                        this.$router.push({name: 'meja'});
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            },
            PostDelete(id)
            {
            if(confirm("Do you really want to delete?")){
                this.axios.delete(`/api/meja/${id}`)
                    .then(response => {
                        this.posts.splice(index, 1);
                    }).catch(error => {
                    alert('system error!');
                });
            }
            },
        }
    }
</script>
