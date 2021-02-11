<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTransaksisTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tblTmp_Transaksis', function (Blueprint $table) {
            $table->id();
            $table->string('noNota');
            $table->string('tglNota');
            $table->string('totalNota');
            $table->string('bayarNota');
            $table->string('kembalianNota');
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
        Schema::dropIfExists('tblTmp_Transaksis');
    }
}
