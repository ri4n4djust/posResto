<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class TmpPenjualanDetail extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create('tblTmp_TransaksiDetail', function (Blueprint $table) {
            $table->id();
            $table->string('noNotaTmp');
            $table->string('noMejaTmp');
            $table->string('kdBarangTmp');
            $table->string('hrgJualTmp');
            $table->string('qtyTmp');
            $table->string('totalTmp');
            $table->string('typeTmp');
            $table->string('nmBarangTmp');
            $table->string('note')->nullable();
            $table->string('ktgMenu')->nullable();
            $table->string('promoMenu')->nullable();
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
        Schema::dropIfExists('tblTmp_TransaksiDetail');
    }
}
