<?php

namespace App\Http\Controllers;

use App\Models\ClassCore;
use App\Models\School;
use App\Models\Subject;
use App\Models\TimeTable;
use App\Models\TimeTableSetup;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redis;
use Illuminate\Support\Facades\Validator;

class TimeTableController extends Controller
{
    function todayTimeTables($day)
    {

    }

    function timeTableSummary(Request $request)
    {

    }

    function classTimeTables($class_id)
    {

    }

    function swapSubjects(Request $request)
    {
        $val = Validator::make($request->all(), [
            'time_table_id' => 'required|exists:time_tables,id',
            'index_1' => 'required|integer',
            'index_2' => 'required|integer',
        ]);

        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}

        $table = TimeTable::find($request->time_table_id);

        $data = explode(',',$table->data);

        $value_1 = $data[$request->index_1];
        $value_2 = $data[$request->index_2];
        $data[$request->index_2] = $value_1;
        $data[$request->index_1] = $value_2;
        $data = implode(',',$data);

        $table->update([
            'data' => $data
        ]);

        return response([
            'message' => 'Subjects have bee swapped sucessfully'
        ]);
    }


    function fetchTimeTableInfo($time_table_id)
    {
        $table = TimeTable::find($time_table_id);
        $subjects = explode(',',$table->data);
        $setup = $table->setup;
        $day = ['Monday', 'Tuesday', 'Wednessday', 'Thursday', 'Friday'];
        $new_arr = []; $i = 0;
        foreach($day as $dy)
        {

            $data = json_decode($setup->data); $new_d = [];
            foreach($data as $per){
                $type = $per->type;

                $new_d[] = [
                    'index' => ($type == 1) ? $i : '' ,
                    'type' => $type,
                    'id' => ($type == 1) ? $subjects[$i] : 0 ,
                    'subject' => ($type == 1) ? $this->findSubject($subjects[$i]) : 'Break' ,
                    'from' => $per->from,
                    'to' => $per->to,
                ];
                ($type == 1) ? $i++ : '';
            }

            $new_arr[] = [
                'day' => $dy,
                'period' => $new_d
            ];
        }

        return response([
            'id' => $table->id,
            'title' => $table->title,
            'class_id' => $table->class->id,
            'class' => $table->class->class,
            'periods' => $new_arr,
        ]);




    }

    function findSubject($subject_id)
    {
        return Subject::find($subject_id)->subject;
    }

    function addTimeTable(Request $request)
    {
        $val = Validator::make($request->all(), [
            'class_id' => 'required|exists:class_cores,id',
            'setup_id' => 'required|exists:subjects,id',
        ]);
        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}




        // $ck = TimeTable::where(['class_id' => $request->class_id, 'setup_id' => $request->setup_id])->count();
        // if($ck > 0) { return response(['message' => 'Time table already exists for this class'], 409);  }


        $string = '';
        foreach($request->periods as $per) {
            $sub = $per['subject_id'];
            for($i=1; $i <= $per['periods']; $i++){
                $string .= $sub.',';
            }
        }
        $xplo = explode(',', $string);
        $pop = array_pop($xplo);
        shuffle($xplo);
        $total_periods = count($xplo);
        TimeTable::create([
            'title' => $request->title,
            'school_id' => auth()->user()->school_id,
            'class_id' => $request->class_id,
            'setup_id' => $request->setup_id,
            'periods' => $total_periods,
            'data' => implode(',',$xplo)
        ]);

        return response([
            'message' => 'Time table has been created sucessfully',
        ], 200);
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
                'id' => $set->id,
                'title' => $set->title,
                'total_periods' => $set->periods,
                'lesson_periods' => $lessons*5,
                'break_periods' => $breaks*5,
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
