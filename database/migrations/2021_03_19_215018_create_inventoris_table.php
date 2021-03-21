<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInventorisTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tblInventori', function (Blueprint $table) {
            $table->id();
            $table->char('kdBarang');
            $table->char('stkInventori')->nullable();
            $table->char('hrgSatuan')->nullable();
            $table->char('satuanInventori')->nullable();
            $table->char('stkSatuan')->nullable();
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
        Schema::dropIfExists('tblInventori');
    }
}
