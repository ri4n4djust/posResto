<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

//======barang
Route::get('/posts', 'salesController@index');
Route::post('/posts/store', 'salesController@store');
Route::get('/posts/{id?}', 'salesController@show');
Route::post('/posts/update/{id?}', 'salesController@update');
Route::delete('/posts/{id?}', 'salesController@destroy');

//=======kategori
Route::get('/kategori', 'kategoriController@index');
Route::post('/kategori/store', 'kategoriController@store');
Route::get('/kategori/{id?}', 'kategoriController@show');
Route::post('/kategori/update/{id?}', 'kategoriController@update');
Route::delete('/kategori/{id?}', 'kategoriController@destroy');

//========supplier
Route::get('/supplier', 'supplierController@index');
Route::post('/supplier/store', 'supplierController@store');
Route::get('/supplier/{id?}', 'supplierController@show');
Route::post('/supplier/update/{id?}', 'supplierController@update');
Route::delete('/supplier/{id?}', 'supplierController@destroy');


//========meja
Route::get('/meja', 'mejaController@index');
Route::post('/meja/store', 'mejaController@store');
Route::post('/meja/duduk', 'mejaController@duduk');
Route::get('/meja/{id?}', 'mejaController@show');
Route::get('/detail/{id?}', 'mejaController@detail');
Route::post('/meja/update/{id?}', 'mejaController@update');
Route::delete('/meja/{id?}', 'mejaController@destroy');

//===========transaksi
Route::post('/addItem/store', 'mejaController@addItem');
Route::post('/addMenu/store', 'mejaController@addMenu');
Route::post('/transaksi/{id}', 'mejaController@listTransaksi');
Route::delete('/orderDelete/{id?}', 'mejaController@destroy1');
Route::post('/addTransaksi/store', 'mejaController@addTransaksi');

//=========total
Route::post('/totalTrx/{id}', 'mejaController@totalTrx');



//=======penomeran
Route::post('/noNota/{id}', 'nomorController@noNota');
Route::get('/kodeBarang', 'nomorController@kodeBarang');
Route::get('/kodeMenu', 'nomorController@kodeMenu');
Route::get('/kodePembelian', 'nomorController@kodePembelian');


//=========Pembelian
Route::post('/addItemPembelian/store', 'pembelianController@addItemPembelian');
Route::post('/dataPembelian', 'pembelianController@listTransaksiPembelian');
Route::post('/totalTrxPembelian', 'pembelianController@totalTrxPembelian');

//========menu
Route::get('/menu', 'menuController@index');
Route::post('/menu/store', 'menuController@store');
Route::get('/menu/{id?}', 'menuController@show');
Route::get('/detailMenu/{id?}', 'menuController@detail');
Route::post('/menu/update/{id?}', 'menuController@update');
Route::delete('/menu/{id?}', 'menuController@destroy');

//========komposisi
Route::get('/komposisi', 'komposisiController@index');
Route::get('/komposisi/detail/{id}', 'komposisiController@detail');
Route::post('/komposisi/store', 'komposisiController@store');
Route::delete('/komposisi/{id?}', 'komposisiController@destroy');