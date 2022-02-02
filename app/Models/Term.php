<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Term extends Model
{
    use HasFactory;

    protected $fillable = [
        'session_id', 'school_id', 'term', 'year', 'close', 'resume', 'status'
    ];

    function session()
    {
        return $this->belongsTo(Session::class, 'session_id');
    }
}
