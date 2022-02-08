<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ResultSummary extends Model
{
    use HasFactory;


    protected $fillable = [
        'school_id', 'session_id', 'term_id', 'class_id','result_index', 'student_id', 'principal_remark', 'teacher_remark', 'locomotive'
    ];

    function student()
    {
        return $this->belongsTo(Student::class, 'student_id');
    }

    function term()
    {
        return $this->belongsTo(Term::class, 'term_id');
    }

    function school()
    {
        return $this->belongsTo(School::class, 'school_id');
    }

    function class()
    {
        return $this->belongsTo(ClassCore::class, 'class_id');
    }

    function session()
    {
        return $this->belongsTo(Session::class, 'session_id');
    }

    function results()
    {
        return $this->hasMany(Result::class, 'result_id');
    }
}
