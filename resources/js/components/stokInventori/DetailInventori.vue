<template>
    <div class="mt-3">
                    <div class="card-header">Detail</div>

                    <div class="card-body">


                            <div class="col-md-6">
          <!-- general form elements -->
                <div class="box box-primary">
                            
                             <div class="form-group">
                                <input type="text" class="form-control" v-model="post.kdBarang" disabled >
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


                </div>
            </div>
    
                                                    <table class="table table-hover table-bordered">
                                                        <thead>
                                                        <tr>
                                                            <th>Nama Barang </th>
                                                            <th>Tgl</th>
                                                            <th>Qty Masuk</th>
                                                            <th>Qty Keluar</th>
                                                            <th>No. Transaksi</th>
                                                            <th>Keterangan</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <tr v-for="pe in pem" :key="pe.id">
                                                            <td>{{ pe.kdBarang }} </td>
                                                            <td>{{ pe.tglInv }}</td>
                                                            <td>{{ pe.qtyMasukInv}}</td>
                                                            <td>{{ pe.qtyKeluarInv}}</td>
                                                            <td>{{ pe.noTransaksiInv}}</td>
                                                            <td>{{ pe.keteranganKartuInv }}</td>

                                                        </tr>
                                                        </tbody>
                                                    </table>

      
        


                    </div>
                </div>

</template>

<script>
    export default {

        data() {
            return {
                post: {},
                pem: {},
                validation: [],
                selected : '',
                country: 0,
                countries: {},
                
            }
        },
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            }
        },
        created() {
            let uri = `/api/detailbarang/${this.$route.params.id}`;
            this.axios.get(uri).then((response) => {
                this.post = response.data.data;
            });
            this.loadDetailInventori();
        },
        methods: {
            loadDetailInventori:function(){
                let uri = `/api/detailinventori/${this.$route.params.id}`;
                this.axios.post(uri).then(response => {
                    this.pem = response.data.data;
                   // alert('no nota '+ this.data.noNota);
            });
            },
            PostDeleteTrx(id)
            {
            if(confirm("Do you really want to delete?")){
               this.axios.delete(`/api/posts/${id}`)
                    .then(response => {
                        this.$router.push({name: 'posts'});
                        alert('Sukses Hapus' + this.post.nmBarang);
                    }).catch(error => {
                    alert('system error!');
                });
            }
            },
           
        },
        props: {
        data: {
            type: Object,
            required: true,
           
        },
    },
       
    }
</script>
