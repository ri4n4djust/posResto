<template>
    <div class="card-body">
      <status-login></status-login>
    <section class="content">
      <div class="row">
        <div class="col-md-3">
          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">

              <h3 class="profile-username text-center">Meja No. {{post.noMeja}}</h3>

              <p class="text-muted text-center">Max Pax {{post.paxMeja}}</p>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          <!-- About Me Box -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Billing</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">

              
                <p class="text-muted text-center">
                <date-picker v-model="tglNota" value-type="format" format="YYYY/MM/DD"></date-picker>
                </p>
                <p class="text-muted text-center">
                  <div class="input-group">
                    <span class="input-group-addon">Pelanggan</span>
                    <select v-model="pelanggan" class="form-control">
                        <option v-for="pel in pelanggans" :value="pel.nmPelanggan" :key="pel.id">
                            {{pel.nmPelanggan}}
                        </option>
                    </select>
                    <input type="hidden" class="form-control" v-model="pelanggan" placeholder="Customer">
                  </div>
                
                <p class="text-muted text-center">
                  <div class="input-group">
                    <span class="input-group-addon">No Invoice</span>
                    <input type="text" class="form-control" v-model="noNota" placeholder="No nota" disabled>
                  </div>
               
                <p class="text-muted text-center">
                  <div class="input-group">
                    <span class="input-group-addon">Nm Waiter</span>
                  <input type="text" class="form-control" v-model="post.name" disabled>
                  </div>


                <input type="hidden" class="form-control" :value="subtotal" :name="totalTransaksi" >
                <h3 class="profile-username text-center">Total {{ Math.floor(subtotal)  || 0 | currency }}</h3>
                
                <p class="text-muted text-center">
                <a href="#" @click="showModalBayar = true" class="btn btn-primary btn-block"><b>Payment</b></a>
                </p>
                <p class="text-muted text-center">
                <a href="#" @click="opensplit(trxs)" class="btn btn-primary btn-block"><b>Split Payment</b></a>
                </p>

                  
                <div id="lastOrder" class="lastOrder">

                <span v-if=" orders.length != 0 ">
                  <h3 class="profile-username text-center">Meja No: {{ post.noMeja }}</h3>
                 
                  <table class="table table-striped">
                    <thead>
                  <tr>
                    <th>No.</th>
                    <th>Menu</th>
                    <th>Qty</th>
                    <th>Jam</th>
                  </tr>
                    </thead>
                    <tbody>
                  <tr v-for="order in orders" :key="order.id">
                    <td>*</td>
                    <td>{{ order.nmMenu }}<br>
                        {{order.noteOrder }}</td>
                    <td>{{ order.qtyOrder }}</td>
                    <td>{{ order.wktOrder }} </td>
                  </tr>
                    </tbody>
                </table>
                </span>
                <br>
                <br>
                <br>

                <span v-if=" orders1.length != 0 ">
                <h3 class="profile-username text-center">Meja No: {{ post.noMeja }}</h3>
                  <table class="table table-striped">
                    <thead>
                  <tr>
                    <th>No.</th>
                    <th>Menu</th>
                    <th>Qty</th>
                    <th>Jam</th>
                  </tr>
                    </thead>
                  <tbody>
                  <tr v-for="order in orders1" :key="order.id">
                    <td>* </td>
                    <td>{{ order.nmMenu }}<br>
                        {{order.noteOrder }}</td>
                    <td>{{ order.qtyOrder }}</td>
                    <td>{{ order.wktOrder }} </td>
                  </tr>
                  </tbody>
                </table>                
                </span>
              </div>
             
              

            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>




        <!-- /.col -->
        <div class="col-md-9">
                <a href="#"  @click="showModalMenu = true" class="btn-md btn-success"><b>Add Menu</b></a>
                <a href="#"  @click="showModalMove = true" class="btn-md btn-success"><b>Pindah Meja</b></a>
                <span v-if="adminuser === 'Admin'">
                  <span v-if=" orders.length == 0 && orders1.length == 0"><a href="#"  class="btn-md btn-success disabled" role="button" aria-disabled="true">Print Order</a></span>
                  <span v-else><a href="#"  @click="printOrder(id= post.id)" class="btn-md btn-success" >Print Order</a></span>
                </span>
                <router-link :to="{ name: 'meja' }" class="btn-md btn-success">KEMBALI</router-link>
                <!-- /.post -->
                            <table class="table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>Nama </th>
                                    <th>Qty</th>
                                    <th>Harga</th>
                                    <th>Total</th>
                                    <th>AKSI</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="trx in trxs" :key="trx.id">
                                    <td>{{ trx.nmBarangTmp }} </td>
                                    <td>{{ trx.qtyTmp}}</td>
                                    <td>{{ trx.hrgJualTmp | currency }}</td>
                                    <td>{{ trx.totalTmp | currency }}</td>
                                    <td class="text-center">
                                        <button @click.prevent="PostDeleteTrx(trx.id)" class="btn btn-sm btn-danger">HAPUS</button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>



