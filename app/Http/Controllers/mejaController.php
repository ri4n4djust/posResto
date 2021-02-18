<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Meja;
use App\TransaksiDetail;
use App\Transaksi;
use App\Barang;
use App\Penjualan;

use Illuminate\Support\Facades\DB;

use Illuminate\Support\Facades\Validator;

class mejaController extends Controller
{
    //

    public function index()
    {
        $posts = Meja::latest()->get();
        return response([
            'success' => true,
            'message' => 'List Semua Supplier',
            'data' => $posts
        ], 200);
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
        $post = Meja::whereId($id)->first();

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
        $post = Meja::whereId($id)->first();

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
                'status'   => $request->input('status'),
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

            DB::table('tblBarang')->where('kdBarang', $request->input('idBarang'))->update([
                'stkBarang'     => $stokLama - $request->input('qtyBarang')
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
            
                DB::table('tblBarang')->where('kdBarang', $request->input('kdBarang'))->update([
                'stkBarang'     => $stokLama + $request->input('qtyBeli')

                ]);

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

        /*
            $barang = DB::table('tblMenu')->where('id', $request->input('idBarang'))->first();
            foreach ($barang as $b) {

                $komposisi = DB::table('tblKomposisi')->where('idMenu', $b->id)->first();
                $qtyKomposisi = $komposisi->qtyBarang;
                $idBarang = $komposisi->idBarang;

                $barang = DB::table('tblBarang')->where('kdBarang', $request->input('idBarang'))->first();
                $stokLama = $barang->stkBarang;

                DB::table('tblBarang')->where('id', $request->input('idBarang'))->update([
                    'stkBarang'     => $stokLama - $qtyKomposisi
                ]);
            
            }
            */

            
            
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
            'bayarNota'     => $request->input('bayarNota'),
            'kembalianNota'     => $request->input('kembalianNota'),
            'pelangganNota'     => $request->input('pelanggan'),
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
