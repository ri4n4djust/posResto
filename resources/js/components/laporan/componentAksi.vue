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
                                        {{data.tglNota}}
                                        </p>
                                        
                                        <p class="text-muted text-left">
                                            <label>No Nota : </label>
                                        {{data.noNota}}
                                        </p>

                                        <p class="text-muted text-left">
                                            <label>Pelanggan : </label>
                                        {{data.pelangganNota}}
                                        <input type="text" v-model="data.pelangganNota">
                                        </p>
                                        
                                        
                                        <h3 class="profile-username text-left">
                                            <label>Total : </label>
                                            {{ data.totalNota  || 0 | currency }}</h3>
                                        
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
                                                            <td>{{ pe.hrgJual | currency }}</td>
                                                            <td>{{ pe.qty * pe.hrgJual | currency }}</td>

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
                data: this.posts,
            }

        },
    created() {
            this.loadData()
            this.loadDetailPenjualan()
        },
    
    watch: {
          post: function() {
            this.$emit('input', this.post);
          }
        },
    mounted() {
        this.loadData()
        this.loadDetailPenjualan()
    },
    
    methods: {

            loadData:function(){
                let uri = '/api/penjualan';
                this.axios.get(uri).then(response => {
                this.posts = response.data.data;
                
            });
            },
            loadDetailPenjualan:function(){
                let uri = '/api/detailenjualan';
                this.axios.post(uri, {
                    np: this.data.noNota,
                }).then(response => {
                alert('no nota '+ np);
                this.pem = response.data.data;
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