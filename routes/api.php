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

Route::post('/login', 'loginController@login');

//======barang
Route::get('/posts', 'salesController@index');
Route::get('/semuabarang', 'salesController@semua');
Route::get('/mentah', 'salesController@mentah');
Route::post('/posts/store', 'salesController@store');
Route::get('/posts/{id?}', 'salesController@show');
Route::get('/detailbarang/{id?}', 'salesController@showDetailBarang');
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

//========pelanggan
Route::get('/pelanggan', 'customerController@index');
Route::post('/pelanggan/store', 'customerController@store');
Route::get('/pelanggan/{id?}', 'customerController@show');
Route::post('/pelanggan/update/{id?}', 'customerController@update');
Route::delete('/pelanggan/{id?}', 'customerController@destroy');

//========meja
Route::get('/meja', 'mejaController@index');
Route::get('/mejakosong', 'mejaController@mejakosong');
Route::post('/meja/pindah', 'mejaController@pindah');
Route::post('/meja/store', 'mejaController@store');
Route::post('/meja/duduk', 'mejaController@duduk');
Route::get('/meja/{id?}', 'mejaController@show');
Route::get('/detail/{id?}', 'mejaController@detail');
Route::post('/meja/update/{id?}', 'mejaController@update');
Route::post('/meja/cekin/{id?}', 'mejaController@cekin');
Route::post('/meja/cancelcekin/{id?}', 'mejaController@cancelcekin');
Route::delete('/meja/{id?}', 'mejaController@destroy');

//===========transaksi
Route::post('/addItem/store', 'mejaController@addItem');
Route::post('/addMenu/store', 'mejaController@addMenu');
Route::post('/transaksi/{id}', 'mejaController@listTransaksi');
Route::delete('/orderDelete/{id?}', 'mejaController@destroy1');
Route::post('/addTransaksi/store', 'mejaController@addTransaksi');
Route::post('/orderprint/{id}', 'mejaController@printOrder');
Route::post('/orderprint1/{id}', 'mejaController@printOrder1');
Route::post('/afterorderprint/{id}', 'mejaController@afterPrintOrder');

//=========total
Route::post('/totalTrx/{id}', 'mejaController@totalTrx');
Route::post('/totalTrxTnpPromo/{id}', 'mejaController@totalTrxTnpPromo');



//=======penomeran
Route::post('/noNota/{id}', 'nomorController@noNota');
Route::get('/kodeBarang', 'nomorController@kodeBarang');
Route::get('/kodeMenu', 'nomorController@kodeMenu');
Route::get('/kodePembelian', 'nomorController@kodePembelian');
Route::get('/kodeSupplier', 'nomorController@kodeSupplier');
Route::get('/kodePelanggan', 'nomorController@kodePelanggan');
Route::get('/kodeKategori', 'nomorController@kodeKategori');
Route::get('/kodeStokOpname', 'nomorController@kodeStokOpname');
Route::get('/username', 'nomorController@kodeUsername');


//=========Pembelian
Route::post('/addItemPembelian/store', 'pembelianController@addItemPembelian');
Route::post('/dataPembelian/{id}', 'pembelianController@listTransaksiPembelian');
Route::post('/totalTrxPembelian', 'pembelianController@totalTrxPembelian');
Route::delete('/pembelianDelete/{id?}', 'pembelianController@destroy1');
Route::post('/addPembelian/store', 'pembelianController@addTransaksiPembelian');

//=======live Order
Route::get('/orderlist', 'mejaController@listOrder');
//=======carimenu
Route::get('/carimenu', 'menuController@cariMenu');

//========menu
Route::get('/menu', 'menuController@index');
Route::get('/kategorimenu', 'menuController@ktgMenu');
Route::post('/menu/store', 'menuController@store');
Route::get('/menu/{id?}', 'menuController@show');
Route::get('/detailMenu/{id?}', 'menuController@detail');
Route::post('/menu/update/{id?}', 'menuController@update');
Route::delete('/menu/{id?}', 'menuController@destroy');

//========User
Route::get('/user', 'loginController@index');
Route::post('/user/store', 'loginController@store');
Route::get('/user/{id?}', 'loginController@show');
Route::post('/user/update/{id?}', 'loginController@update');
Route::delete('/user/{id?}', 'loginController@destroy');

//========komposisi
Route::get('/komposisi', 'komposisiController@index');
Route::get('/itemKomposisi', 'komposisiController@allInventori');
Route::post('/komposisi/detail/{id}', 'komposisiController@detail');
Route::post('/komposisi/store', 'komposisiController@store');
Route::delete('/komposisi/{id?}', 'komposisiController@destroy');

//=====Laporan Penjualan
Route::get('/penjualan', 'penjualanController@index');
Route::get('/penjualanbulanan', 'penjualanController@laporanBulanan');
Route::post('/lapPenjualan', 'penjualanController@sorting');
Route::post('/lapPenjualanBulanan', 'penjualanController@laporanBulananSorting');
Route::get('/detailpenjualan/{id}', 'penjualanController@listDetailPenjualan');
Route::delete('/hapuspenjualan/{id?}', 'penjualanController@destroy');

//=====Laporan Pembelian
Route::get('/pembelian', 'pembelianController@index');
Route::get('/pembelianBulanan', 'pembelianController@laporanBulanan');
Route::post('/lapPembelian', 'pembelianController@sorting');
Route::post('/lapPembelianBulanan', 'pembelianController@laporanBulananSorting');
Route::get('/detailpembelian/{id}', 'pembelianController@listDetailPembelian');
Route::delete('/hapuspembelian/{id?}', 'pembelianController@hapusPembelian');

//=========Stok
Route::get('/detailstok/{id}', 'stokController@DetailStok');
Route::post('/detailstokopname/{id}', 'stokController@DetailStokOpname');
Route::get('/stokopname', 'stokController@allOpname');
Route::post('/addItemOpname/store', 'stokController@addItemOpname');
Route::post('/dataStokOpname/{id}', 'stokController@listTransaksiOpname');

Route::delete('/opnameDelete/{id?}', 'stokController@destroy1');
Route::post('/totalTrxOpname', 'stokController@totalTrxOpname');
Route::post('/addOpname/store', 'stokController@addTransaksiOpname');

//=========Inventori
Route::get('/inventori', 'stokController@indexInventori');
Route::get('/baranginventori', 'salesController@barangInventori');
Route::post('/detailinventori/{id}', 'stokController@DetailInventori');
Route::post('/inputInventori', 'stokController@inputInv');
Route::post('/dataStokInventori/{id}', 'stokController@listTransaksiInventori');
Route::delete('/opnameInvDelete/{id?}', 'stokController@destroyInv');
