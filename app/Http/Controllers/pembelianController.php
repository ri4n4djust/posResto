<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\PembelianDetail;

use Illuminate\Support\Facades\DB;

class pembelianController extends Controller
{
    //
    public function addItemPembelian(Request $request)
    {
            
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

    public function listTransaksiPembelian(Request $request)
    {
        //$post = TransaksiDetail::whereId($id)->first();
        $post = DB::table('tblPembelianDetail')
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
}
