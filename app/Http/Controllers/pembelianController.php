<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\PembelianDetail;
use App\Pembelian;

use Illuminate\Support\Facades\DB;

class pembelianController extends Controller
{
    //
    public function addItemPembelian(Request $request)
    {
        $brg = DB::table('tblPembelianDetail')
                ->where('kdBarang', $request->input('kdBarang'))
                ->where('noNotaPembelian', $request->input('noNotaPembelian'))
                ->first();
        if (!$brg ){

            $brng = DB::table('tblPembelianDetail')
                ->where('kdBarang', $request->input('kdBarang'))
                ->where('noNotaPembelian', $request->input('noNotaPembelian'))
                ->get();
            $qtyB = $brng->qtyBeli ;

            DB::table('tblPembelianDetail')
                ->where('kdBarang', $request->input('kdBarang'))
                ->where('noNotaPembelian', $request->input('noNotaPembelian'))
                ->update([
                    'qtyBeli' => $qtyB + $request->input('qtyBeli'),
                    ]);

                    return response()->json([
                        'success' => true,
                        'message' => 'Post Berhasil Disimpan!',
                    ], 200);

        } else {

            $post = PembelianDetail::create([
                'noNotaPembelian'     => $request->input('noNotaPembelian'),
                'kdBarang'     => $request->input('kdBarang'),
                'hrgPokok'     => $request->input('hrgBeli'),
                'qtyBeli'     => $request->input('qtyBeli'),
                'totalBeli'     => $request->input('totalBeli'),
            ]);
            
            $barang = DB::table('tblBarang')->where('kdBarang', $request->input('kdBarang'))->first();
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

    public function listTransaksiPembelian(Request $request)
    {
        //$post = TransaksiDetail::whereId($id)->first();
        $post = DB::table('tblPembelianDetail')
                    ->join('tblBarang', 'tblBarang.kdBarang', '=', 'tblPembelianDetail.kdBarang')
                    ->select('tblPembelianDetail.*', 'tblBarang.nmBarang')
                    ->where('noNotaPembelian', $request->input('np'))->get();

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

    public function totalTrxPembelian(Request $request)
    {
        $totalNota = DB::table('tblPembelianDetail')
            ->where('noNotaPembelian', '=', $request->input('ntp'))
            ->sum('totalBeli');

        if ($totalNota) {
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'subTotalBeli'    => $totalNota
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Post Tidak Ditemukan!',
                'subTotalBeli'    => ''
            ], 404);
        }
    }

    public function addTransaksiPembelian(Request $request)
    {
        $post = Pembelian::create([
            'noNotaPembelian'     => $request->input('noNotaPembelian'),
            'idSupplier'     => $request->input('idSupplier'),
            'tglNotaPembelian'     => $request->input('tglNotaPembelian'),
            'totalNotaPembelian'     => $request->input('totalNotaPembelian'),
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
        

        $post = PembelianDetail::findOrFail($id);

        $kodebarang = $post->kdBarang;
        $qtybarang = $post->qtyBeli;

        $barang = DB::table('tblBarang')->where('kdBarang', $kodebarang)->first();
        $stokLama = $barang->stkBarang;

        DB::table('tblBarang')->where('kdBarang', $kodebarang)->update([
                'stkBarang'     => $stokLama - $qtybarang
        ]);

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
