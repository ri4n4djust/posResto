<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSplitsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('splitPayment', function (Blueprint $table) {
            $table->id();
            $table->string('noNota');
            $table->string('noMeja');
            $table->string('groupNota');
            $table->string('kdBarang');
            $table->string('nmBarang');
            $table->string('hrgBarang');
            $table->string('qtyBarang');
            $table->string('subTotal');
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
        Schema::dropIfExists('splits');
    }
}
