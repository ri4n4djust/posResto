<template>
    <div >
        <button  @click="showModalPenjualan = true">
            <i class="fa fa-eye"></i>
        </button>
       

                        <div v-if="showModalPenjualan">
                            <transition name="modal">
                            <div class="modal-mask">
                                <div class="modal-wrapper">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" @click="showModalPenjualan=false">
                                        <span aria-hidden="true">&times;</span>
                                        </button>
                                        <h4 class="modal-title">Detail Penjualan</h4>
                                    </div>
                                    <div class="modal-body">

                                        <p class="text-muted text-left">
                                            <label>Tgl : </label>
                                        {{data.tglNotaPembelian}}
                                        </p>
                                        <p class="text-muted text-left">
                                            <label>No Nota : </label>
                                        {{data.noNotaPembelian}}
                                        </p>
                                        <p class="text-muted text-left">
                                            <label>Pelanggan : </label>
                                        {{data.nmSupplier}}
                                        </p>
                                        
                                        <h3 class="profile-username text-left">
                                            <label>Total : </label>
                                            {{ data.totalNotaPembelian  || 0 | currency }}</h3>
                                        
                                        <p class="text-muted text-center">
                                        </p>

                                                    <table class="table table-hover table-bordered">
                                                        <thead>
                                                        <tr>
                                                            <th>Nama </th>
                                                            <th>Qty</th>
                                                            <th>Harga</th>
                                                            <th>Total</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <tr v-for="pe in pem" :key="pe.id">
                                                            <td>{{ pe.nmBarang }} </td>
                                                            <td>{{ pe.qty}}</td>
                                                            <td>{{ pe.hrgBeli | currency }}</td>
                                                            <td>{{ pe.qty * pe.hrgBeli | currency }}</td>

                                                        </tr>
                                                        </tbody>
                                                    </table>
      
                                        

                                    </div>
                                    </div>
                                </div>
                                </div>
                            </div>
                            </transition>
                        </div>
       
    </div>
</template>
<script>
export default {
    name: "ActionButtons",
    data() {
            return {
                posts: [],
                pem: [],
                showModalPenjualan: false,
                np: this.data.noNota,
                sukses: '',
                
            }

        },
    created() {
            this.loadData()
            //this.something()
            this.loadDetailPenjualan()
        },
   
       
    methods: {
            something() {
                return new Promise((resolve) => {
                resolve('np:'+ this.data.noNota);
                });
            },
            loadData:function(){
                let uri = '/api/pembelian';
                this.axios.get(uri).then(response => {
                this.posts = response.data.data;
                
                
            });
            },
            loadDetailPenjualan:function(){
                let uri = '/api/detailpembelian/'+ this.data.noNota;
                this.axios.post(uri).then(response => {
                    this.pem = response.data.data;
                   // alert('no nota '+ this.data.noNota);
            });
            },
                      
        },
    props: {
        data: {
            type: Object,
            required: true,
        },
    },
};
</script>