<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class PembelianDetail extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create('tblPembelianDetail', function (Blueprint $table) {
            $table->id();
            $table->string('noNotaPembelian');
            $table->string('kdBarang');
            $table->string('hrgPokok');
            $table->string('qtyBeli');
            $table->string('totalBeli');
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
        Schema::dropIfExists('tblPembelianDetail');
    }
}
