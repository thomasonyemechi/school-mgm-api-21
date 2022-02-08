<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SetSubject extends Model
{
    use HasFactory;

    protected $fillable = [
        'school_id', 'user_id', 'class_id', 'subject_id', 'created_by'
    ];



    public function subject()
    {
        return $this->belongsTo(Subject::class, 'subject_id');
    }


    public function class()
    {
        return $this->belongsTo(ClassCore::class, 'class_id');
    }


    public function teacher()
    {
        return $this->belongsTo(User::class, 'user_id');
    }


    function creator()
    {
        return $this->belongsTo(User::class, 'created_by');
    }



}
