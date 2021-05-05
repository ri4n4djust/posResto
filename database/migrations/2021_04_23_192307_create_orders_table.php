<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tblOrder', function (Blueprint $table) {
            $table->id();
            $table->string('kdMenu');
            $table->string('idMeja');
            $table->string('wktOrder');
            $table->string('waiterOrder');
            $table->string('stsPrintOrder');
            $table->string('qtyOrder');
            $table->string('ktgMenuOrder');
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
        Schema::dropIfExists('tblOrder');
    }
}