<!-- modal start -->
  <div v-if="showModalMove">
    <transition name="modal">
      <div class="modal-mask">
        <div class="modal-wrapper">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" @click="showModalMove=false">
                  <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Pindah Ke Meja</h4>
              </div>
              <div class="modal-body">

                
                <select v-model='move1' class="form-control">
                  <option v-for='move1 in mejaKosong' v-bind:value='move1' :key="move1.id">Meja No.{{move1.noMeja}}</option>
                </select>

                <div v-if="move1">
                  <form  @submit.prevent="PostMove" >
                    <div class="form-group">
                      <input type="hidden" v-model="post.id">
                      <input type="hidden" v-model="post.waiterMeja">
                      <input type="hidden" class="form-control" v-model="move1.id">
                    </div>
                    <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-success">Pindah</button>
                    </div>
                  </form>
                </div>
                <div v-else>
                  no Selected
                </div>
                

              </div>
            </div>
          </div>
        </div>
      </div>
    </transition>
  </div>
  <!------End Modal Move ----->


  
  <div v-if="showModalMenu">
    <transition name="modal">
      <div class="modal-mask">
        <div class="modal-wrapper">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" @click="showModalMenu=false">
                  <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Add Menu</h4>
              </div>
              <div class="modal-body">

                <!------Tes Select menu ----->
                <label>Menu cari:</label>
                  <input type="text" ref="menu" v-model="menu" v-on:keyup="get_menu" class="form-control " >
                    
                      <span v-if="menuss.lenght === 0">
                      </span>
                      <span v-else>
                        <ul class="list-group">
                          <li v-for="(menu, id) in menuss" @click="select_menu(menu)" :key="menu.id" class="list-group-item autocomplete-box-li">
                              {{ id+1 }}
                              {{ menu.nmMenu }}
                          </li>
                        </ul>
                      </span>
                    

                <!------End Tes ----->
                
           
                <div v-if="post2">
                  <form  @submit.prevent="PostMenu" >
                    <div class="form-group">
                      
                      <input type="hidden" v-model="post.noMeja">
                      <input type="hidden" v-model="noNota" placeholder="No nota">
                      <input type="hidden" v-model="post2.id">
                      <input type="hidden" v-model="post2.kdMenu">
                      <input type="hidden" v-model="post2.ktgMenu">
                      <input type="hidden" v-model="post2.promoMenu">
                      <input type="hidden" class="form-control" v-model="post2.nmMenu">
                    </div>
                    <div class="form-group">
                      <textarea class="form-control" v-model="note" rows="2" placeholder="Note"></textarea>
                    </div>
                    <div class="form-group">
                      <input type="number" class="form-control" v-model="post2.hargaMenu" placeholder="Harga" @keypress="onlyNumber" required>
                    </div>
                    <div class="form-group">
                      <input type="number" class="form-control" v-model="qtyBarang" placeholder="Qty" @keypress="onlyNumber" required>
                    </div>
                    <div class="form-group">
                      <input type="text" class="form-control" :value="(post2.hargaMenu * qtyBarang) || 0" :name="total"  disabled>
                    </div>
                    <div class="form-group">
                    <button type="submit"  class="btn btn-primary btn-success">Add</button>
                    </div>
                  </form>
                </div>
                <div v-else>
                  No Selected
                </div>


              </div>
            </div>
          </div>
        </div>
      </div>
    </transition>
  </div>

