<?php

namespace App\Http\Controllers;

use App\Models\ClassArm;
use App\Models\ClassCategory;
use App\Models\ClassCore;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;


$user = auth()->user();


class ClassController extends Controller
{

    //used to order classes
    function orderClass(Request $request)
    {
        $val = Validator::make($request->all(), [
            'class_id' => 'required|exists:class_cores,id',
            'action' => 'required|string'
        ]);
        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}
        $class = ClassCore::find($request->class_id);
        if(!checkUserSchool($class->school_id)) { return response(bidMisMatchRes(), 401); }
        $school_id = $class->school_id;
        $act = $request->action;

        //// check if there is a class before this one
        if($act == 'move_up') {
            $upper_class = ClassCore::where(['school_id' => $school_id, ['index', '<', $class->index] ])->orderBy('index', 'desc')->first();
        }elseif($act == 'move_down'){
            $upper_class = ClassCore::where(['school_id' => $school_id, ['index', '>', $class->index] ])->orderBy('index', 'ASC')->first();
            return $upper_class;
        }else {
            return response(['message' => 'Invalid action selected', 'status' => true], 422);
        }

        if(!$upper_class) { return response(['message' => 'Class cannot be ordered', 'status' => true], 400); }
        $upper_class_index = $upper_class->index;

        /////swaps index with the required class
        ClassCore::where('id', $class->id)->update([
            'index' => $upper_class_index
        ]);

        ClassCore::where('id', $upper_class->id)->update([
            'index' => $class->index
        ]);

        return response([
            'message' => 'Operation sucessfull',
            'status' => true
        ], 200);
    }


    function fetchClasses()
    {
        $classes = ClassCore::where(['school_id' => auth()->user()->school_id])->orderBy('index', 'asc')->get(); $new_classes = [];
        foreach ($classes as $cla){
            $new_classes[] = [
                'id' => $cla->id,
                'class' => $cla->class,
                'category' => $cla->category->category,
                'index' => $cla->index,
                'students' => $cla->students->count(),
                'created_by' => ucwords($cla->creator->name),
                'created_at' => $cla->created_at,
                'updated_at' => $cla->updated_at
            ];
        }
        return response([
            'data' => $new_classes,
            'message' => '',
            'status' => true
        ], 200);
    }


    function removeClass(Request $request) {
        /*
            this function has use ......
        */
    }


    function updateClass(Request $request)
    {
        /*
            this function has use ......
        */
    }


    function createClass(Request $request)
    {
        $val = Validator::make($request->all(), [
            'level' => 'required|integer',
            'category_id' => 'required|exists:class_categories,id'
        ]);

        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}
        $category = ClassCategory::find($request->category_id);
        if(!checkUserSchool($category->school_id)) { return response(bidMisMatchRes(), 401); }

        $class_name = $category->category.' '.$request->level;


        $ck = ClassCore::where(['class' => $class_name, 'school_id' => auth()->user()->school_id])->count();
        if($ck > 0) { return response(['message' => 'Class already exist', 'status' => false], 409); }

        $total_class = ClassCore::where(['school_id' => auth()->user()->school_id])->count();

        // return $total_class;


        ClassCore::create([
            'class' => $class_name,
            'school_id' =>  auth()->user()->school_id,
            'category_id' => $category->id,
            'index' => $total_class + 1,
            'created_by' =>  auth()->user()->id
        ]);

        return response([
            'message' => 'Class created sucessfully',
            'status' => true,
        ], 200);
    }


    function removeClassCategory(Request $request)
    {

    }

    function fetchAllClassCategory()
    {
        $category = ClassCategory::where(['school_id' => auth()->user()->school_id])->orderBy('id', 'desc')->get();
        return response([
            'data' => $category,
            'message' => '',
            'status' => true
        ], 200);
    }


    function updateClassCategory(Request $request)
    {
        $val = Validator::make($request->all(), [
            'category' => 'required|string|max:20',
            'category_id' => 'required|exists:class_categories,id'
        ]);
        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}

        //check the school_id of the category against the logged in user
        $category = ClassCategory::find($request->category_id);
        if(!checkUserSchool($category->school_id)) { return response(bidMisMatchRes(), 401); }

        // checks if category already exist to avoid duplicate value for each school
        $ck = ClassCategory::where(['school_id' => auth()->user()->school_id, 'category' => $request->category])->count();
        if($ck > 0) { return response(['message' => 'Class category already exists', 'status' => false], 409); }

        ClassCategory::where('id', $request->category_id)->update([
            'category' => $request->category,
        ]);

        return response([
            'message' => 'Class category has been updated sucessfully',
            'status' => true
        ], 200);
    }


    function createClassCategory(Request $request)
    {
        $val = Validator::make($request->all(), [
            'category' => 'required|string|max:20',
        ]);
        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}

        // checks if category already exist to avoid duplicate value for each school
        $ck = ClassCategory::where(['school_id' => auth()->user()->school_id, 'category' => $request->category])->count();
        if($ck > 0) { return response(['message' => 'Class category already exists', 'status' => false], 409); }

        ClassCategory::create([
            'category' => $request->category,
            'school_id' => auth()->user()->school_id,
            'created_by' => auth()->user()->id
        ]);

        return response([
            'message' => 'Class category has been created sucessfully',
            'status' => true
        ], 200);
    }




    /*
        Class Arms functions
    */

    function removeClassArm(Request $request)
    {

    }

    function fecthClassArms()
    {
        $arms = ClassArm::with(['creator:id,name'])->where([
            'school_id' => auth()->user()->school_id
        ])->orderBy('id', 'desc')->get(['id', 'arm', 'created_by', 'created_at']);

        return response([
            'data' => $arms,
            'message' => '',
            'status' => true
        ], 200);
    }


    function updateClassArm(Request $request)
    {
        $val = Validator::make($request->all(), [
            'arm' => 'required|string|max:20',
            'arm_id' => 'required|exists:class_arms,id'
        ]);

        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}

        //check the school_id of the arm against the lgged in user
        $arm = ClassArm::find($request->arm_id);
        if(!checkUserSchool($arm->school_id)) { return response(bidMisMatchRes(), 401); }

        // checks if arm already exist to avoid duplicate value for each school
        $ck = ClassArm::where(['school_id' => auth()->user()->school_id, 'arm' => $request->arm])->count();
        if($ck > 0) { return response(['message' => 'Class arm already exists', 'status' => false], 409); }

        ClassArm::where('id', $request->arm_id)->update([
            'arm' => $request->arm,
        ]);

        return response([
            'message' => 'Class arm updated sucessfully',
            'status' => true
        ], 200);
    }



    function createClassArm(Request $request)
    {
        $val = Validator::make($request->all(), [
            'arm' => 'required|string|max:20',
        ]);

        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}

        $user = auth()->user();


        // checks if arm already exist to avoid duplicate value for each school
        $ck = ClassArm::where(['school_id' => $user->school_id, 'arm' => $request->arm])->count();
        if($ck > 0) { return response(['message' => 'Class arm already exists', 'status' => false], 409); }

        ClassArm::create([
            'school_id' => $user->school_id,
            'arm' => $request->arm,
            'created_by' => $user->id,
        ]);

        return response([
            'message' => 'Class arm created sucessfully',
            'status' => true
        ], 200);
    }


}
