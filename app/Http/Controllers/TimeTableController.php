<?php

namespace App\Http\Controllers;

use App\Models\TimeTable;
use App\Models\TimeTableSetup;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class TimeTableController extends Controller
{


    function fetchTimeTableSetups()
    {
        $school_id = auth()->user()->school_id;
        $setups = TimeTableSetup::where('school_id', $school_id)->orderby('id', 'desc')->get();
        return response([
            'message' => '',
            'data' => $setups
        ], 200);
    }


    function addTimeTableSetup(Request $request)
    {
        $val = Validator::make($request->all(), [
            'title' => 'required|string',
            'data' => 'required|string',
        ]);
        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}
        $school_id = auth()->user()->school_id;
        $ck = TimeTableSetup::where(['title' => $request->title, 'school_id' => $school_id])->count();
        if($ck > 0) { return response(['message' => 'This title already exists, try another'], 409); }

        TimeTableSetup::create([
            'school_id' => $school_id,
            'title' => $request->title,
            'data' => $request->data
        ]);

        return response(['message' => 'Setup created sucessfully'], 200);
    }
}