<div v-if="showModalSplit">
    <transition name="modal">
      <div class="modal-mask">
        <div class="modal-wrapper">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" @click="showModalSplit=false">
                  <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Split Bill</h4>
              </div>
              <div class="modal-body">
                <table class="table table-hover table-bordered">
                 <thead>
                    <tr>
                     <th colspan="5">Barang Yang Belum di bayar</th>
                   </tr>
                                <tr>
                                    <th>Nama </th>
                                    <th>Harga</th>
                                    <th>Qty</th>
                                    <th>Total</th>
                                    <th>AKSI</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="(trx, index) in crt" :key="trx.index" >
                                    <td v-if="trx.qtyTmp > 0">{{ trx.nmBarangTmp }} </td>
                                    <td v-if="trx.qtyTmp > 0">{{ trx.hrgJualTmp | currency }}</td>
                                    <td v-if="trx.qtyTmp > 0">
                                        <vue-numeric-input v-model="qtySplit[index]" :min="0" :max="trx.qtyTmp" :value="1" required></vue-numeric-input>
                                    </td>
                                    <td v-if="trx.qtyTmp > 0">{{ trx.hrgJualTmp * qtySplit[index] | currency }}</td>
                                    <td v-if="trx.qtyTmp > 0" class="text-center">
                                      <div v-if="qtySplit[index] >= '1'">
                                        <button @click.prevent="updateItem(barcode = trx.id, index, trx)" class="btn btn-sm btn-success">Tambah</button>
                                      </div>
                                    </td>
                                </tr>
                                </tbody>
                </table>
                <table class="table table-hover table-bordered">
                 <thead>
                   <tr>
                     <th colspan="4">Barang Yang akan di bayar</th>
                   </tr>
                                <tr>
                                    <th>Nama </th>
                                    <th>Harga</th>
                                    <th>Qty</th>
                                    <th>Total</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="trx in splitNota" :key="trx.id">                                    <td>{{ trx.nmBarangTmp }} </td>
                                    <td>{{ trx.hrgJualTmp | currency }}</td>
                                    <td>{{ trx.qtyTmp }}</td>
                                    <td>{{ trx.hrgJualTmp * trx.qtyTmp | currency }}</td>
                                </tr>
                  </tbody>
                </table> 
                <form  @submit.prevent="PostSplit" >
                <input type="hidden" class="form-control" v-model="tglNota" >
                <input type="hidden" class="form-control" v-model="pelanggan" placeholder="Customer">
                <input type="hidden" class="form-control" v-model="noNota" placeholder="No nota">
                <input type="hidden" class="form-control" v-model="totalItem">
                <input type="hidden" class="form-control" v-model="post.waiterMeja">
                <input type="hidden" class="form-control" v-model="subtotaltp">
                <input type="hidden" class="form-control" v-model="groupNota">
                <p class="text-muted text-center">
                <input type="hidden" class="form-control" :value="((totalItem * pajak / 100 + totalItem) - (subtotaltp * diskon / 100))  || 0 " :name="totalTransaksiBayar"  >
                <h3 class="profile-username ">Total {{ Math.floor(((totalItem * pajak / 100 + totalItem) - (subtotaltp * diskon / 100)) + ((totalItem * pajak / 100 + totalItem) - (subtotaltp * diskon / 100)) * taxDebit / 100)  || 0 | currency }}</h3>
                <div class="row input-group">
                <div class="col-xs-4">
                  <span class="input-group-addon">Tax in %</span>
                  <input type="number" step=".01" class="form-control " v-model="pajak" placeholder="Tax">
                  <input type="hidden" class="form-control" :value="(totalItem * pajak / 100 + totalItem)" :name="totalTransaksipjk" >
                </div>
                <div class="col-xs-4">
                  <span class="input-group-addon">Disc in %</span>
                  <input type="number" step=".01" class="form-control" v-model="diskon" placeholder="Diskon">
                  <input type="hidden" class="form-control" :value="subtotaltp * diskon / 100" :name="diskon1" >
                </div>
              </div>
              <br>
                            <select class='form-control' v-model='pembayaran' >
                                <option value='1' selected>Cash</option>
                                <option value='2'>Debit</option>
                                <option value='3'>E-Money</option>
                            </select>
                            <br>
                            <div v-if="pembayaran === '1'">
                              <div class="input-group">
                                    <span class="input-group-addon">Rp.</span>
                                    <input type="number" class="form-control" v-model="totalBayar" placeholder="Bayar" required>
                                  </div>
                                  
                                  <h3 class="profile-username ">Kembali : {{ Math.floor(totalBayar - ((totalItem * pajak / 100 + totalItem) - (subtotaltp * diskon / 100)))  || 0 | currency  }}</h3>
                                  <p class="text-muted text-center">
                                  <button type="submit" v-on:click="addG()" class="btn btn-primary btn-success" >Bayar</button> 
                                  </p>
                            </div>
                            <div v-else-if="pembayaran === '2'">
                              <div class="input-group">
                                    <span class="input-group-addon">Card Carge %</span>
                                    <input type="number" step=".01" class="form-control" v-model="taxDebit" placeholder="0" >
                                    <input type="hidden" class="form-control" :value="((totalItem * pajak / 100 + subtotal) - ((totalItem * pajak / 100 + totalItem) * diskon / 100)) * taxDebit / 100 " :name="pajakKartu" >
                                  </div>
                                  <p>
                                  <div class="input-group">
                                    <span class="input-group-addon">Card No.</span>
                                    <input type="number" class="form-control" v-model="noDebit" placeholder="No Kartu" >
                                  </div>
                                  <p>
                                  <div class="input-group">
                                    <span class="input-group-addon">Rp.</span>
                                    <input type="number" class="form-control" v-model="totalBayar" placeholder="Bayar" required>
                                  </div>
                                  <br>
                                  <p class="text-muted text-center">
                                  <button type="submit" v-on:click="addG()" class="btn btn-primary btn-success" >Bayar</button>       
                                          
                                  </p>
                            </div>
                            <div v-else-if="pembayaran === '3'">
                              Emoney
                            </div>

               
              </form>

              <div id="printMeSplit">
                <section class="invoice">
                <!-- info row -->
                <p class="text-muted text-center">
                <img :src="'/image/logoNota.png'" >
                </p>
                <p class="text-bold text-center">
               
                    Phone / Wa: 081 239 099 998<br>
                    Email: warungdaladesa@gmail.com<br>
                    FB : warungdaladesa<br>
                    IG : warung.daladesa.sangeh
                  
                </p>
              <div class="row invoice-info">
                <div class="col-xs-6">
                  <p class="text-muted" style="margin-top: 2px;">
                  <address>
                    <strong>Customer :</strong> {{pelanggan}}<br>
                    <b> Tgl : </b>{{tglNota}}<br>
                    <b> Meja No : </b>{{post.noMeja}}<br>
                    <b>Waiter : </b>{{post.name}}<br>
                  </address>
                  
                </div>
                <!-- /.col -->
                <div class="col-xs-6">
                  <p class="text-muted" style="margin-top: 2px;">
                  <address>
                  <b>No Inv: </b>{{noNota}}<br>
                  <b>Kasir : </b>{{$session.get('user')}}<br>
                  <b>Pax: </b>{{post.paxMeja}}<br>
                  <b>Type : </b>
                  <span v-if="pembayaran === '1'">
                    Cash
                  </span>
                  <span v-else-if="pembayaran === '2'">
                    Debit
                  </span>
                  <span v-else-if="pembayaran === '3'">
                    E-Money
                  </span>
                  </address>
                  
                </div>

                <!-- /.col -->
              <!-- /.row -->

                <div class="col-xs-12 table-responsive">
                  <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>Nama </th>
                                    <th>Qty</th>
                                    <th>Harga</th>
                                    <th>Total</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="trx in splitNota" :key="trx.id">
                                    <td >{{ trx.nmBarangTmp }} </td>
                                    <td >{{ trx.qtyTmp}}</td>
                                    <td >{{ trx.hrgJualTmp | currency }}</td>
                                    <td >{{ trx.qtyTmp * trx.hrgJualTmp | currency }}</td>
                                </tr>
                                </tbody>
                                    <tr>
                                        <th colspan="3">subTotal :</th>
                                        <th>{{totalItem | currency}}</th>
                                    </tr>
                                    <tr>
                                        <th colspan="3">Tax & Service : {{ pajak }} %</th>
                                        <th>{{ Math.floor(totalItem * pajak / 100 ) | currency}}</th>
                                    </tr>
                                    <tr>
                                        <th colspan="3">Discount : {{ diskon }} %</th>
                                        <th>{{ Math.floor(subtotaltp * diskon / 100) | currency}}</th>
                                    </tr>
                                    <tr>
                                        <th colspan="3">subTotal :</th>
                                        <th>{{ Math.floor((totalItem * pajak / 100 + totalItem) - (subtotaltp * diskon / 100))  || 0 | currency }}</th>
                                    </tr>

                                    <tr v-if="pembayaran === '1'">
                                    </tr>
                                    <tr v-else-if="pembayaran === '2'">
                                        <th colspan="3">Card Charge : {{ taxDebit }} %</th>
                                        <th>{{ Math.floor((totalItem * pajak / 100 + totalItem) - (subtotaltp * diskon / 100)) * taxDebit / 100 | currency }}</th>
                                    </tr>

                                    <tr>
                                        <th colspan="3">Payment :</th>
                                        <th>{{ Math.floor(((totalItem * pajak / 100 + totalItem) - (subtotaltp * diskon / 100)) + ((totalItem * pajak / 100 + totalItem) - (subtotaltp * diskon / 100)) * taxDebit / 100)  || 0 | currency }}</th>
                                    </tr>

                                    <tr v-if="pembayaran === '1'">
                                        <th colspan="3">Kembalian :</th>
                                        <th>{{ Math.floor(totalBayar - ((totalItem * pajak / 100 + totalItem) - (subtotaltp * diskon / 100)))  || 0 | currency }}</th>
                                    </tr>
                                    <tr v-else-if="pembayaran === '2'">
                                    </tr>

                            </table>
                            <p class="text-bold text-center">
                                Terima Kasih <br>
                                Belanja Anda Hal Baik Bagi Dunia<br>
                                Tidak enak Kasi Tau Kami, ENAK kasi tau temanmu<br>                              
                            </p>
                </div>
              </div>
                </section>
    </div>
              


              </div>
            </div>
          </div>
        </div>
      </div>
    </transition>
  </div>
