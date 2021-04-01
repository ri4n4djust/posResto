<template>
    <div class="mt-3">
                    <div class="card-header">Detail</div>

                    <div class="card-body">



          <!-- general form elements -->
                <div class="box box-primary">
                            
                            <div class="form-group">
                                <label>Nama Barang : {{post.nmBarang}}</label>
                            </div>
                            <div class="form-group">
                                <label>Stok : {{post.stkBarang}} {{post.satuanBarang}}</label>
                            </div>
                            <div class="form-group">
                                <label>Stok Inventori : {{post.stkInventori}}</label>
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
