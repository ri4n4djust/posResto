<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\KartuStok;
use App\KartuStokInventori;
use App\Inventori;
use App\StokOpnameDetail;
use App\StokOpname;

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

    public function indexInventori()
    {
        $posts = Inventori::join('tblBarang', 'tblInventori.kdBarang', '=', 'tblBarang.kdBarang')
        ->select('tblInventori.*', 'tblBarang.kdBarang', 'tblBarang.nmBarang', 'tblBarang.satuanBarang')
                ->get();
        return response([
            'success' => true,
            'message' => 'List Semua Inventori',
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

    public function DetailStokOpname($id)
    {
        //$post = TransaksiDetail::whereId($id)->first();
        $post = StokOpnameDetail::where('noStokOpname', $id)->get();

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

    public function allOpname()
    {
        $posts = StokOpname::latest()->get();
        return response([
            'success' => true,
            'message' => 'List Semua Supplier',
            'data' => $posts
        ], 200);
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
                'nilaiStok'   => $request->input('nilaiStok'),
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
                    'keteranganKartu'     => 'Stok Opname'.'-'.$request->input('keteranganStok'),
                    'satuanKartu' => $satuanKartu,
                ]);
    
                    return response()->json([
                        'success' => true,
                        'message' => 'Post Berhasil Disimpan!',
                    ], 200);
            }else{
                //$nilai = '0';
                DB::table('tblBarang')->where('kdBarang', $request->input('kdBarang'))->update([
                    'stkBarang'     => $stokLama + $request->input('selisihStok')
                ]);
                KartuStok::create([
                    'kdBarang'     => $request->input('kdBarang'),
                    'tglKartu'     => $request->input('tglStok'),
                    'qtyMasuk'     => '0',
                    'qtyKeluar'     => $request->input('selisihStok'),
                    'noTransaksi'     => $request->input('noStokOpname'),
                    'keteranganKartu'     => 'Stok Opname'.'-'.$request->input('keteranganStok'),
                    'satuanKartu' => $satuanKartu,
                ]);
    
                    return response()->json([
                        'success' => true,
                        'message' => 'Post Berhasil Disimpan!',
                    ], 200);
            }
            
            
            
        } else {

            

                    return response()->json([
                        'success' => false,
                        'message' => 'Sudah Ada',
                    ], 404);

            
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

    public function totalTrxOpname(Request $request)
    {
        $totalNota = DB::table('tblStokOpnameDetail')
            ->where('noStokOpname', '=', $request->input('ntp'))
            ->sum('nilaiStok');

        if ($totalNota) {
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'nilaiStok'    => $totalNota
            ], 200);
        } else {
            return response()->json([
                'success' => true,
                'message' => 'Post Tidak Ditemukan!',
                'nilaiStok'    => ''
            ], 200);
        }
    }

    public function addTransaksiOpname(Request $request)
    {
        $post = StokOpname::create([
            'noStokOpname'     => $request->input('noStokOpname'),
            'tglStok'     => $request->input('tglStok'),
            'totalOpname'     => $request->input('nilaiStok'),
        ]);

        DB::table('tblKartuStok')
                ->where('noTransaksi', $request->input('noStokOpname'))
                ->update([
                    'tglKartu' => $request->input('tglStok'),
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

    public function destroy1($id)
    {
        

        $post = StokOpnameDetail::findOrFail($id);

        $noStokOpname = $post->noStokOpname;
        $kodebarang = $post->kdBarang;
        $qtybarang = $post->selisihStok;

        $barang = DB::table('tblBarang')->where('kdBarang', $kodebarang)->first();
        $stokLama = $barang->stkBarang;

        DB::table('tblBarang')->where('kdBarang', $kodebarang)->update([
                'stkBarang'     => $stokLama - $qtybarang
        ]);

        DB::table('tblKartuStok')
            ->where('kdBarang', $kodebarang)
            ->where('noTransaksi', $noStokOpname)
            ->delete();

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