<!---- Modal Bayar End ---->
  

  <div v-if="showModalBayar">
    <transition name="modal">
      <div class="modal-mask">
        <div class="modal-wrapper">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" @click="showModalBayar=false">
                  <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Add Payment</h4>
              </div>
              <div class="modal-body">
                <form  @submit.prevent="PostTransaksi" >
                  <input type="hidden" class="form-control" v-model="tglNota" >
                <input type="hidden" class="form-control" v-model="pelanggan" placeholder="Customer">
                <input type="hidden" class="form-control" v-model="noNota" placeholder="No nota">
                <input type="hidden" class="form-control" v-model="subtotal">
                <input type="hidden" class="form-control" v-model="post.waiterMeja">

                <input type="hidden" class="form-control" v-model="subtotaltp">

                <p class="text-muted text-center">
                <input type="hidden" class="form-control" :value="((subtotal * pajak / 100 + subtotal) - (subtotaltp * diskon / 100))  || 0 " :name="totalTransaksiBayar"  >
                <h3 class="profile-username ">Total {{ Math.floor(((subtotal * pajak / 100 + subtotal) - (subtotaltp * diskon / 100)) + ((subtotal * pajak / 100 + subtotal) - (subtotaltp * diskon / 100)) * taxDebit / 100)  || 0 | currency }}</h3>


                <div class="row input-group">
                <div class="col-xs-4">
                  <span class="input-group-addon">Tax in %</span>
                  <input type="number" step=".01" class="form-control " v-model="pajak" placeholder="Tax">
                  <input type="hidden" class="form-control" :value="(subtotal * pajak / 100 + subtotal)" :name="totalTransaksipjk" >
                </div>
                <div class="col-xs-4">
                  <span class="input-group-addon">Disc in %</span>
                  <input type="number" step=".01" class="form-control" v-model="diskon" placeholder="Diskon">
                  <input type="hidden" class="form-control" :value="subtotaltp * diskon / 100" :name="diskon1" >
                </div>
              </div>
              <br>
                            <select class='form-control' v-model='pembayaran' >
                                <option value='1' selected>Cash</option>
                                <option value='2'>Debit</option>
                                <option value='3'>E-Money</option>
                            </select>
                            <br>
                            <div v-if="pembayaran === '1'">
                              <div class="input-group">
                                    <span class="input-group-addon">Rp.</span>
                                    <input type="number" class="form-control" v-model="totalBayar" placeholder="Bayar" required>
                                  </div>
                                  
                                  <h3 class="profile-username ">Kembali : {{ Math.floor(totalBayar - ((subtotal * pajak / 100 + subtotal) - (subtotaltp * diskon / 100)))  || 0 | currency  }}</h3>
                                  <p class="text-muted text-center">
                                  <button type="submit"  class="btn btn-primary btn-success" >Bayar</button> 
                                  <a href="#"  @click="printBill(printMe)" class="btn btn-primary btn-success" >Print Bill</a>               
                                  </p>
                            </div>
                            <div v-else-if="pembayaran === '2'">
                              <div class="input-group">
                                    <span class="input-group-addon">Card Carge %</span>
                                    <input type="number" step=".01" class="form-control" v-model="taxDebit" placeholder="0" >
                                    <input type="hidden" class="form-control" :value="((subtotal * pajak / 100 + subtotal) - ((subtotal * pajak / 100 + subtotal) * diskon / 100)) * taxDebit / 100 " :name="pajakKartu" >
                                  </div>
                                  <p>
                                  <div class="input-group">
                                    <span class="input-group-addon">Card No.</span>
                                    <input type="number" class="form-control" v-model="noDebit" placeholder="No Kartu" >
                                  </div>
                                  <p>
                                  <div class="input-group">
                                    <span class="input-group-addon">Rp.</span>
                                    <input type="number" class="form-control" v-model="totalBayar" placeholder="Bayar" required>
                                  </div>
                                  <br>
                                  <p class="text-muted text-center">
                                  <button type="submit"  class="btn btn-primary btn-success" >Bayar</button>       
                                  <a href="#"  @click="printBill(printMe)" class="btn btn-primary btn-success" >Print Bill</a>         
                                  </p>
                            </div>
                            <div v-else-if="pembayaran === '3'">
                              Emoney
                            </div>

               
              </form>

              <div id="printMe">
                <section class="invoice">
                <!-- info row -->
                <p class="text-muted text-center">
                <img :src="'/image/logoNota.png'" >
                </p>
                <p class="text-bold text-center">
               
                    Phone / Wa: 081 239 099 998<br>
                    Email: warungdaladesa@gmail.com<br>
                    FB : warungdaladesa<br>
                    IG : warung.daladesa.sangeh
                  
                </p>
              <div class="row invoice-info">
                <div class="col-xs-6">
                  <p class="text-muted" style="margin-top: 2px;">
                  <address>
                    <strong>Customer :</strong> {{pelanggan}}<br>
                    <b> Tgl : </b>{{tglNota}}<br>
                    <b> Meja No : </b>{{post.noMeja}}<br>
                    <b>Waiter : </b>{{post.name}}<br>
                  </address>
                  
                </div>
                <!-- /.col -->
                <div class="col-xs-6">
                  <p class="text-muted" style="margin-top: 2px;">
                  <address>
                  <b>No Inv: </b>{{noNota}}<br>
                  <b>Kasir : </b>{{$session.get('user')}}<br>
                  <b>Pax: </b>{{post.paxMeja}}<br>
                  <b>Type : </b>
                  <span v-if="pembayaran === '1'">
                    Cash
                  </span>
                  <span v-else-if="pembayaran === '2'">
                    Debit
                  </span>
                  <span v-else-if="pembayaran === '3'">
                    E-Money
                  </span>
                  </address>
                  
                </div>

                <!-- /.col -->
              <!-- /.row -->

                <div class="col-xs-12 table-responsive">
                  <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>Nama </th>
                                    <th>Qty</th>
                                    <th>Harga</th>
                                    <th>Total</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="trx in trxs" :key="trx.id">
                                    <td >{{ trx.nmBarangTmp }} </td>
                                    <td >{{ trx.qtyTmp}}</td>
                                    <td >{{ trx.hrgJualTmp | currency }}</td>
                                    <td >{{ trx.totalTmp | currency }}</td>
                                </tr>
                                </tbody>
                                    <tr>
                                        <th colspan="3">subTotal :</th>
                                        <th>{{subtotal | currency}}</th>
                                    </tr>
                                    <tr>
                                        <th colspan="3">Tax & Service : {{ pajak }} %</th>
                                        <th>{{ Math.floor(subtotal * pajak / 100 ) | currency}}</th>
                                    </tr>
                                    <tr>
                                        <th colspan="3">Discount : {{ diskon }} %</th>
                                        <th>{{ Math.floor(subtotaltp * diskon / 100) | currency}}</th>
                                    </tr>
                                    <tr>
                                        <th colspan="3">subTotal :</th>
                                        <th>{{ Math.floor((subtotal * pajak / 100 + subtotal) - (subtotaltp * diskon / 100))  || 0 | currency }}</th>
                                    </tr>

                                    <tr v-if="pembayaran === '1'">
                                    </tr>
                                    <tr v-else-if="pembayaran === '2'">
                                        <th colspan="3">Card Charge : {{ taxDebit }} %</th>
                                        <th>{{ Math.floor((subtotal * pajak / 100 + subtotal) - (subtotaltp * diskon / 100)) * taxDebit / 100 | currency }}</th>
                                    </tr>

                                    <tr>
                                        <th colspan="3">Payment :</th>
                                        <th>{{ Math.floor(((subtotal * pajak / 100 + subtotal) - (subtotaltp * diskon / 100)) + ((subtotal * pajak / 100 + subtotal) - (subtotaltp * diskon / 100)) * taxDebit / 100)  || 0 | currency }}</th>
                                    </tr>

                                    <tr v-if="pembayaran === '1'">
                                        <th colspan="3">Kembalian :</th>
                                        <th>{{ Math.floor(totalBayar - ((subtotal * pajak / 100 + subtotal) - (subtotaltp * diskon / 100)))  || 0 | currency }}</th>
                                    </tr>
                                    <tr v-else-if="pembayaran === '2'">
                                    </tr>

                            </table>
                            <p class="text-bold text-center">
                                Terima Kasih <br>
                                Belanja Anda Hal Baik Bagi Dunia<br>
                                Tidak enak Kasi Tau Kami, ENAK kasi tau temanmu<br>                              
                            </p>
                </div>
              </div>
                </section>
    </div>
              


              </div>
            </div>
          </div>
        </div>
      </div>
    </transition>
  </div>
