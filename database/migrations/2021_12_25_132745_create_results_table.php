<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateResultsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('results', function (Blueprint $table) {
            $table->id();
            $table->integer('result_id');
            $table->integer('subject_id');
            $table->integer('student_id');
            $table->integer('class_id');
            $table->integer('t1')->default(0);
            $table->integer('t2')->default(0);
            $table->integer('t3')->default(0);
            $table->integer('t4')->default(0);
            $table->integer('exam')->default(0);
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
        Schema::dropIfExists('results');
    }
}
