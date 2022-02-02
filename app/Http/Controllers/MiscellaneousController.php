<?php

namespace App\Http\Controllers;

use App\Models\ClassArm;
use App\Models\ClassCore;
use App\Models\Guardian;
use App\Models\Payment;
use App\Models\SetSubject;
use App\Models\Student;
use Illuminate\Http\Request;

class MiscellaneousController extends Controller
{
    //
    function fetchParentClassArm()
    {
        $school_id = auth()->user()->school_id;
        $guardians = Guardian::where('school_id', $school_id)->orderBy('guardian_name', 'desc')->get(['id', 'guardian_name', 'guardian_email']);
        $classes = ClassCore::where('school_id', $school_id)->orderBy('index', 'asc')->get(['id', 'class']);
        $arms = ClassArm::where('school_id', $school_id)->orderBy('arm', 'asc')->get(['id', 'arm']);

        $data = [
            'guardians' => $guardians,
            'classes' => $classes,
            'arms' => $arms
        ];


        return response([
            'data' => $data,
            'status' => true,
        ], 200);
    }



    function classProfileInfo($class_id) {
        $class = ClassCore::find($class_id);
        if($class->school_id == auth()->user()->school_id) { }else { return response(['message' => 'Clalss not found'], 404); }
        $term_id = currentActiveTerm()->id;
        $total_students = Student::where(['class_id' => $class_id])->count();
        $teachers = SetSubject::where('class_id', $class_id)->count();
        $fees = Payment::where(['class_id' => $class_id, 'type' => 1, 'term_id' => $term_id ])->sum('total');
        $payments = Payment::where(['class_id' => $class_id, 'type' => 5, 'term_id' => $term_id ])->sum('total');
        $data = ([
            'class' => $class,
            'students' => $total_students,
            'teachers' => $teachers,
            'fee' => $fees,
            'pay' => $payments
        ]);
        return response([
            'data' => $data
        ], 200);
    }



    function fetchClassPayments($class_id, $term_id=0) {
        if($term_id == 0){ $term_id = currentActiveTerm()->id; }
        $payments = Payment::with(['student:id,surname,firstname', 'fee:id,fee'])->where(['class_id' => $class_id, 'type' => 5, 'term_id' => $term_id])
        ->orderby('id', 'desc')->paginate(100);
        $class = ClassCore::find($class_id);
        $data = [
            'pays' => $payments,
            'class' => $class
        ];
        return response([
            'data' => $data
        ], 200);
    }


    function fetchClassFee($class_id, $term_id=0){
        if($term_id == 0){ $term_id = currentActiveTerm()->id; }
        $fees = Payment::with(['student:id,surname,firstname', 'fee_cat:id,fee'])->where(['class_id' => $class_id, 'type' => 1, 'term_id' => $term_id])
        ->orderby('fee_id', 'desc')->paginate(100);
        $class = ClassCore::find($class_id);
        $data = [
            'fees' => $fees,
            'class' => $class
        ];
        return response([
            'data' => $data
        ], 200);
    }


    function fetchClassTeachers($class_id) {
        $setted = SetSubject::with('teacher:id,name', 'subject:id,subject')->where('class_id', $class_id)->get();
        $data = [
            'teachers' => $setted,
            'class' => ClassCore::find($class_id),
        ];
        return response([
            'data' => $data
        ], 200);
    }



    function fetchClassStudents($class_id){
        $students = Student::with(['arm:id,arm'])->
        where(['class_id' => $class_id])->paginate(100, ['id', 'arm_id', 'surname', 'firstname', 'arm_id', 'sex', 'status', 'created_at']);
        return response([
            'data' => $students
        ], 200);
    }
}
