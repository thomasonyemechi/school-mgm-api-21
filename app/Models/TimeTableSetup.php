<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TimeTableSetup extends Model
{
    use HasFactory;

    protected $fillable = [
        'school_id', 'title', 'data', 'periods'
    ];

    function school()
    {
        return $this->belongsTo(School::class, 'school_id');
    }


    function tables()
    {
        return $this->hasMany(TimeTable::class, 'setup_id');
    }
}
