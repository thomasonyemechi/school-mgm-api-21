<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WalletLinks extends Model
{
    use HasFactory;


    protected $fillable = [
        'school_id' ,'user_id', 'live_id', 'name', 'email', 'phone'
    ];

    function school()
    {
        return $this->belongsTo(School::class, 'school_id');
    }

    function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
