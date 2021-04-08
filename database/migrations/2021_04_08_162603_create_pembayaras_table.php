<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePembayarasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tblPembayaran', function (Blueprint $table) {
            $table->id();
            $table->string('notaPembarayan');
            $table->string('diskonPembayaran');
            $table->string('pajakPembayaran');
            $table->string('typePembayaran');
            $table->string('chargePembayaran');
            $table->string('noKartuPembayaran')->nullable();
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
        Schema::dropIfExists('tblPembayaran');
    }
}
