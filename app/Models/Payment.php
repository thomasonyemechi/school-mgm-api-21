<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    use HasFactory;

    protected $fillable = [
        'school_id', 'ctime', 'creator', 'term_id', 'fee_id', 'fee_index', 'class_id', 'student_id', 'amount', 'discount', 'total', 'type'
    ];


    function term()
    {
        return $this->belongsTo(Term::class, 'term_id');
    }


    function fee_cat()
    {
        return $this->belongsTo(FeeCategory::class, 'fee_id');
    }

    function class()
    {
        return $this->belongsTo(ClassCore::class, 'class_id');
    }

    function student()
    {
        return $this->belongsTo(Student::class, 'student_id');
    }


    function creator() {
        return $this->belongsTo(User::class, 'creator');
    }
}
