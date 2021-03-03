<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBarangsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tblBarang', function (Blueprint $table) {
            $table->id();
            $table->string('kdBarang');
            $table->string('nmBarang');
            $table->double('hrgPokok');
            $table->double('hrgJual');
            $table->char('ktgBarang');
            $table->char('satuanBarang');
            $table->char('merek');
            $table->char('stkBarang');
            $table->char('qtyMin');
            $table->char('qtyMax');
            $table->text('stsBarang');
            $table->text('deskripsi');

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
        Schema::dropIfExists('tblBarang');
    }
}
