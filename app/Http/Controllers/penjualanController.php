<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Penjualan;
use App\PenjualanDetail;
use App\Pembayara;

//use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class penjualanController extends Controller
{
    //
    public function index()
    {
        $posts = Penjualan::join('tblMeja', 'tblPenjualan.noMeja', 'tblMeja.id')
                ->join('tblPembayaran', 'tblPenjualan.noNota', 'tblPembayaran.notaPembayaran')
                ->join('users', 'tblPenjualan.userNota', 'users.id')
                ->select('tblpenjualan.*', 'tblMeja.noMeja', 'users.name', 
                'tblPembayaran.pajakPembayaran', 'tblPembayaran.diskonPembayaran',
                'tblPembayaran.typePembayaran', 'tblPembayaran.chargePembayaran', 'tblPembayaran.noKartuPembayaran')
                ->orderBy('tblPenjualan.id', 'DESC')
                ->get();
        return response([
            'success' => true,
            'message' => 'List Semua SPenjualan',
            'data' => $posts
        ], 200);
    }
    public function sorting(Request $request)
    {
        //$from = date('2021/02/01');
        //$to = date('2021/02/02');
        $startDate = $request->input('startDate');
        $endDate = $request->input('endDate');

        $posts = Penjualan::whereBetween('tglNota', [$startDate, $endDate])->get();
        $NotalTOtal = Penjualan::whereBetween('tglNota', [$startDate, $endDate])->sum('totalNota');
        $pajakSum = Penjualan::whereBetween('tglNota', [$startDate, $endDate])->sum('taxNota');
        $diskonSum = Penjualan::whereBetween('tglNota', [$startDate, $endDate])->sum('diskonNota');

        //$posts = Penjualan::latest()->get();
        return response([
            'success' => true,
            'message' => 'List Semua SPenjualan',
            'startDate' => $startDate,
            'endDate' => $endDate,
            'notaSum' => $NotalTOtal,
            'pajakSum' => $pajakSum,
            'diskonSum' => $diskonSum,
            'data' => $posts
        ], 200);

    }
    public function listDetailPenjualan($id)
    {
        //$post = TransaksiDetail::whereId($id)->first();
        $post = DB::table('tblPenjualanDetail')
                    ->where('noNota', $id)->get();

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
    
    public function destroy($id)
    {
        $post = Penjualan::findOrFail($id);
        $kdPenjualan = $post->noNota;

        PenjualanDetail::where('noNota', $kdPenjualan)->delete();
        Pembayara::where('notaPembayaran', $kdPenjualan)->delete();

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
