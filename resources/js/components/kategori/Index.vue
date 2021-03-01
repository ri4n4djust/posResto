<template>

                    <div class="card-body">
                        <h3>
                        <router-link :to="{ name: 'createKategori' }" class="btn btn-md btn-success">TAMBAH KATEGORI</router-link>
                        </h3>
                            <table class="table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>Kode </th>
                                    <th>Nama Kategori</th>
                                    <th>AKSI</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="post in posts" :key="post.id">
                                    <td>{{ post.kodeKtg }}</td>
                                    <td>{{ post.namaKtg }}</td>
                                    <td class="text-center">
                                        <router-link :to="{name: 'editKategori', params: { id: post.id }}" class="btn btn-sm btn-primary">EDIT</router-link>
                                        <button @click.prevent="PostDelete(post.id)" class="btn btn-sm btn-danger">HAPUS</button>
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
                posts: {}
            }
        },
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            }
        },
        created() {
            let uri = '/api/kategori';
            this.axios.get(uri).then(response => {
                this.posts = response.data.data;
            });
        },
        methods: {
            PostDelete(id, index)
            {
                this.axios.delete(`/api/kategori/${id}`)
                    .then(response => {
                        this.posts.splice(index, 1);
                    }).catch(error => {
                    alert('system error!');
                });
            }
        }
    }
</script>