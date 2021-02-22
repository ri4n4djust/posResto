<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/home', function () {
    return view('pages.home');
});

Route::get('/autocomp', function () {
    return view('pages.autoComp');
});

Route::get('/barang', function () {
    return view('pages.barang');
});
Route::get('/barangmentah', function () {
    return view('pages.barangmentah');
});
Route::get('/marketing', function () {
    return view('pages.marketing');
});

Route::get('/meja', function () {
    return view('pages.meja');
});

Route::get('/menu', function () {
    return view('pages.menu');
});

Route::get('/pembelian', function () {
    return view('pages.pembelian');
});
Route::get('/liveorder', function () {
    return view('pages.order');
});

Route::get('/laporanpenjualan', function () {
    return view('pages.laporan');
});
Route::get('/laporanpembelian', function () {
    return view('pages.laporanpembelian');
});
Route::get('/laporanstokopname', function () {
    return view('pages.stok');
});

Route::get('/supplier', function () {
    return view('pages.supplier');
});

Route::get('/tes', function () {
    return view('app');
});

Route::get('/get_countries', 'kategoriController@index');
Route::get('/get_states', 'CountryStateController@getStates');

Route::get('search', 'salesController@search');