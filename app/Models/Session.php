<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Session extends Model
{
    use HasFactory;

    protected $fillable = [
        'school_id', 'session', 'created_by'
    ];

    function school()
    {
        return $this->belongsTo(School::class, 'school_id');
    }


    function terms()
    {
        return $this->hasMany(Term::class, 'session_id');
    }
}
