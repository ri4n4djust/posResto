<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Pembelian extends Model
{
    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'noNotaPembelian', 'userPembelian',
    ];
    //
    protected $table = 'tblPembelian';

    protected $fillable = [
        'noNotaPembelian', 'tglNotaPembelian', 'totalNotaPembelian', 'idSupplier', 'userPembelian'
    ];


}
