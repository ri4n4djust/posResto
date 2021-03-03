<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateKomposisisTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tblKomposisi', function (Blueprint $table) {
            $table->id();
            $table->string('idMenu');
            $table->string('idBarang');
            $table->double('qtyBarang');
            $table->string('satuanBarang');
            $table->double('hargaBarang');
            $table->double('totalBarang');
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
        Schema::dropIfExists('tblKomposisi');
    }
}
