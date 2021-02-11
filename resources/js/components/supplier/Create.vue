<template>
    <div class="mt-3">
                    <div class="card-header">TAMBAH SUPPLIER</div>

                    <div class="card-body">

                        <form @submit.prevent="PostStore">

                            <div class="form-group">
                                <label>Nama Supplier</label>
                                <input type="text" class="form-control" v-model="post.nmSupplier"
                                       placeholder="Masukkan Nama">
                                <div v-if="validation.nmSupplier">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.nmSupplier[0] }}
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Alamat Supplier</label>
                                <input type="text" class="form-control" v-model="post.almtSupplier"
                                       placeholder="Alamat Supplier">
                                <div v-if="validation.almtSupplier">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.almtSupplier[0] }}
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>No HP</label>
                                <input type="text" class="form-control" v-model="post.noHp"
                                       placeholder="No Tlp">
                                <div v-if="validation.noHp">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.noHp[0] }}
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Kontak Person</label>
                                <input type="text" class="form-control" v-model="post.kontakSupplier"
                                       placeholder="KOntak Person">
                                <div v-if="validation.kontakSupplier">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.kontakSupplier[0] }}
                                    </div>
                                </div>
                            </div>


                            <div class="form-group">
                                <button type="submit" class="btn btn-md btn-success">SIMPAN</button>
                                <button type="reset" class="btn btn-md btn-danger">RESET</button>
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
                validation: []
            }
        },
        methods: {
            onImageChange(e){
                console.log(e.target.files[0]);
                this.image = e.target.files[0];

            },
            PostStore() {
                let uri = 'http://localhost:8000/api/supplier/store';
                this.axios.post(uri, this.post)
                    .then((response) => {
                        this.$router.push({
                            name: 'supplier'
                        });
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            }
        }
    }
</script>
