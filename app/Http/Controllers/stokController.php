<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\KartuStok;

class stokController extends Controller
{
    //
    public function index()
    {
        $posts = KartuStok::latest()->get();
        return response([
            'success' => true,
            'message' => 'List Semua Supplier',
            'data' => $posts
        ], 200);
    }

    public function DetailStok($id)
    {
        //$post = TransaksiDetail::whereId($id)->first();
        $post = KartuStok::where('kdBarang', $id)->get();

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

    public function inputOpname(Request $request)
    {
        //$post = TransaksiDetail::whereId($id)->first();
        $post = KartuStok::create([
            'kdBarang' => $request->input('kdBarang'),
            'tglKartu' => $request->input('tglOpname'),
            'qtyMasuk' => $request->input('qtyMasuk'),
            'qtyKeluar' => $request->input('qtyKeluar'),
            

        ]);

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

    public function addItemPembelian(Request $request)
    {
        $brg = DB::table('tblStokOpnameDetail')
                ->where('kdBarang', $request->input('kdBarang'))
                ->where('noStokOpname', $request->input('noStokOpname'))
                ->first();
        if ($brg == null ){

            $post = StokOpnameDetail::create([
                'noStokopname'     => $request->input('noStokOpname'),
                'kdBarang'     => $request->input('kdBarang'),
                'tglStok'     => $request->input('tglStok'),
                'qtyGudang'     => $request->input('qtyGudang'),
                'selisihStok'     => $request->input('selisihStok'),
                'keteranganStok'     => $request->input('keteranganStok'),
                'satuanStok'     => $request->input('satuanStok'),
            ]);
            
            $barang = DB::table('tblBarang')->where('kdBarang', $request->input('kdBarang'))->first();
            $stokLama = $barang->stkBarang;
            $satuanKartu = $barang->satuanBarang;

            DB::table('tblBarang')->where('kdBarang', $request->input('kdBarang'))->update([
                'stkBarang'     => $stokLama + $request->input('selisihStok')
            ]);
            if($stokLama < $request->input('qtyGudang')){
                    $nilai = $request->input('selisihStok');
            }else{
                    $nilai = '0';
            }
            KartuStok::create([
                'kdBarang'     => $request->input('kdBarang'),
                'tglKartu'     => $request->input('tglNotaPembelian'),
                'qtyMasuk'     => $request->input('qtyBeli'),
                'qtyKeluar'     => $nilai,
                'noTransaksi'     => $request->input('noNotaPembelian'),
                'keteranganKartu'     => 'Pembelian',
                'satuanKartu' => $satuanKartu,
            ]);

                return response()->json([
                    'success' => true,
                    'message' => 'Post Berhasil Disimpan!',
                ], 200);

        } else {

            //=========PembelianDetail
            $brng = DB::table('tblPembelianDetail')
                ->where('kdBarang', $request->input('kdBarang'))
                ->where('noNotaPembelian', $request->input('noNotaPembelian'))
                ->first();
            $qtyB = $brng->qtyBeli ;
            $totalB = $brng->totalBeli ;
            
            
            DB::table('tblPembelianDetail')
                ->where('kdBarang', $request->input('kdBarang'))
                ->where('noNotaPembelian', $request->input('noNotaPembelian'))
                ->update([
                    'qtyBeli' => $qtyB + $request->input('qtyBeli'),
                    'totalBeli' => $totalB + $request->input('totalBeli'),
                    ]);
            
            $barang = DB::table('tblBarang')->where('kdBarang', $request->input('kdBarang'))->first();
            $stokLama = $barang->stkBarang;
        
            DB::table('tblBarang')->where('kdBarang', $request->input('kdBarang'))->update([
            'stkBarang'     => $stokLama + $request->input('qtyBeli')
            ]);
            //=========EndPembelianDetail
            //=========Update Kartu Stok
            $brngstok = DB::table('tblKartuStok')
                ->where('kdBarang', $request->input('kdBarang'))
                ->where('noTransaksi', $request->input('noNotaPembelian'))
                ->first();
            $qtyS = $brngstok->qtyMasuk ;
            DB::table('tblKartuStok')
                ->where('kdBarang', $request->input('kdBarang'))
                ->where('noTransaksi', $request->input('noNotaPembelian'))
                ->update([
                    'qtyMasuk' => $qtyS + $request->input('qtyBeli'),
                    ]);
            //=========endKartu stok

            

                    return response()->json([
                        'success' => true,
                        'message' => 'Post Berhasil Disimpan!',
                    ], 200);

            
        }
    }



}
