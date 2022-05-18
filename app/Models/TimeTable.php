<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TimeTable extends Model
{
    use HasFactory;

    protected $fillabe = [
        'school_id', 'class_id', 'setup_id', 'periods', 'data'
    ];

    function setup()
    {
        return $this->belongsTo(TimeTableSetup::class, 'setup_id');
    }

}
