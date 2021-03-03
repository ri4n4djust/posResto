<?php

namespace App\Http\Controllers;
use App\User;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;


//use Session;



class loginController extends Controller
{
    //
    public function index()
    {
        $posts = User::latest()->get();
        return response([
            'success' => true,
            'message' => 'List Semua User',
            'data' => $posts
        ], 200);
    }
    
    public function login(Request $request)

    {
        $username = $request->username;
        
        $users = User::where(['email'=>$username])
                        ->orWhere(['username'=>$username])
                        ->first();


        if($users==''){

            return response([
                'success' => false,
                'message' => 'Gagal Login',
                //'data' => $users->password
            ], 200);

        } else 
       
        if(Hash::check($request->password, $users->password)){
            
           return response([
            'success' => true,
            'message' => 'Berhasil Login',
            'data' => $users
        ], 200);
        

        } else {
             
            return response([
                'success' => false,
                'message' => 'Gagal Login',
                //'data' => $users->password
            ], 200);
  
        }
    }

    public function store(Request $request)
    {
        //validate data
        $validator = Validator::make($request->all(), [
            'username'     => 'required'
        ],
            [
                'username.required' => 'Masukkan Nama',
            ]
        );

        if($validator->fails()) {

            return response()->json([
                'success' => false,
                'message' => 'Silahkan Isi Bidang Yang Kosong',
                'data'    => $validator->errors()
            ],400);

        } else {
            //$file = $request->file('gbrBarang');

            //$imageName = time().'.'.$request->name->getClientOriginalExtension();
            //$request->image->move(public_path('images'), $imageName);

            $post = User::create([
                'username'     => $request->input('username'),
                'name'     => $request->input('name'),
                'email'   => $request->input('email'),
                'password'   => Hash::Make($request->input('password')),
                'role'   => $request->input('role'),
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
    }


    public function show($id)
    {
        $post = User::where('username', '=', $id)->first();

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

    public function detail($id)
    {
        $post = User::where('username', $id)->first();

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

    public function update(Request $request)
    {
        //validate data
        $validator = Validator::make($request->all(), [
            'username'     => 'required'
        ],
            [
                'username.required' => 'Masukkan Nama Menu !',
            ]
        );

        if($validator->fails()) {

            return response()->json([
                'success' => false,
                'message' => 'Silahkan Isi Bidang Yang Kosong',
                'data'    => $validator->errors()
            ],400);

        } else {

            $post = Menu::whereId($request->input('id'))->update([
                'name'     => $request->input('name'),
                'email'   => $request->input('email'),
                'password'   => Hash::Make($request->input('password')),
                'role'   => $request->input('role'),
            ]);


            if ($post) {
                return response()->json([
                    'success' => true,
                    'message' => 'Post Berhasil Diupdate!',
                ], 200);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Post Gagal Diupdate!',
                ], 500);
            }

        }

    }

    public function destroy($id)
    {
        $post = User::findOrFail($id);
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
