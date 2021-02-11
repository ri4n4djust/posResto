<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePenjualanDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tblPenjualanDetail', function (Blueprint $table) {
            $table->id();
            $table->string('noNota');
            $table->string('noMeja');
            $table->string('kdBarang');
            $table->string('hrgJual');
            $table->string('qty');
            $table->string('total');
            $table->string('type');
            $table->string('nmBarang');
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
        Schema::dropIfExists('tblPenjualanDetail');
    }
}
