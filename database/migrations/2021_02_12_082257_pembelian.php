<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Pembelian extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create('tblPembelian', function (Blueprint $table) {
            $table->id();
            $table->string('idSupplier');
            $table->string('noNotaPembelian');
            $table->string('tglNotaPembelian');
            $table->string('totalNotaPembelian');
            $table->string('userPembelian');
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
        Schema::dropIfExists('tblPembelian');
    }
}
