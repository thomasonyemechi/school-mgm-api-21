<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
    use HasFactory;
    protected $fillable = [
        'school_id', 'guardian_id', 'class_id', 'arm_id', 'registration_number', 'registration_number', 'surname', 'firstname', 'othername',
        'sex', 'username', 'password', 'pwd', 'others', 'status', 'created_by'
    ];

    function school()
    {
        return $this->belongsTo(School::class, 'school_id');
    }

    function parent()
    {
        return $this->belongsTo(Guardian::class, 'guardian_id');
    }

    function guardian()
    {
        return $this->belongsTo(Guardian::class, 'guardian_id');
    }


    function class()
    {
        return $this->belongsTo(ClassCore::class, 'class_id');
    }

    function arm()
    {
        return $this->belongsTo(ClassArm::class, 'arm_id');
    }



    function payments()
    {
        return $this->hasMany(Payment::class, 'student_id');
    }


    function results()
    {
        return $this->hasMany(ResultSummary::class, 'student_id');
    }
}
