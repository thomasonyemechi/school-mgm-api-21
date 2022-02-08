<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ResultSetup extends Model
{
    use HasFactory;

    protected $fillable = [
        'school_id', 'ca1', 'ca2', 'ca3', 'exam'
    ];

    function school() {
        return $this->belongsTo(School::class, 'school_id');
    }
}
