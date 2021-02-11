<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Kategori;
//use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class kategoriController extends Controller
{
    //
    public function index()
    {
        $data = Kategori::get();
        return response()->json($data);
    }

}
