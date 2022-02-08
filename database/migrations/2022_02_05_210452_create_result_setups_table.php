<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateResultSetupsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('result_setups', function (Blueprint $table) {
            $table->id();
            $table->integer('school_id')->default(10);
            $table->integer('ca1')->default(10);
            $table->integer('ca2')->default(10);
            $table->integer('ca3')->default(20);
            $table->integer('exam')->default(60);
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
        Schema::dropIfExists('result_setups');
    }
}
