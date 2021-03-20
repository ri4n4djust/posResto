<template>

                    <div class="card-body">
                        <h3>
                        <router-link :to="{ name: 'createKategori' }" class="btn btn-md btn-success">TAMBAH KATEGORI</router-link>
                        </h3>
                        <button @click.prevent="onClickPrint()" class="btn btn-sm btn-danger">Print</button>
                            <table class="table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>Kode </th>
                                    <th>Nama Kategori</th>
                                    <th>AKSI</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="(post, index) in posts" :key="post.id">
                                    <td>{{ post.kodeKtg }}</td>
                                    <td>{{ post.namaKtg }}</td>
                                    <td class="text-center">
                                        <router-link :to="{name: 'editKategori', params: { id: post.id }}" class="btn btn-sm btn-primary">EDIT</router-link>
                                        <button @click.prevent="PostDelete(post.id, index)" class="btn btn-sm btn-danger">HAPUS</button>
                                        
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                

</template>

<script>
import Recta from 'recta';
var printer = new Recta('12345678', '1811')

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
            onClickPrint () {
                printer.open().then(function () {
                printer.align('center')
                    .text('Hello World !!')
                    .bold(true)
                    .text('This is bold text')
                    .bold(false)
                    .underline(true)
                    .text('This is underline text')
                    .underline(false)
                    .barcode('CODE39', '123456789')
                    .cut()
                    .print()
                })
            },
            PostDelete(id, index)
            {
                if(confirm("Do you really want to delete?")){
                this.axios.delete(`/api/kategori/${id}`)
                    .then(response => {
                        this.posts.splice(index, 1);
                    }).catch(error => {
                    alert('system error!');
                });
                }f
            }
        }
    }
</script>