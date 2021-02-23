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
use App\Supplier;
use Illuminate\Support\Facades\DB;

class nomorController extends Controller
{
    //
    public function noNota($id)
    {
        $no = 0 ;
        $count = Penjualan::latest()->count();
        $kodeBaru = $no + $count + 1  ;

        $tahun = date('Y');
        $post = 'INV-'.$tahun.'-'.$id.'-'.$kodeBaru;

        

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
        $no = 0 ;
        $count = Barang::latest()->first();
        //$kodeBaru = $count->kdBarang  ;
        $terakhir = substr($count->kdBarang, 8,  20);
        $kodeBaru = $terakhir + 1  ;

        $tahun = date('Y');
        $post = 'DB-'.$tahun.'-'.$kodeBaru;

        if (Barang::where('kdBarang', $post)->exists()) {
            // exists
            $kodeBarulagi = $kodeBaru + 1 ;
            $post = 'DB-'.$tahun.'-'.$kodeBarulagi;
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'ada' => 'gggada',
                'kdBarang'    => $post
            ], 200);
        } else {
            return response()->json([
                'success' => true,
                'ada' => 'tidak ada',
                'message' => 'Detail Post!',
                'kdBarang'    => $post
            ], 200);
        }
    }
    public function kodeMenu()
    {
        $no = 0 ;
        $count = Menu::latest()->count();
        $kodeBaru = $no + $count + 1  ;

        $tahun = date('Y');
        $post = 'MN-'.$tahun.'-'.$kodeBaru;

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
        $post = 'PB-'.$tahun.'-'.$kodeBaru;

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

    public function kodeSupplier()
    {
        $no = 0 ;
        $count = Supplier::latest()->count();
        $kodeBaru = $no + $count + 1  ;

        $tahun = date('Y');
        $post = 'SP-'.$tahun.'-'.$kodeBaru;

        if ($post) {
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'kdSupplier'    => $post
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Post Tidak Ditemukan!',
                'kdSupplier'    => ''
            ], 404);
        }
    }
}
