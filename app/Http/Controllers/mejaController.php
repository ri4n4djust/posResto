<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Meja;
use App\TransaksiDetail;
use App\Transaksi;
use App\Barang;
use App\Penjualan;
use App\KartuStok;
use App\KartuStokInventori;
use App\Pembayara;

use Illuminate\Support\Facades\DB;

use Illuminate\Support\Facades\Validator;

class mejaController extends Controller
{
    //

    public function index()
    {
        $posts = Meja::get();
        return response([
            'success' => true,
            'message' => 'List Semua Supplier',
            'data' => $posts
        ], 200);
    }

    public function mejakosong()
    {
        $posts = Meja::where('status', '0')->get();
        return response([
            'success' => true,
            'message' => 'List Semua Supplier',
            'data' => $posts
        ], 200);
    }

    public function pindah(Request $request)
    {

        Meja::whereId($request->input('noMejaLama'))->update([
            'status'   => '0',
            'waiterMeja' => '0',
        ]);
        Meja::whereId($request->input('noMejaBaru'))->update([
            'status'   => '1',
            'waiterMeja' => $request->input('waiterMeja'),
        ]);
            $post = TransaksiDetail::where('noMejaTmp', $request->input('noMejaLama'))->update([
                'noMejaTmp'     => $request->input('noMejaBaru'),
                //'paxMeja'   => $request->input('paxMeja'),
            ]);

            if ($post) {
                return response()->json([
                    'success' => true,
                    'message' => 'Post Berhasil Disimpan!',
                ], 200);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Post Gagal Disimpan!',
                ], 400);
            }
        
    }

    public function store(Request $request)
    {
        //validate data
        $validator = Validator::make($request->all(), [
            'noMeja'     => 'required'
        ],
            [
                'noMeja.required' => 'Masukkan NO Meja',
            ]
        );

        if($validator->fails()) {

            return response()->json([
                'success' => false,
                'message' => 'Silahkan Isi Bidang Yang Kosong',
                'data'    => $validator->errors()
            ],400);

        } else {
            //$file = $request->file('gbrBarang');

            //$imageName = time().'.'.$request->name->getClientOriginalExtension();
            //$request->image->move(public_path('images'), $imageName);

            $post = Meja::create([
                'noMeja'     => $request->input('noMeja'),
                'paxMeja'   => $request->input('paxMeja'),
                'status'   => 0
            ]);


            if ($post) {
                return response()->json([
                    'success' => true,
                    'message' => 'Post Berhasil Disimpan!',
                ], 200);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Post Gagal Disimpan!',
                ], 400);
            }
        }
    }


    public function show($id)
    {
        $post = Meja::join('users', 'tblMeja.waiterMeja', 'users.id')
        ->where('tblMeja.id', $id)
        ->select('tblMeja.*', 'users.name')
        ->first();

        if ($post) {
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'data'    => $post
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Post Tidak Ditemukan!',
                'data'    => ''
            ], 404);
        }
    }

    public function detail($id)
    {
        $post = Meja::join('users', 'tblMeja.waiterMeja', 'users.id')
        ->where('tblMeja.id', $id)
        ->select('tblMeja.*', 'users.name')
        ->first();

        if ($post) {
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'data'    => $post
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Post Tidak Ditemukan!',
                'data'    => ''
            ], 404);
        }
    }

    public function update(Request $request)
    {
        //validate data
        $validator = Validator::make($request->all(), [
            'noMeja'     => 'required'
        ],
            [
                'noMeja.required' => 'Masukkan No Meja!',
            ]
        );

        if($validator->fails()) {

            return response()->json([
                'success' => false,
                'message' => 'Silahkan Isi Bidang Yang Kosong',
                'data'    => $validator->errors()
            ],400);

        } else {

            $post = Meja::whereId($request->input('id'))->update([
                'noMeja'     => $request->input('noMeja'),
                'paxMeja'   => $request->input('paxMeja'),
            ]);


            if ($post) {
                return response()->json([
                    'success' => true,
                    'message' => 'Post Berhasil Diupdate!',
                ], 200);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Post Gagal Diupdate!',
                ], 500);
            }

        }

    }

    public function cekin(Request $request)
    {
            $post = Meja::whereId($request->input('idMeja'))->update([
                'status'   => '1',
                'waiterMeja' => $request->input('idWaiter'),
            ]);

            if ($post) {
                return response()->json([
                    'success' => true,
                    'message' => 'Post Berhasil Cek in!',
                ], 200);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Post Gagal Diupdate!',
                ], 404);
            }
    }

    public function cancelcekin($id)
    {
            $post = Meja::whereId($id)->update([
                'status'   => '0',
            ]);

            if ($post) {
                return response()->json([
                    'success' => true,
                    'message' => 'Post Berhasil Cancel Cek in!',
                ], 200);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Post Gagal Diupdate!',
                ], 404);
            }
    }

    public function addItem(Request $request)
    {
        $brg = DB::table('tblTmp_TransaksiDetail')
                ->where('kdBarangTmp', $request->input('idBarang'))
                ->where('noNotaTmp', $request->input('noNota'))
                ->first();
        if ($brg == null ){
            
            $post = TransaksiDetail::create([
                'noNotaTmp'     => $request->input('noNota'),
                'noMejaTmp'     => $request->input('noMeja'),
                'kdBarangTmp'     => $request->input('idBarang'),
                'hrgJualTmp'     => $request->input('hargaJual'),
                'qtyTmp'     => $request->input('qtyBarang'),
                'totalTmp'     => $request->input('total'),
                'typeTmp'     => $request->input('type'),
                'nmBarangTmp'     => $request->input('nmBarang'),
            ]);
            
            $barang = DB::table('tblBarang')->where('kdBarang', $request->input('idBarang'))->first();
            $stokLama = $barang->stkBarang;
            $satuanBarang = $barang->satuanBarang;
            DB::table('tblBarang')->where('kdBarang', $request->input('idBarang'))->update([
                'stkBarang'     => $stokLama - $request->input('qtyBarang')
            ]);

            $barangInv = DB::table('tblInventori')->where('kdBarang', $request->input('idBarang'))->first();
            $stokLamaInv = $barangInv->stkInventori;
            //$satuanBarang = $barang->satuanBarang;
            DB::table('tblInventori')->where('kdBarang', $request->input('idBarang'))->update([
                'stkInventori'     => $stokLamaInv - $request->input('qtyBarang')
            ]);

            KartuStok::create([
                'kdBarang'     => $request->input('idBarang'),
                'tglKartu'     => $request->input('tglNota'),
                'qtyMasuk'     => '0',
                'qtyKeluar'     => $request->input('qtyBarang'),
                'noTransaksi'     => $request->input('noNota'),
                'keteranganKartu'     => 'Penjualan',
                'satuanKartu' => $satuanBarang,
            ]);
            KartuStokInventori::create([
                'kdBarang'     => $request->input('idBarang'),
                'tglInv'     => $request->input('tglNota'),
                'qtyMasukInv'     => '0',
                'qtyKeluarInv'     => $request->input('qtyBarang'),
                'noTransaksiInv'     => $request->input('noNota'),
                'keteranganKartuInv'     => 'Penjualan',
                'satuanKartuInv' => $satuanBarang,
            ]);

                return response()->json([
                    'success' => true,
                    'message' => 'Post Berhasil Disimpan!',
                ], 200);
            } else {

                $brng = DB::table('tblTmp_TransaksiDetail')
                ->where('kdBarangTmp', $request->input('idBarang'))
                ->where('noNotaTmp', $request->input('noNota'))
                ->first();
                $qtyB = $brng->qtyTmp ;
                $totalB = $brng->totalTmp ;

                DB::table('tblTmp_transaksiDetail')
                    ->where('kdBarangTmp', $request->input('idBarang'))
                    ->where('noNotaTmp', $request->input('noNota'))
                    ->update([
                        'qtyTmp' => $qtyB + $request->input('qtyBarang'),
                        'totalTmp' => $totalB + $request->input('total'),
                        ]);
                
                $barang = DB::table('tblBarang')->where('kdBarang', $request->input('idBarang'))->first();
                $stokLama = $barang->stkBarang;
                DB::table('tblBarang')->where('kdBarang', $request->input('idBarang'))->update([
                'stkBarang'     => $stokLama - $request->input('qtyBarang')
                ]);

                $barangInv = DB::table('tblInventori')->where('kdBarang', $request->input('idBarang'))->first();
                $stokLamaInv = $barangInv->stkInventori;
                DB::table('tblInventori')->where('kdBarang', $request->input('idBarang'))->update([
                'stkInventori'     => $stokLamaInv - $request->input('qtyBarang')
                ]);
                //=========Update Kartu Stok
                    $brngstok = DB::table('tblKartuStok')
                    ->where('kdBarang', $request->input('idBarang'))
                    ->where('noTransaksi', $request->input('noNota'))
                    ->first();
                $qtyS = $brngstok->qtyKeluar ;
                DB::table('tblKartuStok')
                    ->where('kdBarang', $request->input('idBarang'))
                    ->where('noTransaksi', $request->input('noNota'))
                    ->update([
                        'qtyKeluar' => $qtyS + $request->input('qtyBarang'),
                        ]);
                //===================
                        $brngstokInv = DB::table('tblKartuStokInventori')
                        ->where('kdBarang', $request->input('idBarang'))
                        ->where('noTransaksiInv', $request->input('noNota'))
                        ->first();
                    $qtySInv = $brngstokInv->qtyKeluarInv ;
                    DB::table('tblKartuStokInventori')
                        ->where('kdBarang', $request->input('idBarang'))
                        ->where('noTransaksiInv', $request->input('noNota'))
                        ->update([
                            'qtyKeluarInv' => $qtySInv + $request->input('qtyBarang'),
                            ]);
                //=========endKartu stok

                return response()->json([
                    'success' => true,
                    'message' => 'Post Berhasil Disimpan!',
                ], 200);
            }
        
    }

    public function addMenu(Request $request)
    {
        $brg = DB::table('tblTmp_TransaksiDetail')
                ->where('kdBarangTmp', $request->input('idBarang'))
                ->where('noNotaTmp', $request->input('noNota'))
                ->first();
        if ($brg == null ){

        $post = TransaksiDetail::create([
            'noNotaTmp'     => $request->input('noNota'),
            'noMejaTmp'     => $request->input('noMeja'),
            'kdBarangTmp'     => $request->input('idBarang'),
            'hrgJualTmp'     => $request->input('hargaJual'),
            'qtyTmp'     => $request->input('qtyBarang'),
            'totalTmp'     => $request->input('total'),
            'typeTmp'     => $request->input('type'),
            'nmBarangTmp'     => $request->input('nmBarang'),
        ]);

        

                $kompo = DB::table('tblKomposisi')
                            ->where('idMenu', '=', $request->input('idBarang'))
                            ->get();
                foreach ($kompo as $k){
                        $ko = $k->idBarang;
                        $qtyCost = $k->qtyBarang * $request->input('qtyBarang');
                        $qtyCostSatuan = $k->totalSatuan * $request->input('qtyBarang'); 

                        $barang = DB::table('tblBarang')->where('kdBarang', $ko)->first();
                        $stokLama = $barang->stkBarang;
                        $satuanBarang = $barang->satuanBarang;
                        DB::table('tblBarang')->where('kdBarang', $ko)
                        ->update(array('stkBarang' => $stokLama - $qtyCost ));


                        $barangInv = DB::table('tblInventori')->where('kdBarang', $ko)->first();
                        $stokLamaInv = $barangInv->stkInventori;
                        DB::table('tblInventori')->where('kdBarang', $ko)
                        ->update(array('stkInventori' => $stokLamaInv - $qtyCostSatuan ));
                        
                        //=========Update Kartu Stok
                        KartuStok::insert([
                            'kdBarang'     => $k->idBarang,
                            'tglKartu'     => $request->input('tglNota'),
                            'qtyMasuk'     => '0',
                            'qtyKeluar'     => $qtyCost,
                            'noTransaksi'     => $request->input('noNota'),
                            'keteranganKartu'     => 'Penjualan Menu',
                            'satuanKartu' => $satuanBarang,
                        ]);
                        KartuStokInventori::insert([
                            'kdBarang'     => $k->idBarang,
                            'tglInv'     => $request->input('tglNota'),
                            'qtyMasukInv'     => '0',
                            'qtyKeluarInv'     => $qtyCostSatuan,
                            'noTransaksiInv'     => $request->input('noNota'),
                            'keteranganKartuInv'     => 'Penjualan Menu',
                            'satuanKartuInv' => $satuanBarang,
                        ]);
                        //=========endKartu stok

                }
            
                return response()->json([
                    'success' => true,
                    'komposisi' => $kompo,
                    'message' => 'Post Berhasil Disimpan!',
                ], 200);
                
            } else {

                $brng = DB::table('tblTmp_TransaksiDetail')
                ->where('kdBarangTmp', $request->input('idBarang'))
                ->where('noNotaTmp', $request->input('noNota'))
                ->first();
                $qtyB = $brng->qtyTmp ;
                $totalB = $brng->totalTmp ;

                DB::table('tblTmp_transaksiDetail')
                    ->where('kdBarangTmp', $request->input('idBarang'))
                    ->where('noNotaTmp', $request->input('noNota'))
                    ->update([
                        'qtyTmp' => $qtyB + $request->input('qtyBarang'),
                        'totalTmp' => $totalB + $request->input('total'),
                        ]);
                
                $kompo = DB::table('tblKomposisi')
                        ->where('idMenu', '=', $request->input('idBarang'))
                        ->get();
                foreach ($kompo as $k){
                    $ko = $k->idBarang;
                    $qtyCost = $k->qtyBarang * $request->input('qtyBarang');
                    $qtyCostSatuan = $k->totalSatuan * $request->input('qtyBarang'); 

                    $barang = DB::table('tblBarang')->where('kdBarang', $ko)->first();
                    $stokLama = $barang->stkBarang;
                    $satuanBarang = $barang->satuanBarang;
                    DB::table('tblBarang')->where('kdBarang', $ko)
                    ->update(array('stkBarang' => $stokLama - $qtyCost ));

                    $barangInv = DB::table('tblInventori')->where('kdBarang', $ko)->first();
                    $stokLamaInv = $barangInv->stkInventori;
                    //$satuanBarang = $barang->satuanBarang;
                    DB::table('tblInventori')->where('kdBarang', $ko)
                    ->update(array('stkInventori' => $stokLamaInv - $qtyCostSatuan ));


                    KartuStok::insert([
                        'kdBarang'     => $k->idBarang,
                        'tglKartu'     => $request->input('tglNota'),
                        'qtyMasuk'     => '0',
                        'qtyKeluar'     => $qtyCost,
                        'noTransaksi'     => $request->input('noNota'),
                        'keteranganKartu'     => 'Penjualan Menu',
                        'satuanKartu' => $satuanBarang,
                    ]);
                    KartuStokInventori::insert([
                        'kdBarang'     => $k->idBarang,
                        'tglInv'     => $request->input('tglNota'),
                        'qtyMasukInv'     => '0',
                        'qtyKeluarInv'     => $qtyCostSatuan,
                        'noTransaksiInv'     => $request->input('noNota'),
                        'keteranganKartuInv'     => 'Penjualan Menu',
                        'satuanKartuInv' => $satuanBarang,
                    ]);
                    //=========endKartu stok
                
                }  

                

                return response()->json([
                    'success' => true,
                    'message' => 'Post Berhasil Disimpan!',
                ], 200);
            }
        
    }

    public function addTransaksi(Request $request)
    {
        $post = Penjualan::create([
            'noNota'     => $request->input('noNota'),
            'noMeja'     => $request->input('noMeja'),
            'tglNota'     => $request->input('tglNota'),
            'totalNota'     => $request->input('totalNota'),
            'taxNota'     => $request->input('taxNota'),
            'diskonNota'     => $request->input('diskonNota'),
            'bayarNota'     => $request->input('bayarNota'),
            'kembalianNota'     => $request->input('kembalianNota'),
            'pelangganNota'     => $request->input('pelanggan'),
            'userNota'     => $request->input('userNota'),
            'waiterNota'     => $request->input('waiterNota'),
            'typeNota'  => $request->input('typeNota'),
            'chargeNota'  => $request->input('chargeNota'),
        ]);

        Pembayara::insert([
            'notaPembayaran'     => $request->input('noNota'),
            'diskonPembayaran'     => $request->input('diskonPembayaran'),
            'pajakPembayaran'     => $request->input('pajakPembayaran'),
            'typePembayaran'     => $request->input('typeNota'),
            'chargePembayaran'     => $request->input('chargePembayaran'),
            'noKartuPembayaran'     => $request->input('noKartuPembayaran'),
        ]);

        
        $tmpTrx = DB::table('tblTmp_TransaksiDetail')->where('noMejaTmp', $request->input('noMeja'))->get();
        $dataSet = [];
        foreach ($tmpTrx as $s) {
            $dataSet[] = [
                'noNota'  => $request->input('noNota'),
                'noMeja'    => $s->noMejaTmp,
                'kdBarang'       => $s->kdBarangTmp,
                'hrgJual' => $s->hrgJualTmp,
                'qty' => $s->qtyTmp,
                'total' => $s->totalTmp,
                'type' => $s->typeTmp,
                'nmBarang' =>$s->nmBarangTmp, 
            ];
        }
        DB::table('tblPenjualanDetail')->insert($dataSet);
        DB::table('tblMeja')->where('id', $request->input('noMeja'))->update(['status'   => '0' ,]);
        DB::table('tblTmp_TransaksiDetail')->where('noMejaTmp', $request->input('noMeja'))->delete();


            if ($post) {
                return response()->json([
                    'success' => true,
                    'message' => 'Post Berhasil Disimpan!',
                ], 200);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Post Gagal Disimpan!',
                ], 400);
            }
        
    }

    public function listTransaksi($id)
    {
        //$post = TransaksiDetail::whereId($id)->first();
        $post = DB::table('tblTmp_TransaksiDetail')
                    ->where('noMejaTmp',$id)->get();

        if ($post) {
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'data'    => $post
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Post Tidak Ditemukan!',
                'data'    => ''
            ], 404);
        }
    }

    public function listOrder()
    {
        //$post = TransaksiDetail::whereId($id)->first();
        $post = TransaksiDetail::join('tblmeja', 'tbltmp_transaksidetail.noMejaTmp', '=', 'tblmeja.id')
                ->get();

        if ($post) {
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'data'    => $post
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Post Tidak Ditemukan!',
                'data'    => ''
            ], 404);
        }
    }

    public function totalTrx($id)
    {
        $totalNota = DB::table('tblTmp_TransaksiDetail')
            ->where('noMejaTmp', '=', $id)
            ->sum('totalTmp');

        if ($totalNota) {
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'subTotal'    => $totalNota
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Post Tidak Ditemukan!',
                'data'    => ''
            ], 404);
        }
    }

    public function destroy1($id)
    {
        $post = TransaksiDetail::findOrFail($id);

        $noNotaTmp = $post->noNotaTmp;
        $kodebarang = $post->kdBarangTmp;
        $qtybarang = $post->qtyTmp;
        
        
        if (Barang::where('kdBarang', $kodebarang)->exists()) {
            // exists
        $barang = DB::table('tblBarang')->where('kdBarang', $kodebarang)->first();
        $stokLama = $barang->stkBarang;
        DB::table('tblBarang')->where('kdBarang', $kodebarang)->update([
                'stkBarang'     => $stokLama + $qtybarang
        ]);

        $barangInv = DB::table('tblInventori')->where('kdBarang', $kodebarang)->first();
        $stokLamaInv = $barangInv->stkInventori;
        DB::table('tblInventori')->where('kdBarang', $kodebarang)->update([
                'stkInventori'     => $stokLamaInv + $qtybarang
        ]);


        DB::table('tblKartuStok')
            ->where('kdBarang', $kodebarang)
            ->where('noTransaksi', $noNotaTmp)
            ->where('keteranganKartu', 'Penjualan')
            ->delete();
            
        DB::table('tblKartuStokInventori')
            ->where('kdBarang', $kodebarang)
            ->where('noTransaksiInv', $noNotaTmp)
            ->where('keteranganKartuInv', 'Penjualan')
            ->delete();

            $post->delete();
            return response()->json([
                'success' => true,
                'message' => 'Post Berhasil Dihapus!',
            ], 200);

        } else {

                $kompo = DB::table('tblKomposisi')
                            ->where('idMenu', '=', $kodebarang)
                            ->get();
                foreach ($kompo as $k){
                        $ko = $k->idBarang;
                        $qtyCost = $k->qtyBarang * $qtybarang;
                        $qtyCostSatuan = $k->totalSatuan * $qtybarang;


                        $barang = DB::table('tblBarang')->where('kdBarang', $ko)->first();
                        $stokLama = $barang->stkBarang;
                        $satuanBarang = $barang->satuanBarang;
                        DB::table('tblBarang')->where('kdBarang', $ko)
                        ->update(array('stkBarang' => $stokLama + $qtyCost ));

                        $barangInv = DB::table('tblInventori')->where('kdBarang', $ko)->first();
                        $stokLamaInv = $barangInv->stkInventori;
                        //$satuanBarang = $barang->satuanBarang;
                        DB::table('tblInventori')->where('kdBarang', $ko)
                        ->update(array('stkInventori' => $stokLamaInv + $qtyCostSatuan ));

                        //=========Update Kartu Stok
                        DB::table('tblKartuStok')
                            ->where('kdBarang', $ko)
                            ->where('noTransaksi', $noNotaTmp)
                            ->where('keteranganKartu', 'Penjualan Menu')
                            ->delete();
                        DB::table('tblKartuStokInventori')
                            ->where('kdBarang', $ko)
                            ->where('noTransaksiInv', $noNotaTmp)
                            ->where('keteranganKartuInv', 'Penjualan Menu')
                            ->delete();
                        //=========endKartu stok

                }

        
            $post->delete();
            return response()->json([
                'success' => true,
                'message' => 'Post Berhasil Dihapus!',
            ], 200);
        }
        
    }

    public function destroy($id)
    {
        $post = Meja::findOrFail($id);
        $post->delete();

        if ($post) {
            return response()->json([
                'success' => true,
                'message' => 'Post Berhasil Dihapus!',
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Post Gagal Dihapus!',
            ], 500);
        }
    }
}
