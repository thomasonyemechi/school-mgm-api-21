<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateResultSummariesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('result_summaries', function (Blueprint $table) {
            $table->id();
            $table->integer('school_id');
            $table->integer('term_id');
            $table->integer('result_index');
            $table->integer('student_id');
            $table->string('principal_remark');
            $table->string('teacher_remark');
            $table->text('locomotive');
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
        Schema::dropIfExists('result_summaries');
    }
}
