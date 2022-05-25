<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TimeTable extends Model
{
    use HasFactory;

    protected $fillable = [
        'school_id', 'class_id', 'setup_id', 'periods', 'data', 'title'
    ];

    function setup()
    {
        return $this->belongsTo(TimeTableSetup::class, 'setup_id');
    }

    function class()
    {
        return $this->belongsTo(ClassCore::class, 'class_id');
    }

}
