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
}
