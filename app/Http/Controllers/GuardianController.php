<?php

namespace App\Http\Controllers;

use App\Models\Guardian;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class GuardianController extends Controller
{
    function fetchGuardian($guardian_id)
    {
        $guardian = Guardian::find($guardian_id);

    }

    function fetchGuardiansDeatils()
    {
        $guardians = Guardian::where(['school_id' => auth()->user()->school_id])->orderBy('guardian_name', 'ASC')->get();
        return response([
            'data' => $guardians,
            'message' => '',
            'status' => true
        ], 200);
    }


    function fetchGuardiansSummmary()
    {
        $guardians = Guardian::where(['school_id' => auth()->user()->school_id])->orderBy('id', 'desc')->paginate(100, [
            'id', 'guardian_name', 'guardian_phone', 'guardian_email', 'guardian_address'
        ]);
        return response([
            'data' => $guardians,
            'message' => '',
            'status' => true
        ], 200);
    }


    function checkGurdianEmail($guardian_email)
    {
        $ck = Guardian::where(['guardian_email' => $guardian_email])->count();
        $msg = ($ck > 0) ? 'Email already exist' : 'Email Does not exist' ;
        $status = ($ck > 0) ? false : true ;
        return response([
            'message' => $msg,
            'status' => $status
        ]);
    }


    function updateGuardianProfile(Request $request)
    {
        $val = Validator::make($request->all(), [
            'guardian_name' => 'required|min:6',
            'guardian_phone' => 'required',
            'guardian_address' => 'required'
        ]);
        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}

        $guard = Guardian::find($request->guardian_id);
        if(!checkUserSchool($guard->school_id)) { return response(bidMisMatchRes(), 401); }

        Guardian::where('id', $request->guardian_id)->update([
            'guardian_name' => $request->guardian_name,
            'guardian_phone' => $request->guardian_phone,
            'guardian_address' => $request->guardian_address,
            'mother_name' => $request->mother_name,
            'mother_email' => $request->mother_email,
            'mother_address' => $request->mother_address,
            'mother_phone' => $request->mother_phone,
            'mother_occupation' => $request->mother_occupation,
            'mother_office_address' => $request->mother_office_address,
            'father_name' => $request->father_name,
            'father_email' => $request->father_email,
            'father_address' => $request->father_address,
            'father_phone' => $request->father_phone,
            'father_occupation' => $request->father_occupation,
            'father_office_address' => $request->father_office_address,
            'state' => $request->state,
            'lga' => $request->lga,
        ]);


        return response([
            'message' => 'Guardian profile updated sucessfully',
            'status' => true
        ], 200);
    }



    function createGuardianProfile(Request $request)
    {
        $val = Validator::make($request->all(), [
            'guardian_name' => 'required|min:6',
            'guardian_phone' => 'required',
            'guardian_email' => 'required|email|unique:guardians,guardian_email',
            'guardian_address' => 'required'
        ]);
        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}

        Guardian::create([
            'school_id' => auth()->user()->school_id,
            'guardian_name' => $request->guardian_name,
            'guardian_phone' => $request->guardian_phone,
            'guardian_email' => $request->guardian_email,
            'guardian_address' => $request->guardian_address,
            'password' => Hash::make(trim($request->phone)),
            'mother_name' => $request->mother_name,
            'mother_email' => $request->mother_email,
            'mother_address' => $request->mother_address,
            'mother_phone' => $request->mother_phone,
            'mother_occupation' => $request->mother_occupation,
            'mother_office_address' => $request->mother_office_address,
            'father_name' => $request->father_name,
            'father_email' => $request->father_email,
            'father_address' => $request->father_address,
            'father_phone' => $request->father_phone,
            'father_occupation' => $request->father_occupation,
            'father_office_address' => $request->father_office_address,
            'state' => $request->state,
            'lga' => $request->lga,
            'created_by' => auth()->user()->id,
        ]);


        return response([
            'message' => 'Guardian added sucessfully',
            'status' => true
        ], 200);
    }
}
