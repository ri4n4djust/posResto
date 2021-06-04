<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMenusTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tblMenu', function (Blueprint $table) {
            $table->id();
            $table->string('kdMenu');
            $table->string('nmMenu');
            $table->double('hargaMenu');
            $table->char('stokMenu');
            $table->char('ktgMenu');
            $table->char('promoMenu')->nullable();;
            $table->char('hppMenu')->nullable();
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
        Schema::dropIfExists('tblMenu');
    }
}
