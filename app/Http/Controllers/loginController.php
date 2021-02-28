<?php

namespace App\Http\Controllers;
use App\User;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;


//use Session;



class loginController extends Controller
{
    //
    
    public function login(Request $request)

    {
        $username = $request->username;
        
        $users = User::where(['email'=>$username])->first();


        if($users==''){

            return response([
                'success' => false,
                'message' => 'Gagal Login',
                //'data' => $users->password
            ], 200);

        } else 
       
        if(Hash::check($request->password, $users->password)){
            
            //$xx = Session::flash('message','This is a message!');
           //$ss = Session::put('user', $users->name);
           //Session::put('nmp', $users->name);
           //$aa = session(['user' => $users->name]);
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
}
