<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class School extends Model
{
    use HasFactory;

    protected $fillable = [
        'live_id' ,'slug', 'name', 'email', 'address', 'phone', 'alternate_phone', 'website', 'motto', 'logo', 'bussiness_id',
    ];

    function users()
    {
        return $this->hasMany(User::class, 'school_id');
    }


    function grade()
    {
        return $this->hasOne(Grade::class, 'school_id');
    }


    function sessions()
    {
        return $this->hasMany(Session::class, 'school_id');
    }


    function subjects()
    {
        return $this->hasMany(Subject::class, 'school_id');
    }


    function class_arms()
    {
        return $this->hasMany(ClassArm::class, 'school_id');
    }


    function class_categories()
    {
        return $this->hasMany(ClassCategory::class, 'school_id');
    }

    function classes()
    {
        return $this->hasMany(ClassCore::class, 'school_id');
    }

    function guardians()
    {
        return $this->hasMany(Guardian::class, 'school_id');
    }

    function students()
    {
        return $this->hasMany(Student::class, 'school_id');
    }


    function fee_categories()
    {
        $this->hasMany(FeeCategory::class, 'school_id');
    }

    function result_setup()
    {
        return $this->hasOne(ResultSetup::class, 'school_id');
    }


    function wallets()
    {
        return $this->hasMany(WalletLinks::class, 'school_id');
    }


    function subcriptions()
    {
        return $this->hasMany(Subscription::class, 'school_id');
    }

}
