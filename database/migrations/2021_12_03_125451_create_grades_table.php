<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGradesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('grades', function (Blueprint $table) {
            $table->id();
            $table->integer('school_id');
            $table->integer('a');
            $table->integer('b');
            $table->integer('c');
            $table->integer('d');
            $table->integer('ca1');
            $table->integer('ca2');
            $table->integer('ca3');
            $table->integer('exam');
            $table->integer('teacher_comment_a');
            $table->integer('teacher_comment_b');
            $table->integer('teacher_comment_c');
            $table->integer('teacher_comment_d');
            $table->integer('teacher_comment_e');
            $table->integer('teacher_comment_f');
            $table->integer('principal_comment_a');
            $table->integer('principal_comment_b');
            $table->integer('principal_comment_c');
            $table->integer('principal_comment_d');
            $table->integer('principal_comment_e');
            $table->integer('principal_comment_f');
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
        Schema::dropIfExists('grades');
    }
}