<!---- Modal End ---->
                    
    </div>


    

</template>

<style type="text/css">
.autocomplete-box-li:hover {
  background-color: #f2f2f2;
}
.autocomplete-box{
  position: absolute;
  z-index: 1;
}

    #printMe { display: none; }


    @media print
    {
      @page{
        margin: 0;
      }
      body * {
        visibility: hidden;
      }
      #printMe, #printMe * {
        visibility: visible;
        font-size: 8pt;
      }
      #printMeSplit, #printMeSplit * {
        visibility: visible;
        font-size: 8pt;
      }
      #lastOrder, #lastOrder * {
        visibility: visible;
      }

      #printMe {
        position: absolute;
        left: 0;
        top: 0;
        font-size: 8pt;
        width: 100%;
        height: 100%;
      }
      #printMeSplit {
        position: absolute;
        left: 0;
        top: 0;
        font-size: 8pt;
        width: 100%;
        height: 100%;
      }

      #lastOrder {
        position: absolute;
        left: 0;
        top: 0;
        font-size: 8pt;
        width: 100%;
      }
    }
    </style>


<script>
  import DatePicker from 'vue2-datepicker';
  import 'vue2-datepicker/index.css';
  import VueSingleSelect from "vue-single-select";

  import Print from 'vue-print-plugin';
 

  
    export default {
      components: { DatePicker, VueSingleSelect, Print },
        data() {
            return {
                post: {},
                waiters: {},
                statusMeja:{},
                orders:[],
                orders1:{},
                move1: null,
                post1: null,
                post2: [],
                waiter: {},
                users: {},
                menus: {},
                menu:'',
                menuss: [],
                trxs: [],
                mejaKosong: {},
                validation: [],
                showModalMove: false,
                showModal: false,
                showModalMenu: false,
                showModalBayar: false,
                showModalSplit: false,
                nmBarang: '',
                idBarang: '',
                hargaJual: '',
                qtyBarang: '',
                note:  '',
                sisaStok: '',
                noNota: '',
                pelanggans: {},
                pelanggan: 'Cash',
                noMeja: '',
                total: '',
                subtotal: '',
                subtotaltp: '',
                pajak: '0',
                diskon: '0',
                diskon1: '',
                totalTransaksi: '',
                totalTransaksipjk: '',
                totalBayar: '',
                kembalianBayar: '0',
                totalTransaksiBayar: '',
                type: '',
                brg: '',
                taxDebit: '0',
                noDebit: '0',
                pembayaran: '1',
                pajakKartu:'',
                mytimer: 0,
                adminuser: '',
                nmMenu1: '',
                kdMenu1: '',
                qtySplit: [],
                printMe: '',
                printMeSplit: '',
                crt: [],
                splitNota: [],
                groupNota: 0,

                //waitername : this.waiter.name,
                //optionLabel: users.nmBarang,
                tglNota: new Date().toJSON().slice(0,10).replace(/-/g,'/'),
                
            }
        },
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            }
        },
        created() {
            let uri = `/api/meja/${this.$route.params.id}`;
            this.axios.get(uri).then((response) => {
                this.post = response.data.data;
            });
            this.loadMejaKosong();
            this.loadTotal();
            this.loadTotalTnpPromo();
            this.loadNota();
            this.loadDataMenu();
            this.loadDataTransaksi();
            this.loadWaiter();
            this.ListOrder();
            this.ListOrder1();
            this.loadPelanggan();
            this.adminuser = this.$session.get('roleID');
            localStorage.setItem('notaSplit', '[]');
            if(localStorage.getItem('cartItems') != null){
              this.crt = JSON.parse(localStorage.getItem('cartItems'));
              // localStorage.setItem('cartItems',JSON.stringify(trxs));
            }else{
              localStorage.setItem('cartItems', '[]');
            }
            
            
            
            
        },
        watch: {
          post: function() {
            this.$emit('input', this.post);
          }
        },
        //props: ['value'],
        props: ['optionLabel','value',],

              
        methods: {
          addG: function() {
              this.groupNota++
          },
          opensplit(trxs){
            this.showModalSplit = true;
            history.pushState(null, null, location.href);
                    window.onpopstate = function () {
                        history.go(1);
                    };
            // let cartItems = this.orders;
            // localStorage.setItem('cartItems', '[]');
            if(localStorage.getItem('cartItems') === '[]'){
              localStorage.setItem('cartItems',JSON.stringify(trxs));
              this.getCart();
              this.getSplitNota();
            }else{
              // var cartItems = JSON.parse(localStorage.getItem('cartItems'));
              // var $ada = cartItems.filter(d => d.noMejaTmp === this.mj);
              // if($ada != null){
                this.getCart();
                this.getSplitNota();
              // }else{
              //   cartItems.push(trxs);
              //   localStorage.setItem('cartItems',JSON.stringify(cartItems));
              //   this.getCart();
              // this.getSplitNota();
              // }
            }           
          },
          getCart: function() {
                //  if (this.crt === null){
                //       this.crt = localStorage.setItem('cartItems', '[]');
                //  }else{
                   this.crt = JSON.parse(localStorage.getItem('cartItems'));
                      // const cartItems = JSON.parse(localStorage.getItem('cartItems'));
                      // const objIndex = cartItems.findIndex((e => e.noMejaTmp === '15'));
                      // this.crt = cartItems.filter(b => b.noMejaTmp === this.mj);
                      this.isicart = Object.keys(JSON.parse(localStorage.getItem('cartItems'))).length;
                 // }
            },
          getSplitNota: function() {
                 if (this.splitNota === null){
                      this.splitNota = localStorage.setItem('notaSplit', '[]');
                 }else{
                      this.splitNota = JSON.parse(localStorage.getItem('notaSplit'));
                      // var notaSplit = JSON.parse(localStorage.getItem('notaSplit'));
                      // this.splitNota = notaSplit.filter(d => d.noMejaTmp === this.mj);
                      // this.isicart = JSON.parse(localStorage.getItem('notaSplit')).length;
                 }
            },
          updateItem(barcode, index, trx) {
                const cartItems = JSON.parse(localStorage.getItem('cartItems'));
                const objIndex = cartItems.findIndex((e => e.id === barcode));
                const newQty = parseInt(this.qtySplit[index]) ;
                cartItems[objIndex].qtyTmp = cartItems[objIndex].qtyTmp - parseInt(newQty);
                localStorage.setItem('cartItems',JSON.stringify(cartItems));
                //alert('Quantity Update')
                this.getCart();
                this.isicart = Object.keys(JSON.parse(localStorage.getItem('cartItems'))).length;

                // notaSplit.push(trx);	
                // localStorage.setItem('cartItems',JSON.stringify(cartItems));
                // localStorage.setItem('notaSplit',JSON.stringify(trx));
                  let notaSplit;
                    if (localStorage.getItem('notaSplit')===null){
                        notaSplit = [];
                    }else{
                        notaSplit = JSON.parse(localStorage.getItem('notaSplit'));
                    
                        const oldItems = JSON.parse(localStorage.getItem('notaSplit')) || [];
                        const existingItem = oldItems.find(({ id }) => id === trx.id);
                        if (existingItem) {
                            const objIndex = notaSplit.findIndex((e => e.id === trx.id));
                            const oldQty = notaSplit[objIndex].qtyTmp;
                            const newQty = parseInt(oldQty) + parseInt(this.qtySplit[index]) ;
                            notaSplit[objIndex].qtyTmp = parseInt(newQty);
                            localStorage.setItem('notaSplit',JSON.stringify(notaSplit));
                            alert('Quantity Update')
                            
                            this.getCart();
                            this.getSplitNota();
                            this.isiNotaSplit = Object.keys(JSON.parse(localStorage.getItem('notaSplit'))).length;
                        }else{
                        notaSplit.push(trx);
                        const objIndex = notaSplit.findIndex((e => e.id === trx.id));
                        notaSplit[objIndex].qtyTmp = parseInt(this.qtySplit[index]);	
                        localStorage.setItem('notaSplit',JSON.stringify(notaSplit));
                        this.getCart();
                        this.getSplitNota();
                        this.isiNotaSplit = Object.keys(JSON.parse(localStorage.getItem('notaSplit'))).length;
                        alert(trx.nmBarangTmp + " berhasil disimpan")
                        
                        }
                        // this.qtySplit = 0 ;
                    }
            },
          select_menu(menu){
                this.post2.id = menu.id
                this.post2.nmMenu = menu.nmMenu
                this.post2.kdMenu = menu.kdMenu
                this.post2.ktgMenu = menu.ktgMenu
                this.post2.promoMenu = menu.promoMenu
                this.post2.hargaMenu = menu.hargaMenu
                this.menu = menu.nmMenu
                this.menuss = [];
            },
          get_menu(){
                if(this.menu.length == 0){
                    this.menuss = [];
                }
                if(this.menu.length > 0){
                    axios.get('/api/carimenu',{params: {menu: this.menu}}).then(response => {
                        this.menuss = response.data.data;
                    });
                }
            },
          onlyNumber ($event) {
                //console.log($event.keyCode); //keyCodes value
                let keyCode = ($event.keyCode ? $event.keyCode : $event.which);
                if ((keyCode < 48 || keyCode > 57) && keyCode !== 46) { // 46 is dot
                    $event.preventDefault();
                }   
            },
            qtyOnsplit () {
                //console.log($event.keyCode); //keyCodes value
                let keyCode = ($event.keyCode ? $event.keyCode : $event.which);
                if ((keyCode < 48 || keyCode > 57) && keyCode !== 46) { // 46 is dot
                    $event.preventDefault();
                }   
            },

            cekStok() {
                this.brg = this.post1 - this.qtyBarang;
            },
            printBill() {
              //alert('print bill');
                window.print(printMe);
                //this.showModalBayar = false
            },
            printBillSplit() {
              //alert('print bill');
                window.print(printMeSplit);
                //this.showModalBayar = false
            },
            printOrder(id) {
               // alert('print last order'+ id);
                window.print(lastOrder);
                setTimeout(function(){
                  let uri = '/api/afterorderprint/'+ id;
                  this.axios.post(uri, this.post)
                      .then((response) => {
                          //this.$router.push({name: 'posts'});
                          this.orders = response.data.data;
                          this.ListOrder();
                          this.ListOrder1();
                          //this.intervalFetchData();
                      }).catch(error => {
                        this.ListOrder();
                      //this.validation = error.response.data.data;
                        //alert('ada yang error stelah print');
                  });
                }, 12000); 
                setTimeout(() => this.$router.push({name: 'meja'}), 13000);
            },
            ListOrder(){
              let uri = `/api/orderprint/${this.$route.params.id}`;
                this.axios.post(uri, this.post)
                    .then((response) => {
                        //this.$router.push({name: 'posts'});
                        this.orders = response.data.data;
                    }).catch(error => {
                    //this.validation = error.response.data.data;
                      alert('ada yang error');
                });
            },
            ListOrder1(){
              let uri = `/api/orderprint1/${this.$route.params.id}`;
                this.axios.post(uri, this.post)
                    .then((response) => {
                        //this.$router.push({name: 'posts'});
                        this.orders1 = response.data.data;
                    }).catch(error => {
                    //this.validation = error.response.data.data;
                      alert('ada yang error');
                });
            },
            PostUpdate() {
                let uri = `/api/posts/update/${this.$route.params.id}`;
                this.axios.post(uri, this.post)
                    .then((response) => {
                        this.$router.push({name: 'posts'});
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            },
            loadTotal:function(){
                let uri = `/api/totalTrx/${this.$route.params.id}`;
                this.axios.post(uri).then(response => {
                  this.subtotal = response.data.subTotal;
                }).catch(error => {
                    console.log(error.response)
                });
            },
            loadTotalTnpPromo:function(){
                let uri = `/api/totalTrxTnpPromo/${this.$route.params.id}`;
                this.axios.post(uri).then(response => {
                  this.subtotaltp = response.data.subTotal;
                }).catch(error => {
                    console.log(error.response)
                });
            },
            loadNota:function(){
                let uri = `/api/noNota/${this.$route.params.id}`;
                this.axios.post(uri).then(response => {
                this.noNota = response.data.noNota;
                
            });
            },
            loadDataMenu:function(){
                let uri = '/api/menu';
                this.axios.get(uri).then(response => {
                this.menus = response.data.data;
                
            });
            },
            loadPelanggan:function(){
                let uri = '/api/pelanggan';
                this.axios.get(uri).then(response => {
                this.pelanggans = response.data.data;
                
            });
            },
            loadDataTransaksi:function(){
                let uri = `/api/transaksi/${this.$route.params.id}`;
                this.axios.post(uri).then(response => {
                this.trxs = response.data.data;
                
                
            });
            },
            PostMove() {
                let uri = '/api/meja/pindah';
                this.axios.post(uri, {
                  noMejaLama: this.post.id,
                  noMejaBaru: this.move1.id,
                  waiterMeja: this.post.waiterMeja,
                })
                    .then((response) => {
                        this.$router.push({name: 'meja'});
                    }).catch(error => {
                        this.$router.push({name: 'meja'});
                });
            },
            loadMejaKosong:function(){
                let uri = '/api/mejakosong/';
                this.axios.get(uri).then(response => {
                this.mejaKosong = response.data.data;
                
                
            });
            },
            loadWaiter: function(){
                axios.get('/api/user/')
                    .then(function (response) {
                        this.waiters = response.data.data;
                    }.bind(this));
            },
            PostDeleteTrx(id)
            {
                this.axios.delete(`/api/orderDelete/${id}`)
                    .then(response => {
                        alert('Berhasil Di Hapus');
                        this.loadDataTransaksi();
                        this.loadTotal();
                        this.ListOrder();
                        this.ListOrder1();
                    }).catch(error => {
                    
                });
            },
            
            PostMenu() {
                let uri = '/api/addMenu/store';
                this.axios.post(uri, 
                {
                    noNota: this.noNota,
                    noMeja: this.post.id,
                    nmBarang: this.post2.nmMenu,
                    idBarang: this.post2.kdMenu,
                    hargaJual: this.post2.hargaMenu,
                    qtyBarang: this.qtyBarang,
                    total: this.post2.hargaMenu * this.qtyBarang,
                    type: this.post2.kdMenu,
                    tglNota: this.tglNota,
                    waiterOrder: this.post.name,
                    note: this.note,
                    ktgMenu: this.post2.ktgMenu,
                    promoMenu: this.post2.promoMenu
                }).then((response) => {
                        //alert('sukses donkkkkkkkk');
                        alert('sukses ditambahkan');
                        this.loadDataTransaksi();
                        this.loadTotal();
                        this.loadTotalTnpPromo();
                        this.ListOrder();
                        this.ListOrder1();
                        this.menu= '';
                        this.note= '';
                        this.qtyBarang= '';
                        this.post2.hargaMenu= '';
                        //this.cekStatusMeja()
                        //this.showModalMenu = false
                    });
                
            },
            PostTransaksi() {
                let uri = '/api/addTransaksi/store';
                this.axios.post(uri, 
                {
                    noNota: this.noNota,
                    noMeja: this.post.id,
                    pelanggan: this.pelanggan,
                    tglNota: this.tglNota,
                    taxNota: Math.floor(this.subtotal * this.pajak / 100),
                    chargeNota: Math.floor((this.subtotal * this.pajak / 100 + this.subtotal) - (this.subtotaltp * this.diskon / 100)) * this.taxDebit / 100,
                    diskonNota: Math.floor(this.subtotaltp * this.diskon / 100),
                    totalNota: Math.floor((this.subtotal * this.pajak / 100 + this.subtotal) - (this.subtotaltp * this.diskon / 100)) + ((this.subtotal * this.pajak / 100 + this.subtotal) - (this.subtotaltp * this.diskon / 100)) * this.taxDebit / 100,
                    bayarNota: this.totalBayar,
                    userNota: this.$session.get('userId'),
                    waiterNota: this.post.name,
                    typeNota: this.pembayaran,
                    pax: this.post.paxMeja,
                    pajakPembayaran: this.pajak,
                    diskonPembayaran: this.diskon,
                    chargePembayaran: this.taxDebit,
                    noKartuPembayaran: this.noDebit,
                    
                    kembalianNota: Math.abs(this.totalBayar - (((this.subtotal * this.pajak / 100 + this.subtotal) - (this.subtotaltp * this.diskon / 100)) + ((this.subtotal * this.pajak / 100 + this.subtotal) - (this.subtotal * this.diskon / 100)) * this.taxDebit / 100)),
                    
                }).then((response) => {
                        //this.$print(printMe);
                        window.print(printMe)
                        this.totalBayar = '';
                        localStorage.removeItem('cartItems');
                        setTimeout(function(){
                            window.location.href = '/meja';
                        }, 13000);           
                }).catch(error => {
                    alert('error! bro');
                    //console.log(error.response.message)
                });
                
            },
            intervalFetchData: function () {
            this.mytimer = setInterval(() => {    
                this.ListOrder();
                }, 3000);    
            },
            PostSplit() {
              var isiform = this.splitNota;
              var gr = this.groupNota;
              isiform.forEach(function (element) {
                element.groupNot = gr;
              });
              var formData = new FormData();
              formData.append('data', JSON.stringify(isiform));
              console.log(JSON.stringify(isiform));
                let uri = '/api/addSplit/store';
                this.axios.post(uri, formData)
                .then((response) => {
                        //this.$print(printMe);
                        window.print(printMeSplit);
                        this.totalBayar = '';
                        setTimeout(() => {    
                          localStorage.setItem('notaSplit', '[]'); 
                          this.getSplitNota();
                        }, 3000);
                }).catch(error => {
                    alert('error! bro');
                    //console.log(error.response.message)
                });
                  
            },
        },
        mounted () {
            //this.intervalFetchData1();
            //this.intervalFetchData();
            //this.bindings()
            //loadData.call(this)
            this.loadTotalTnpPromo();
            // if(this.isicart > 0){
            // window.onbeforeunload = function() { return "Your work will be lost."; };
            // }
            
        },

        beforeDestroy () {
            clearInterval(this.mytimer)
            console.log('detail bersih')
        },

        computed: {
          totalItem: function(){
              let sum = 0;
              for(let i = 0; i < this.splitNota.length; i++){
                sum += (parseFloat(this.splitNota[i].hrgJualTmp) * parseFloat(this.splitNota[i].qtyTmp));
              }

            return sum;
          },
          
}
        
    }
</script>
