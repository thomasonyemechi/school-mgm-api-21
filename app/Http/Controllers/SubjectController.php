<?php

namespace App\Http\Controllers;

use App\Models\Subject;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;


class SubjectController extends Controller
{


    function fecthSubjectAssigningList($school_id)
    {

    }


    function removeSubjectFromStaff(Request $request)
    {

    }


    function assignSubjectToStaff(Request $request)
    {

    }


    function fetchallSubjects()
    {
        $subjects = Subject::with('creator:name')->where('school_id', auth()->user()->school_id)->orderBy('id', 'desc')->get();
        return response([
            'data' => $subjects,
            'message' => '',
            'status' => true,
        ], 200);
    }

    function deleteSubject(Request $request)
    {

    }


    function updateSubject(Request $request)
    {
        $val = Validator::make($request->all(), [
            'subject_id' => 'required|exists:subjects,id',
            'subject' => 'required|string',
        ]);
        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}
        $ck = Subject::where(['school_id' => auth()->user()->school_id, 'subject' => $request->subject])->count();
        if($ck > 0){ return response(['message' => 'Subject already exist', 'status' => false], 409); }

        Subject::where('id', $request->subject_id)->update([
            'subject' => $request->subject,
        ]);

        return response([
            'message' => 'Subject has been updated sucessfully',
            'status' => true
        ], 200);
    }


    function createSubject(Request $request)
    {
        $val = Validator::make($request->all(), [
            'subject' => 'required|string',
        ]);
        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}
        $ck = Subject::where(['school_id' => auth()->user()->school_id, 'subject' => $request->subject])->count();
        if($ck > 0){ return response(['message' => 'Subject already exist', 'status' => false], 409); }

        Subject::create([
            'subject' => $request->subject,
            'school_id' => auth()->user()->school_id,
            'created_by' => auth()->user()->id
        ]);

        return response([
            'message' => 'Subject added sucessfully',
            'status' => true
        ], 200);
    }
}
