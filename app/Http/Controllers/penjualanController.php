<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Penjualan;
//use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class penjualanController extends Controller
{
    //
    public function index()
    {
        $posts = Penjualan::latest()->get();
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

        //$posts = Penjualan::latest()->get();
        return response([
            'success' => true,
            'message' => 'List Semua SPenjualan',
            'startDate' => $startDate,
            'endDate' => $endDate,
            'data' => $posts
        ], 200);

    }
    
}
