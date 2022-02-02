<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Grade extends Model
{
    use HasFactory;

    protected $fillable = [
        'school_id', 'a', 'b', 'c', 'd', 'e', 'ca1', 'ca2', 'ca3', 'exam', 'teacher_comment_a', 'teacher_comment_b', 'teacher_comment_c',
        'teacher_comment_d', 'teacher_comment_e', 'teacher_comment_f', 'principal_comment_a', 'principal_comment_b', 'principal_comment_c',
        'principal_comment_d', 'principal_comment_e', 'principal_comment_f'
    ];


    function school()
    {
        return $this->belongsTo(School::class, 'school_id');
    }
}
