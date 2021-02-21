<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\KartuStok;

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



}
