<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Kartustok extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create('tblKartuStok', function (Blueprint $table) {
            $table->id();
            $table->string('kdBarang');
            $table->string('tglKartu');
            $table->string('qtyMasuk');
            $table->string('qtyKeluar');
            $table->string('noTransaksi');
            $table->string('keteranganKartu');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
        Schema::dropIfExists('tblKartuStok');
    }
}
