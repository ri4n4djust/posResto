<template>
    <div class="mt-3">
                    <div class="card-header">EDIT POST</div>

                    <div class="card-body">

                        <form @submit.prevent="PostUpdate">

                            <div class="form-group">
                                <label>Kode</label>
                                <input type="text" class="form-control" v-model="post.kdBarang"
                                       disabled>
                            </div>
                            <div class="form-group">
                                <label>TITLE</label>
                                <input type="text" class="form-control" v-model="post.nmBarang"
                                       placeholder="Masukkan Title">
                                <div v-if="validation.nmBarang">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.nmBarang[0] }}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Harga Pokok</label>
                                <input type="text" class="form-control" v-model="post.hrgPokok"
                                       placeholder="Harga Pokok">
                                <div v-if="validation.hrgPokok">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.hrgPokok[0] }}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Harga Jual</label>
                                <input type="text" class="form-control" v-model="post.hrgJual"
                                       placeholder="Harga Jual">
                                <div v-if="validation.hrgJual">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.hrgJual[0] }}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Stok Barang</label>
                                <input type="text" class="form-control" v-model="post.stkBarang"
                                       placeholder="Stok Barang">
                                <div v-if="validation.stkBarang">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.stkBarang[0] }}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Deskripsi</label>
                                <textarea class="form-control" v-model="post.deskripsi" rows="5"
                                          placeholder="Masukkan Konten"></textarea>
                                <div v-if="validation.deskripsi">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.deskripsi[0] }}
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                            <label>Select Country:</label>
                            <select class='form-control' v-model='post.ktgBarang' selected >
                                <option value='0' >Select Country</option>
                                <option  v-for='data in countries' :value='data.kodeKtg' :key='data.id'>{{ data.namaKtg }}</option>
                            </select>
                            
                        </div>
                        
                   <input type="text" class="form-control"  v-model="post.ktgBarang">


                            <div class="form-group">
                                <button type="submit" class="btn btn-md btn-success">UPDATE </button>
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
                validation: [],
                selected : '',
                country: 0,
                countries: [],
                
            }
        },
        created() {
            let uri = `/api/posts/${this.$route.params.id}`;
            this.axios.get(uri).then((response) => {
                this.post = response.data.data;
                this.getCountries()
            });
        },
        methods: {
            PostUpdate() {
                let uri = `/api/posts/update/${this.$route.params.id}`;
                this.axios.post(uri, this.post)
                    .then((response) => {
                        this.$router.push({name: 'posts'});
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            },
            getCountries: function(){
                axios.get('/get_countries')
                    .then(function (response) {
                        this.countries = response.data;
                    }.bind(this));
            },
           
        },
       
    }
</script>
