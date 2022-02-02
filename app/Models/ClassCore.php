<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ClassCore extends Model
{
    use HasFactory;

    protected $fillable = [
        'school_id', 'class', 'index', 'created_by', 'category_id'
    ];

    function school()
    {
        return $this->belongsTo(School::class, 'school_id');
    }

    function creator()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    function category()
    {
        return $this->belongsTo(ClassCategory::class, 'category_id');
    }

    function students()
    {
        return $this->hasMany(Student::class, 'class_id');
    }
}
