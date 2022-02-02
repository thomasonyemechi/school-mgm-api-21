<?php

namespace App\Http\Controllers;

use App\Models\ClassCore;
use App\Models\Result;
use App\Models\ResultSummary;
use App\Models\SetSubject;
use App\Models\Student;
use App\Models\Subject;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ResultController extends Controller
{

    function editMultipleResult(Request $request)
    {
        $data = $request->data;

        foreach($data as $res)
        {
            Result::where('id', $res->id)->update([
                't1' => $res->ca1,
                't2' => $res->ca2,
                't3' => $res->ca3,
                'exam' => $res->exam,
                'total' => $res->ca1 + $res->ca2 + $res->ca3 + $res->exam
            ]);
        }

        return response([
            'data' => '',
            'message' => 'Result updated sucessfully',
            'status' => true
        ]);
    }


    function editStudentResult(Request $request)
    {
        $res = $request->data;

        Result::where('id', $res->id)->update([
            't1' => $res->ca1,
            't2' => $res->ca2,
            't3' => $res->ca3,
            'exam' => $res->exam,
            'total' => $res->ca1 + $res->ca2 + $res->ca3 + $res->exam
        ]);

        return response([
            'data' => '',
            'message' => 'Result updated sucessfully',
            'status' => true
        ]);
    }

    function startResult(Request $request)
    {
        $val = Validator::make($request->all(), [
            'subject_id' => 'required',
            'class_id' => 'required',
        ]);
        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}

        $class  = ClassCore::find($request->class_id);
        $subject = Subject::find($request->subject->id);

        $students = Student::where(['class' => $class->id, 'active' => 1])->get(['id']);
        $term = currentActiveTerm();

        foreach($students as $stu)
        {
            //student_id term_id
            $result_index = $stu->id.$term->id;
            ////check if summary has been created
            $summary = ResultSummary::where('result_index', $result_index)->first();
            if($summary){}else {
                $summary = ResultSummary::create([
                    'school_id' => $class->school_id,
                    'term_id' => $term->id,
                    'class_id' => $class->id,
                    'result_index' => $result_index,
                    'student_id' => $stu->id
                ]);
            }

            // summary_id student_id subject_id
            $result_index = $summary->id.$stu->id.$subject->id;

            $ck = Result::where('result_index', $result_index)->count();

            if($ck == 0)
            {
                Result::create([
                    'result_index' => $result_index,
                    'result_id' => $summary->id,
                    'subject_id' => $subject->id,
                    'term_id' => $term->id,
                    'class_id' => $class->id
                ]);
            }
        }


        return response([
            'data' =>
                Result::where([
                    'class_id' => $class->id, 'term_id' => $term->id, 'subject_id' => $subject->id
                ])->get()->with(['student', 'subject', 'class']),
            'message' => 'Start updating your results',
            'status' => true,
        ], 200);

    }


    function fetchTeacherSubject($teacher_id)
    {
        $teacher = User::find($teacher_id);
        $subjects = SetSubject::where(['user_id' => $teacher_id])->get()->with(['subject', 'class', 'teacger']);
        return response([
            'data' => $subjects,
            'message' => '',
            'status' => true
        ], 200);
    }


    function fetchSubjectTeachers($school_id){
        $table = SetSubject::where(['school_id' => $school_id])->get()->with(['subject', 'class', 'teacher']);
        return response([
            'data' => $table,
            'message' => '',
            'status' => true
        ], 200);
    }


    function fetchSubjectTeachersByClass($class_id)
    {
        $class = ClassCore::find($class_id);
        if(!checkUserSchool($class->school_id)){ return response( bidMisMatchRes() ); }


        $subjects = SetSubject::where(['class_id' => $class->id])->get()->with(['class', 'subject', 'teacher']);

        return response([
            'data' => $subjects,
            'message' => '',
            'status' => true
        ], 200);
    }



    function removeAssignedSubject(Request $request)
    {
        $val = Validator::make($request->all(), [
            'set_subject_id' => 'required|exists:set_subjects,id',
        ]);
        SetSubject::where('id', $request->set_subject_id)->delete();
        return response([
            'message' => 'subject removed from teacher',
            'status' => true
        ], 200);
    }



    function assignSubjectToTeacher(Request $request)
    {
        $val = Validator::make($request->all(), [
            'user_id' => 'required|exists:users,id',
            'subject_id' => 'required|exists:subjects,id',
            'class_id' => 'required|exists:class_conres,id'
        ]);
        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}


        $ck = SetSubject::where(['user_id' => $request->user_id, 'subject_id' => $request->subject_id, 'class_id' => $request->class_id])->count();

        if($ck > 0) {
            ////flag error
        }


        SetSubject::create([
            'school_id' => '',
            'user_id' => $request->user_id,
            'class_id' => $request->clasd_id,
            'subject_id' => $request->subject_id
        ]);


        return response([
            'message' => 'Subject has sucessfully set',
            'status' => true,
        ], 200);

        // if(!checkUserSchool($class->school_id)){ return response( bidMisMatchRes() ); }

    }
}
