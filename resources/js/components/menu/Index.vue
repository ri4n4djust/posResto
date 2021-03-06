<template>

                    <div class="card-body">
                        <h3>
                        <router-link :to="{ name: 'createMenu' }" class="btn btn-md btn-success">TAMBAH MENU</router-link>
                        </h3>
                            <table class="table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>Kode</th>
                                    <th>Nama Menu</th>
                                    <th>Harga Jual</th>
                                    <th>Hpp Menu</th>
                                    <th>Stok</th>
                                    <th>AKSI</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="(post, index) in posts" :key="post.id">
                                    <td>{{ post.kdMenu }}</td>
                                    <td>{{ post.nmMenu }}</td>
                                    <td>{{ post.hargaMenu | currency }}</td>
                                    <td>{{ post.hppMenu | currency }}</td>
                                    <td>{{ post.stokMenu }}</td>
                                    <td class="text-center">
                                        <router-link :to="{name: 'editMenu', params: { id: post.kdMenu }}" class="btn btn-sm btn-primary">EDIT</router-link>
                                        <button @click.prevent="PostDelete(post.id, index)" class="btn btn-sm btn-danger">HAPUS</button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                

</template>


<script>
    export default {
        data() {
            return {
                posts: []
            }
        },
        created() {
            let uri = '/api/menu';
            this.axios.get(uri).then(response => {
                this.posts = response.data.data;
            });
        },
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            }
        },
        methods: {
            PostDelete(id, index)
            {
            if(confirm("Do you really want to delete?")){
                this.axios.delete(`/api/menu/${id}`)
                    .then(response => {
                        this.posts.splice(index, 1);
                    }).catch(error => {
                    alert('system error!');
                });
            }
            }
        }
    }
</script>