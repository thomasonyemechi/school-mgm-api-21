<?php

namespace App\Http\Controllers;

use App\Models\ClassArm;
use App\Models\ClassCore;
use App\Models\Guardian;
use App\Models\Payment;
use App\Models\SetSubject;
use App\Models\Student;
use App\Models\Subject;
use App\Models\User;
use Illuminate\Http\Request;

class MiscellaneousController extends Controller
{
    function dashboard()
    {

        $school_id = auth()->user()->school_id;
        $term = currentActiveTerm();

        $classes = ClassCore::where('school_id', $school_id)->get(); $pay_chart = [];

        foreach($classes as $cla){
            $data = [
                'class' => $cla,
                'payment' => Payment::where(['school_id' => $school_id, 'term_id' => $term->id, 'type' => 5, 'class_id' => $cla->id ])->sum('total')
            ];
            $pay_chart[] = $data;
        }


        $data = [
            'students' => Student::where(['school_id' => $school_id])->count(),
            'active_students' => Student::where(['school_id' => $school_id, 'status' => 1])->count(),
            'ubjects' => Subject::where(['school_id' => $school_id])->count(),
            'classes' => ClassCore::where('school_id' , $school_id)->count(),
            'subject_teachers' => SetSubject::where('school_id' , $school_id)->count(),
            'staffs' => User::where('school_id', $school_id)->count(),
            'active_staffs' => User::where(['school_id' => $school_id, 'status' => 1])->count(),
            'assigned_fee' => Payment::where(['school_id' => $school_id, 'term_id' => $term->id, 'type' => 1 ])->sum('total'),
            'reveived_payment' => Payment::where(['school_id' => $school_id, 'term_id' => $term->id, 'type' => 5 ])->sum('total'),
            'pay_chart' => $pay_chart,
            'recently_registered' => Student::with(['class:id,class', 'arm:id,arm'])->
            where(['school_id' => $school_id])->orderby('id', 'desc')->limit(10)->get(),


        ];
    }



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
        $term = currentActiveTerm();
        $payments = Payment::with(['student:id,surname,firstname', 'fee_cat:id,fee'])->where(['class_id' => $class_id, 'type' => 5, 'term_id' => $term->id])
        ->orderby('id', 'desc')->paginate(100);
        $class = ClassCore::find($class_id);
        $data = [
            'pays' => $payments,
            'class' => $class
        ];
        return response([
            'data' => $data,
            'cap' => $class->class.' '.term_text($term->term).' '. $term->session->session,
        ], 200);
    }


    function fetchClassFee($class_id, $term_id=0){
        $term = currentActiveTerm();
        $fees = Payment::with(['student:id,surname,firstname', 'fee_cat:id,fee'])->where(['class_id' => $class_id, 'type' => 1, 'term_id' => $term->id])
        ->orderby('fee_id', 'desc')->paginate(100);
        $class = ClassCore::find($class_id);
        $data = [
            'fees' => $fees,
            'class' => $class
        ];
        return response([
            'data' => $data,
            'cap' => $class->class.' '.term_text($term->term).' '. $term->session->session,
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
