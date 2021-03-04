<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\KartuStok;
use App\StokOpnameDetail;

use Illuminate\Support\Facades\DB;

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

    public function addItemOpname(Request $request)
    {
        $brg = DB::table('tblStokOpnameDetail')
                ->where('kdBarang', $request->input('kdBarang'))
                ->where('noStokOpname', $request->input('noStokOpname'))
                ->first();
        if ($brg == null ){

            $post = StokOpnameDetail::create([
                'noStokOpname'     => $request->input('noStokOpname'),
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

            if($request->input('qtyGudang') > $stokLama){
                //$nilai = $request->input('selisihStok');
                DB::table('tblBarang')->where('kdBarang', $request->input('kdBarang'))->update([
                    'stkBarang'     => $stokLama + $request->input('selisihStok')
                ]);
                KartuStok::create([
                    'kdBarang'     => $request->input('kdBarang'),
                    'tglKartu'     => $request->input('tglStok'),
                    'qtyMasuk'     => $request->input('selisihStok'),
                    'qtyKeluar'     => '0',
                    'noTransaksi'     => $request->input('noStokOpname'),
                    'keteranganKartu'     => 'Stok Opname',
                    'satuanKartu' => $satuanKartu,
                ]);
    
                    return response()->json([
                        'success' => true,
                        'message' => 'Post Berhasil Disimpan!',
                    ], 200);
            }else{
                //$nilai = '0';
                DB::table('tblBarang')->where('kdBarang', $request->input('kdBarang'))->update([
                    'stkBarang'     => $stokLama - $request->input('selisihStok')
                ]);
                KartuStok::create([
                    'kdBarang'     => $request->input('kdBarang'),
                    'tglKartu'     => $request->input('tglStok'),
                    'qtyMasuk'     => '0',
                    'qtyKeluar'     => $request->input('selisihStok'),
                    'noTransaksi'     => $request->input('noStokOpname'),
                    'keteranganKartu'     => 'Stok Opname',
                    'satuanKartu' => $satuanKartu,
                ]);
    
                    return response()->json([
                        'success' => true,
                        'message' => 'Post Berhasil Disimpan!',
                    ], 200);
            }
            
            
            
        } else {

            //=========PembelianDetail
            $brng = DB::table('tblStokOpnameDetail')
                ->where('kdBarang', $request->input('kdBarang'))
                ->where('noStokOpname', $request->input('noStokOpname'))
                ->first();
            $qtyR = $brng->qtyGudang ;
            //$totalB = $brng->totalBeli ;
            
            
            DB::table('tblStokOpnameDetail')
                ->where('kdBarang', $request->input('kdBarang'))
                ->where('noStokOpname', $request->input('noStokOpname'))
                ->update([
                    'qtyBeli' => $qtyR + $request->input('qtyGudang'),
                    ]);
            
            $barang = DB::table('tblBarang')->where('kdBarang', $request->input('kdBarang'))->first();
            $stokLama = $barang->stkBarang;
        
            DB::table('tblBarang')->where('kdBarang', $request->input('kdBarang'))->update([
            'stkBarang'     => $stokLama + $request->input('selisihStok')
            ]);
            //=========StokOpnameDetail
            //=========Update Kartu Stok
            $brngstok = DB::table('tblKartuStok')
                ->where('kdBarang', $request->input('kdBarang'))
                ->where('noTransaksi', $request->input('noStokOpname'))
                ->first();
            $qtyS = $brngstok->qtyMasuk ;
            DB::table('tblKartuStok')
                ->where('kdBarang', $request->input('kdBarang'))
                ->where('noTransaksi', $request->input('noStokOpname'))
                ->update([
                    'qtyMasuk' => $qtyS + $request->input('selisihStok'),
                    ]);
            //=========endKartu stok

            

                    return response()->json([
                        'success' => true,
                        'message' => 'Post Berhasil Disimpan!',
                    ], 200);

            
        }
    }

    public function listTransaksiOpname($id)
    {
        //$post = TransaksiDetail::whereId($id)->first();
        $post = DB::table('tblStokOpnameDetail')
                    ->join('tblBarang', 'tblBarang.kdBarang', '=', 'tblStokOpnameDetail.kdBarang')
                    ->select('tblStokOpnameDetail.*', 'tblBarang.nmBarang')
                    ->where('noStokOpname', $id)->get();

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



}
