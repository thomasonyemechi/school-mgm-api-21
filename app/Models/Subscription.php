<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Subscription extends Model
{
    use HasFactory;


    protected $fillable = [
        'school_id', 'session_id', 'term_id', 'pack', 'students', 'active', 'amount', 'type', 'user_id', 'slots'
    ];



    function term()
    {
        return $this->belongsTo(Term::class, 'term_id');
    }


    function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }


}

