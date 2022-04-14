<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Split;
use Illuminate\Support\Facades\DB;

class splitController extends Controller
{
    //
    public function add(Request $request){
        try {
            $request->request-set('data', json_decode($request->data));
            foreach ($request->data as $data)
            {
                $exception = DB::transaction(function() use ($request){
                $post = Split::create([
                    'noNota'     => $data->noNota,
                    'noNota'     => $data->noMeja,
                    'groupNota'     => $data->groupNota,
                    'kdBarang'     => $request->input('kdBarang'),
                    'nmBarang'     => $request->input('nmBarang'),
                    'hrgBarang'     => $request->input('hrgBarang'),
                    'qtyBarng'     => $request->input('qtyBarang'),
                    'subTotal'     => $request->input('subTotal'),
                ]);
                DB::commit();
                });
                if(is_null($exception)) {
                    return response()->json([
                        'success' => true,
                        'message' => 'Post Berhasil Disimpan!',
                    ], 200);
                } else {                    
                    DB::rollback();
                    return response()->json([
                        'success' => false,
                        'message' => 'Post Tidak Berhasil Disimpan!',
                    ], 200);
                }
            }
        } catch (\Exception $e) {
            //DB::rollback();
            // something went wrong
            return response()->json([
            'success' => false,
            'message' => 'exception'.$e,
        ], 400);
        }
    }
}
