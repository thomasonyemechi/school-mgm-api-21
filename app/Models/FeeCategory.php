<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FeeCategory extends Model
{
    use HasFactory;

    protected $fillable = [
        'school_id', 'term_id', 'fee', 'description', 'created_by'
    ];

    function term()
    {
        return $this->belongsTo(Term::class, 'term_id');
    }


    protected $table = 'fee_categories';


    // public function session()
    // {
    //     return $this->belongsTo(Session::class, 'session_id');
    // }
}
