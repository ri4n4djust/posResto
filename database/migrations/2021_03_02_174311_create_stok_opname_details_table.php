<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStokOpnameDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tblStokOpnameDetail', function (Blueprint $table) {
            $table->id();
            $table->string('noStokOpname');
            $table->string('kdBarang');
            $table->string('tglStok');
            $table->string('qtyGudang');
            $table->string('selisihStok');
            $table->string('keteranganStok');
            $table->string('satuanStok');
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
        Schema::dropIfExists('tblStokOpnameDetail');
    }
}
