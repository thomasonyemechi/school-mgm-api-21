<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStudentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('students', function (Blueprint $table) {
            $table->id();
            $table->integer('school_id');
            $table->integer('parent_id');
            $table->integer('class_id');
            $table->integer('arm_id')->nullable();
            $table->string('registration_number')->nullable();
            $table->string('surname');
            $table->string('firstname');
            $table->string('othername')->nullable();
            $table->string('sex')->nullable();
            $table->string('username')->nullable();
            $table->string('password');
            $table->integer('pwd');
            $table->text('others')->nullable();
            $table->integer('status')->default(1);
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
        Schema::dropIfExists('students');
    }
}
