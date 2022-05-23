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

        TimeTable::create([
            'school_id' => auth()->user()->school_id,
            'class_id' => $request->class_id,
            'setup_id' => $request->setup_id,
            'periods' => $total_periods,
            'data' => $request->data
        ]);
    }

    function fetchTimetableRquirements()
    {
        $school = School::where('id', auth()->user()->school_id )->first(['id']);
        return response([
            'classes' => $school->classes,
            'subjects' => $school->subjects,
        ], 200);
    }


    function fetchTimeTableSetups()
    {
        $school_id = auth()->user()->school_id;
        $setups = TimeTableSetup::where('school_id', $school_id)->orderby('id', 'desc')->get();
        $new_arr = [];
        foreach($setups as $set){
            $data = json_decode($set->data); $lessons = 0; $breaks = 0;
            foreach($data as $dt){
                if($dt->type == 1) { $lessons ++ ; }else { $breaks ++ ; }
            }
            $new_arr[] = [
                'title' => $set->title,
                'total_periods' => $set->periods,
                'lesson_periods' => $lessons,
                'break_periods' => $breaks,
                'data' => $data
            ];
        }
        return response([
            'message' => '',
            'data' => $new_arr
        ], 200);
    }


    function addTimeTableSetup(Request $request)
    {
        $val = Validator::make($request->all(), [
            'title' => 'required|string',
        ]);
        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}
        $school_id = auth()->user()->school_id;
        $ck = TimeTableSetup::where(['title' => $request->title, 'school_id' => $school_id])->count();
        if($ck > 0) { return response(['message' => 'Setup for the title already exists, try another'], 409); }

        TimeTableSetup::create([
            'school_id' => $school_id,
            'title' => $request->title,
            'periods' => $request->total_periods,
            'data' => json_encode($request->periods)
        ]);

        return response(['message' => 'Setup created sucessfully'], 200);
    }
}
