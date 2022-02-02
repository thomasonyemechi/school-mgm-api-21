<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ResultSummary extends Model
{
    use HasFactory;


    protected $fillable = [
        'school_id', 'term_id', 'class_id','result_index', 'student_id', 'principal_remark', 'teacher_remark', 'locomotive'
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

    function result()
    {
        return $this->hasMany(Result::class, 'reslut_id');
    }
}
