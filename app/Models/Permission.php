<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Permission extends Model
{
    use HasFactory;


    protected $fillable = [
        'user_id', 'fee', 'u_result', 'registration', 'other'
    ];
}
