<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Result extends Model
{
    use HasFactory;

    protected $fillable = [
        'result_id', 'term_id', 'subject_id', 'result_index', 'student_id', 'class_id', 't1', 't2', 't3', 't4', 'exam', 'total'
    ];


    function subject()
    {
        return $this->belongsTo(Subject::class, 'subject_id');
    }

    function class()
    {
        return $this->belongsTo(ClassCore::class, 'class_id');
    }

    function term()
    {
        return $this->belongsTo(Term::class, 'term_id');
    }

    function student() {
        return $this->belongsTo(Student::class, 'student_id');
    }


    function summary()
    {
        return $this->belongsTo(Result::class, 'result_id');
    }
}
