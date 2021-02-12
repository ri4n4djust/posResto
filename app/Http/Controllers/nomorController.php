<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Meja;
use App\Menu;
use App\Barang;
use App\TransaksiDetail;
use App\Transaksi;
use App\Penjualan;
use App\Pembelian;
use App\PembelianDetail;
use Illuminate\Support\Facades\DB;

class nomorController extends Controller
{
    //
    public function noNota($id)
    {
        //$post = TransaksiDetail::whereId($id)->first();
        //$post = DB::table('tblTmp_TransaksiDetail')
        //            ->where('noMejaTmp',$id)->get();
        //$count = Penjualan::latest()->first();
        //$lama = $count->id;
        //$kodeBaru = $lama + 1  ;

        $tahun = date('Y');
        $post = 'INV-/'.$tahun.'/'.$id.'/'. rand(0, 99999999);

        if ($post) {
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'noNota'    => $post
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Post Tidak Ditemukan!',
                'data'    => ''
            ], 404);
        }
    }
    public function kodeBarang()
    {
        //$post = TransaksiDetail::whereId($id)->first();
        //$post = DB::table('tblTmp_TransaksiDetail')
                    //->where('noMejaTmp',$id)->get();
        //$count = Barang::latest()->first();
        //$lama = $count->id;
        //$kodeBaru = $lama + 1  ;

        $tahun = date('Y');
        $post = 'DB-/'.$tahun.'/'.rand(0, 99999);
        //$post = DB::table('tblBarang')
                    //->where('kdBarang',$post)->get();
        

        if ($post) {
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'kdBarang'    => $post
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Post Tidak Ditemukan!',
                'data'    => ''
            ], 404);
        }
    }
    public function kodeMenu()
    {
        //$post = TransaksiDetail::whereId($id)->first();
        //$count = Menu::latest()->first();
        //$lama = $count->id;
        //$kodeBaru = $lama + 1  ;

        $tahun = date('Y');
        $post = 'MN-/'.$tahun.'/'.rand(0, 999999);

        if ($post) {
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'kdMenu'    => $post
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Post Tidak Ditemukan!',
                'kdMenu'    => ''
            ], 404);
        }
    }

    public function kodePembelian()
    {
        $no = 0 ;
        $count = Pembelian::latest()->count();
        $kodeBaru = $no + $count + 1  ;

        $tahun = date('Y');
        $post = 'PB-/'.$tahun.'/'.$kodeBaru;

        if ($post) {
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'kdPembelian'    => $post
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Post Tidak Ditemukan!',
                'kdPembelian'    => ''
            ], 404);
        }
    }
}
