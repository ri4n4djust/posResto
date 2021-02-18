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
    
}
