<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSuppliersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tblSupplier', function (Blueprint $table) {
            $table->id();
            $table->string('kdSupplier');
            $table->string('nmSupplier');
            $table->string('almtSupplier');
            $table->string('noHp');
            $table->string('kontakSupplier');
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
        Schema::dropIfExists('tblSupplier');
    }
}
