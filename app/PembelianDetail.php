<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PembelianDetail extends Model
{
    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'noNotaPembelian', 'totalBeli',
    ];
    //
    protected $table = 'tblPembelianDetail';

    protected $fillable = [
        'noNotaPembelian', 'kdBarang', 'hrgPokok', 'qtyBeli', 'totalBeli'
    ];
}
