<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ClassArm extends Model
{
    use HasFactory;

    protected $fillable = [
        'school_id', 'arm', 'created_by'
    ];

    function school()
    {
        return $this->belongsTo(School::class, 'school');
    }

    function creator()
    {
        return $this->belongsTo(User::class, 'created_by');
    }
}
