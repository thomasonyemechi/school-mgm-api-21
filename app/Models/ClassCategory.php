<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ClassCategory extends Model
{
    use HasFactory;

    protected $fillable = [
        'school_id', 'category', 'created_by'
    ];

    function school()
    {
        return $this->belongsTo(School::class, 'school_id');
    }

    function creator()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    function classes()
    {
        return $this->hasMany(ClassCore::class, 'category_id');
    }
}
