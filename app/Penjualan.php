<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Penjualan extends Model
{
    //
    protected $table = 'tblPenjualan';

    protected $fillable = [
        'noNota', 'noMeja', 'tglNota', 'totalNota', 'bayarNota', 'kembalianNota', 'pelangganNota', 'taxNota', 'diskonNota'
    ];
}
