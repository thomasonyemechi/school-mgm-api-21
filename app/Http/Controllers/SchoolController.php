<?php

namespace App\Http\Controllers;

use App\Models\Grade;
use App\Models\School;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Illuminate\Http\Request;

class SchoolController extends StaffController
{



    function updateSchoolPicture(Request $request)
    {
        $val = Validator::make($request->all(), [
            'logo' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);
        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}

        $school = auth()->user()->school;
        if($request->hasFile('logo')){
            $logo = $request->file('logo');
            $extension = $logo->getClientOriginalExtension();
            $name = 'assets/img/schools/'.rand(11111,9999999).$school->slug.'.'.$extension;
            move_uploaded_file($logo, $name);
            @unlink('assets/img/schools/'.$school->logo);

            $school->update([
                'logo' => $name
            ]);
        }

        return response([
            'message' => 'Picture has been uploaded sucessfully'
        ], 200);
    }


    function updateSchoolInformation(Request $request)
    {
        $val = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'address' => 'required|string|max:255',
            'phone' => 'required|string|max:20',
            'school_id' => 'required|exists:schools,id',
        ]);

        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}
        $school = School::find($request->school_id);
        if(!checkUserSchool($school->id)) { return response(bidMisMatchRes(), 401); }

        $slug = Str::slug($request->name);


        $new_school = School::where('id', $request->school_id)->update([
            'name' => $request->name,
            'slug' => $slug,
            'address' => $request->address,
            'phone' => $request->phone,
            'motto' => $request->motto ?? $school->motto,
            'website' => $request->website ?? $school->website,
            'alternate_phone' => $request->alternate_phone ?? $school->alternate_phone,
        ]);
        return response([
            'data' => School::find($request->school_id),
            'message' => 'School details updated sucessfully',
            'status' => 1
        ], 200);
    }


    function registerSchool(Request $request)
    {
        $val = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'nick_name' => 'required|string|max:255',
            'phone' => 'required|string|max:20',
            'password' => 'required|string|min:6',
            'email' => 'required|email'
        ]);

        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}

        $ck1 = School::where('email', $request->email)->count();
        $ck2 = User::where('email', $request->email)->count();

        if($ck1 > 0 OR $ck2 > 0) {
            return response(['message' => 'Email alrerady taken'], 306);
        }

        $school = School::create([
            'slug' => Str::slug($request->name),
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'bussiness_id' => rand(1111111111, 999999999999999999),
        ]);

        $user = User::create([
            'school_id' => $school->id,
            'name' => $request->nick_name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'role' => 10,
            'phone' => $request->phone,
        ]);
        $this->createPermission($user->id, 10);
        $this->createSchoolGrade($school->id);
        return response(['message' => 'School account has been created sucessfully, Proceed to login', 'status' => true], 200);
    }



    function createSchoolGrade($school_id)
    {
        Grade::create([
            'school_id' => $school_id
        ]);
        return;
    }

}
