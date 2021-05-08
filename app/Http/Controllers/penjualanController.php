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
    public function laporanBulanan()
    {

        $bulan = DB::table('tblPenjualan as w')
                ->select(array(DB::Raw('sum(w.totalNota) as total'),DB::Raw('sum(w.taxNota) as ppn'),DB::Raw('sum(w.diskonNota) as diskon'),DB::Raw('sum(w.chargeNota) as charge'),DB::Raw('w.tglNota')))
                ->groupBy('w.tglNota')
                ->orderBy('w.tglNota')
                ->get();
        return response([
                    'success' => true,
                    'message' => 'List Semua SPenjualan',
                    'data' => $bulan
                ], 200);
    }
    public function laporanBulananSorting(Request $request)
    {

        $startDate = $request->input('startDate');
        $endDate = $request->input('endDate');

        $bulan = DB::table('tblPenjualan as w')
                ->select(array(DB::Raw('sum(w.totalNota) as total'),DB::Raw('sum(w.taxNota) as ppn'),DB::Raw('sum(w.diskonNota) as diskon'),DB::Raw('sum(w.chargeNota) as charge'),DB::Raw('w.tglNota')))
                ->groupBy('w.tglNota')
                ->orderBy('w.tglNota')
                ->whereBetween('w.tglNota', [$startDate, $endDate])
                ->get();
                $NotalTOtal = Penjualan::whereBetween('tglNota', [$startDate, $endDate])->sum('totalNota');
                $pajakSum = Penjualan::whereBetween('tglNota', [$startDate, $endDate])->sum('taxNota');
                $diskonSum = Penjualan::whereBetween('tglNota', [$startDate, $endDate])->sum('diskonNota');
                $chargeSum = Penjualan::whereBetween('tglNota', [$startDate, $endDate])->sum('chargeNota');

        return response([
                    'success' => true,
                    'message' => 'List Semua SPenjualan',
                    'startDate' => $startDate,
                    'endDate' => $endDate,
                    'notaSum' => $NotalTOtal,
                    'pajakSum' => $pajakSum,
                    'diskonSum' => $diskonSum,
                    'chargeSum' => $chargeSum,
                    'data' => $bulan
                ], 200);
    }
    public function sorting(Request $request)
    {
        //$from = date('2021/02/01');
        //$to = date('2021/02/02');
        $startDate = $request->input('startDate');
        $endDate = $request->input('endDate');
        $cr = $request->input('typeNotaCari');
        if($cr == 0){
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
        }else{
            $posts = Penjualan::whereBetween('tglNota', [$startDate, $endDate])
                                ->where('typeNota', $cr)
                                ->get();
            $NotalTOtal = Penjualan::whereBetween('tglNota', [$startDate, $endDate])
                                ->where('typeNota', $cr)
                                ->sum('totalNota');
            $pajakSum = Penjualan::whereBetween('tglNota', [$startDate, $endDate])
                                ->where('typeNota', $cr)
                                ->sum('taxNota');
            $diskonSum = Penjualan::whereBetween('tglNota', [$startDate, $endDate])
                                ->where('typeNota', $cr)
                                ->sum('diskonNota');

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
