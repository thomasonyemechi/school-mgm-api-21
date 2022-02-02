<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Guardian extends Model
{
    use HasFactory;

    protected $fillable = [
        'school_id', 'guardian_name', 'guardian_email', 'guardian_phone', 'guardian_address', 'password', 'mother_name', 'mother_email',
        'mother_address', 'mother_phone', 'mother_occupation', 'mother_office_address', 'father_name', 'father_email', 'father_address',
        'father_phone', 'father_occupation', 'father_office_address', 'state', 'lga', 'created_by'
    ];

    function school()
    {
        return $this->belongsTo(School::class, 'school_id');
    }

    function students()
    {
        return $this->hasMany(Student::class, 'guardian_id');
    }
}
