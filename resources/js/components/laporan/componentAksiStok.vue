<template>
    <div >
        <button class="btn btn-outline-success" @click="showModalDetail = true">
            <i class="fa fa-eye"></i>
        </button>
        <button class="btn btn-outline-primary" @click="EditAction('edit')" >
            <i class="fa fa-edit"></i>
        </button>
                        
                        <div v-if="showModalDetail">
                            <transition name="modal">
                            <div class="modal-mask">
                                <div class="modal-wrapper">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" @click="showModalDetail=false">
                                        <span aria-hidden="true">&times;</span>
                                        </button>
                                        <h4 class="modal-title">Detail</h4>
                                    </div>
                                    <div class="modal-body">


                                        <div class="nav-tabs-custom">
                                        <ul class="nav nav-tabs">

                                        <li><a href="#timeline" data-toggle="tab">Kartu Stok</a></li>
                                        <li><a href="#settings" data-toggle="tab">Settings</a></li>
                                        </ul>
                                        <div class="tab-content">
                                        
                                            <!-- /.tab-pane -->
                                            <div class="tab-pane" id="timeline">
                                                <!-- The timeline -->
                                                   
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
                                                            <td>{{ pe.tglKartu }}</td>
                                                            <td>{{ pe.qtyMasuk}}</td>
                                                            <td>{{ pe.qtyKeluar}}</td>
                                                            <td>{{ pe.noTransaksi}}</td>
                                                            <td>{{ pe.keteranganKartu }}</td>

                                                        </tr>
                                                        </tbody>
                                                    </table>
                                            
                                            </div>
                                            <!-- /.tab-pane -->
                                            <div class="tab-pane" id="settings">

                                                    Seting
                                            </div>
                                            
                                            <!-- /.tab-pane -->
                                            </div>
                                            <!-- /.tab-content -->
                                        </div>
                                        <!-- /.nav-tabs-custom -->
                                       

                                        


                                        

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
                //pem: [],
                showModalDetail: false,
                data: this.posts,
            }

        },
    created() {
            this.loadData()
            //this.something()
            this.loadDetailStok()
        },
    methods: {

            loadData:function(){
                let uri = '/api/posts';
                this.axios.get(uri).then(response => {
                this.posts = response.data.data;
                
            });
            },
            
            loadDetailStok:function(){
                let uri = '/api/detailstok/'+ this.data.kdBarang;
                this.axios.post(uri).then(response => {
                    this.pem = response.data.data;
                   // alert('no nota '+ this.data.noNota);
            });
            },
            
            EditAction() {
                const path = '/barang/edit/' + this.data.id
                this.$router.push(path)
                //alert('edit' + this.data.id)
                //this.$store.commit(edit, this.data)
            },
            ViewAction() {
                alert('View' + this.data.id)
                //this.$store.commit(edit, this.data)
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