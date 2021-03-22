<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateKartuStokInventorisTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tblKartuStokInventori', function (Blueprint $table) {
            $table->id();
            $table->string('kdBarang');
            $table->string('tglInv');
            $table->string('qtyMasukInv');
            $table->string('qtyKeluarInv');
            $table->string('noTransaksiInv');
            $table->string('keteranganKartuInv');
            $table->string('satuanKartuInv');
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
        Schema::dropIfExists('tblKartuStokInventori');
    }
}
