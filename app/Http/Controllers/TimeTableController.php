<?php

namespace App\Http\Controllers;

use App\Models\ClassCore;
use App\Models\School;
use App\Models\TimeTable;
use App\Models\TimeTableSetup;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redis;
use Illuminate\Support\Facades\Validator;

class TimeTableController extends Controller
{

    function addTimeTable(Request $request)
    {
        $val = Validator::make($request->all(), [
            'class_id' => 'required|exists:class_cores,id',
            'setup_id' => 'required|exists:subjects,id',
        ]);
        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}

        $ck = TimeTable::where(['class_id' => $request->class_id, 'setup_id' => $request->setup_id])->count();
        if($ck > 0) { return response(['message' => 'Time table already exists for this class'], 409);  }

        $total_periods = count(explode(',', $request->data));

        TimeTable::creat([
            'school_id' => auth()->user()->school_id,
            'class_id' => $request->class_id,
            'setup_id' => $request->setup_id,
            'periods' => $total_periods,
            'data' => $request->data
        ]);
    }

    function fetchTimetableRquirements()
    {
        $school = School::where('id', auth()->user()->school_id )->get();
        return response([
            'classes' => $school->class,
            'time_table_setups' => $school->time_table_setups,
            'subjects' => $school->subjects,
        ], 200);
    }


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
            'periods' => 5,
            'data' => $request->data
        ]);

        return response(['message' => 'Setup created sucessfully'], 200);
    }
}
