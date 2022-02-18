<?php

namespace App\Http\Controllers;

use App\Models\ClassCore;
use App\Models\Result;
use App\Models\ResultSetup;
use App\Models\ResultSummary;
use App\Models\Session;
use App\Models\SetSubject;
use App\Models\Student;
use App\Models\Subject;
use App\Models\Term;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ResultController extends Controller
{

    function subjectRemarkUpdate(Request $request)
    {
        $val = Validator::make($request->all(), [
            'data' => 'required'
        ]);
        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}
        $new = [];
        foreach($request->data as $rem) {
            $new [] = [
                'grade' => $rem['grade'],
                'score' => $rem['score'],
                'remark' => $rem['remark']
            ];
        }
        ResultSetup::where('school_id', auth()->user()->school_id)->update([
            'remarks' => json_encode($new)
        ]);

        return response([
            'message' => 'Remarks updated sucessfully'
        ], 200);
    }



    function currentTermResult($students_id)
    {

        $student = Student::find($students_id); $subjects = []; $term_id = 15;
        $term = Term::find($term_id); //currentActiveTerm();
        $sum = ResultSummary::where(['term_id' => $term->id, 'student_id' => $student->id])->first();
        foreach($sum->results as $res) {
            $prev = $this->previosuTermSubjectScoreCum($student->id, $res->subject_id, $term_id);
            $total = $this->calculateTotalScore($res->total, $prev);
            $gradings = $this->subjectGrade($total);
            $data = [
                'subject' => $res->subject->subject,
                't1' => $res->t1,
                't2' => $res->t2,
                't3' => $res->t3,
                'exam' => $res->exam,
                'term_total' => $res->total,
                'cla_avr' => number_format($this->subject_classaverage($res->subject_id, $term_id, $sum->class_id), 2),
                'min' => '',
                'max' => '',
                'prev' => $prev,
                'total' => $total,
                'grade' => $gradings->grade,
                'remark' => $gradings->remark,
            ];
            if($total > 0) { $subjects[] = $data; }
        }

        $data = $student;
        $data['results'] = $subjects;
        $data['term'] = [
            'term' => $sum->term->term,
            'session' => $sum->term->session->session,
            'close' => date('j M, Y',strtotime($sum->term->close)),
            'resume' => date('j M, Y',strtotime($sum->term->resume)),
        ];
        $data['school'] = [
            'name' => $student->school->name,
            'address' => $student->school->address,
            'phone' => $student->school->phone,
            'logo' => $student->school->logo,
        ];

        $data['others'] = [
            'class' => $sum->class->class,
            'class_average' => '',
            'no_in_cla' => '',
        ];

        return response([
            'data' => $data,
        ], 200);
    }


    function subject_classaverage($subject_id, $term_id, $class_id) {
        $term = Term::find($term_id);
        $terms = Term::where('session_id', $term->session_id)->get(['id', 'term']);
        $cum = 0; $c = 0;
        foreach($terms as $tm) {
            $cum_total = $this->calculateSubAvr($tm->id, $subject_id, $class_id);
            if($cum_total > 0) {
                $cum += $cum_total;
                $c++;
            }
        }

        return  ($cum > 0) ? $cum/$c : $cum;
    }

    function subjectGrade($score) {
        $rems = ResultSetup::where(['school_id' => 1])->first(['remarks']);
        $rems = json_decode($rems->remarks);
        foreach($rems as $rm) {
            $sc = $rm->score;
            if($score >= $sc){ return $rm; }
        }
    }

    function calculateSubAvr($term_id, $subject_id, $class_id, $ret='avr') {
        $res = Result::where(['term_id' => $term_id, 'subject_id' => $subject_id, 'class_id' => $class_id])->get(['id', 'student_id', 'total']);
        $score = 0; $c = 0;
        foreach($res as $r) {
            if($r->total > 0) {
                $c++;
                $score += $r->total;
            }
        }
        $val = ($score > 0) ? ($score/$c) : 0 ;
        return $val;
    }


    // function totalClassAvr($term_id, $class, $student_id) {

    // }

    function previosuTermSubjectScoreCum($student_id, $subject_id, $term_id){
        $term = Term::find($term_id); $scores = [];

        if($term->term == 1) {
            return 0;
        }
        $terms = Term::where('session_id', $term->session_id)->get(['id', 'term']);
        foreach($terms as $tm) {
            if($tm->term < $term->term) {
                $res = Result::where(['term_id' => $tm->id, 'student_id' => $student_id, 'subject_id' => $subject_id])->first(['id', 'total']);
                $scores[] = [
                    'term' => $tm->term,
                    'total' => $res->total ?? 0
                ];
            }
        }
        return $scores;
    }

    function calculateTotalScore($total, $prev)
    {
        if($prev == 0) { return $total; }
        $i=0; $score = 0;
        foreach($prev as $sc) {
            if($sc['total'] > 0) { $i++; }
            $score += $sc['total'];
        }
        $div = ($total > 0) ? $i+1 : $i ;
        $total = $score + $total;
        if($total == 0) { return 0; }
        $t = $total / $div;
        return $t;
    }


    function studentResults($students_id) {
        $student = Student::find($students_id);
        $r_sum = ResultSummary::with(['term:id,term', 'class:id,class', 'session:id,session'])->where(['student_id' => $student->id])->orderby('id', 'desc')->limit(25)->get();
        $res_sum[] = $student;
        foreach($r_sum as $sum) {
            $data = $sum;
            $data['subjects'] = Result::where('result_id', $sum->id)->count();
            $res_sum['results'][] = $data;
        }
        return $res_sum;
    }

    function Ca()
    {
        $res_st = ResultSetup::where('school_id', auth()->user()->school_id)->first();
        return response([
            'data' => $res_st
        ], 200);
    }

    function updateCa(Request $request)
    {
        $val = Validator::make($request->all(), [
            'ca1' => 'required|integer',
            'ca2' => 'required|integer',
            'ca3' => 'required|integer',
            'exam' => 'required|integer',
        ]);
        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}
        $total = $request->ca1 + $request->ca2 + $request->ca3 + $request->exam;
        if($total != 100) { return response(['message' => 'The sum of scores must be equal to 100'], 406);  }
        $school_id = auth()->user()->school_id;
        $res_st = ResultSetup::where('school_id', $school_id)->first();

        if(!$res_st) {
            ResultSetup::create([
                'school_id' => auth()->user()->school_id,
                'ca1' => $request->ca1,
                'ca2' => $request->ca2,
                'ca3' => $request->ca3,
                'exam' => $request->exam,
            ]);
        }else {
            $res_st->update([
                'ca1' => $request->ca1,
                'ca2' => $request->ca2,
                'ca3' => $request->ca3,
                'exam' => $request->exam,
            ]);
        }

        return response([
            'message' => 'Ca scores updated sucessfully'
        ], 200);
    }


    function editMultipleResult(Request $request)
    {
        $val = Validator::make($request->all(), [
            'data' => 'required',
        ]);
        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);} $i = 0;

        foreach($request->data as $res)
        {
            Result::where('id', $res['result_id'])->update([
                't1' => $res['ca1'],
                't2' => $res['ca2'],
                't3' => $res['ca3'],
                'exam' => $res['exam'],
                'total' => $res['ca1'] + $res['ca2'] + $res['ca3'] + $res['exam']
            ]); $i++;
        }

        return response([
            'data' => '',
            'message' => $i.' Results updated sucessfully',
            'status' => true
        ]);
    }


    function editStudentResult(Request $request)
    {
        $val = Validator::make($request->all(), [
            'ca1' => 'required|integer',
            'ca2' => 'required|integer',
            'ca3' => 'required|integer',
            'exam' => 'required|integer',
            'result_id' => 'required|exists:results,id',
        ]);
        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}
        $result = Result::find($request->result_id);

        $result->update([
            't1' => $request->ca1,
            't2' => $request->ca2,
            't3' => $request->ca3,
            'exam' => $request->exam,
            'total' => $request->ca1 + $request->ca2 + $request->ca3 + $request->exam
        ]);

        return response([
            'message' => 'Result updated sucessfully',
            'status' => true
        ]);
    }


    function fetchSessionBroadSheet($program) {
        $set = SetSubject::find($program); $term = []; $results = [];
        $session = Session::find(currentActiveTerm()->session->id);
        $class_id = $set->class_id; $subject_id = $set->subject_id;
        foreach($session->terms as $term) {
            $terms[] = $term->id;
        }
        $arr = ['t1', 't2', 't3', 'exam', 'total'];
        $students = Student::where(['class_id' => $class_id, 'status' => 1])->get(['id', 'surname', 'firstname']);
        foreach($students as $stu) {
            $data = $stu;

            $data['first'] = Result::where(['term_id' => $terms[0], 'student_id' => $stu->id,'subject_id' => $subject_id, 'class_id' => $class_id])->first($arr);
            $data['second'] = Result::where(['term_id' => $terms[1], 'student_id' => $stu->id,'subject_id' => $subject_id, 'class_id' => $class_id])->first($arr);
            $data['third'] = Result::where(['term_id' => $terms[2], 'student_id' => $stu->id,'subject_id' => $subject_id, 'class_id' => $class_id])->first($arr);
            $results[] = $data;
        }
        return response([
            'data' => $results,
            'cap' => $session->session.' '.$set->class->class.' '.$set->subject->subject,
            'setup' => ResultSetup::where('school_id',  $set->school_id)->first(),
        ]);
    }



    function loadResult($program) {
        $set = SetSubject::find($program);
        $term = currentActiveTerm();
        $result = Result::with(['student:id,surname,firstname'])->where(['class_id' => $set->class_id, 'subject_id' => $set->subject_id, 'term_id' => $term->id])->paginate(50);

        return response([
            'data' => $result,
            'cap' => $term->session->session.' '.term_text($term->term).' '.$set->class->class.' '.$set->subject->subject,
            'setup' => ResultSetup::where('school_id', $set->school_id)->first(),
        ],200);
    }

    function startResult(Request $request)
    {
        $val = Validator::make($request->all(), [
            'set_id' => 'required|exists:set_subjects,id',
        ]);
        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}
        $set = SetSubject::find($request->set_id);
        $students = Student::where(['class_id' => $set->class_id, 'status' => 1])->get(['id']);
        $term = currentActiveTerm();

        foreach($students as $stu)
        {
            //student_id term_id
            $result_index = $stu->id.$term->id;
            ////check if summary has been created
            $summary = ResultSummary::where('result_index', $result_index)->first(['id']);
            if($summary){}else {
                $summary = ResultSummary::create([
                    'school_id' => $set->school_id,
                    'session_id' => $term->session->id,
                    'term_id' => $term->id,
                    'class_id' => $set->class_id,
                    'result_index' => $result_index,
                    'student_id' => $stu->id
                ]);
            }
            // term_id student_id subject_id
            $result_index = $term->id.$stu->id.$set->subject_id;
            $ck = Result::where('result_index', $result_index)->limit(1)->count();
            if($ck == 0)
            {
                Result::create([
                    'result_index' => $result_index,
                    'result_id' => $summary->id,
                    'subject_id' => $set->subject_id,
                    'term_id' => $term->id,
                    'class_id' => $set->class_id,
                    'student_id' => $stu->id
                ]);
            }
        }
        return response([
            'message' => 'Result started, Load broad sheet',
            'status' => true,
        ], 200);

    }


    function fetchTeacherSubject($teacher_id)
    {
        $teacher = User::find($teacher_id);
        $subjects = SetSubject::with(['subject:id,subject', 'class:id,class'])->where(['user_id' => $teacher_id])->get();
        return response([
            'data' => $subjects,
        ], 200);
    }


    function fetchSubjectTeachers(){
        $table = SetSubject::with(['teacher:id,name', 'subject:id,subject', 'class:id,class'])->where(['school_id' => auth()->user()->school_id])->paginate(100);
        return response([
            'data' => $table,
        ], 200);
    }


    function fetchSubjectTeachersByClass($class_id)
    {
        $class = ClassCore::find($class_id);
        if(!checkUserSchool($class->school_id)){ return response( bidMisMatchRes() ); }
        $subjects = SetSubject::with(['subject:id,subject', 'class:id,class', 'teacher:id,name'])->where(['class_id' => $class->id])->paginate(50);
        return response([
            'data' => $subjects,
            'class' => $class
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
            'class_id' => 'required|exists:class_cores,id'
        ]);
        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}
        $ck = SetSubject::where(['user_id' => $request->user_id, 'subject_id' => $request->subject_id, 'class_id' => $request->class_id])->count();
        if($ck > 0) {
            return response([
                'message' => 'Subject has already been assigned to this user',
            ], 406);
        }
        SetSubject::create([
            'school_id' => auth()->user()->school_id,
            'user_id' => $request->user_id,
            'class_id' => $request->class_id,
            'subject_id' => $request->subject_id,
            'created_by' => auth()->user()->id
        ]);
        return response([
            'message' => 'Subject has sucessfully set',
            'status' => true,
        ], 200);

    }


    function requirments() {
        $school_id = auth()->user()->school_id;
        $data = [
            'users' => User::where(['school_id' => $school_id])->orderby('name', 'asc')->get(['id', 'name']),
            'classes' => ClassCore::where('school_id', $school_id)->orderby('index', 'asc')->get(),
            'subjects' => Subject::where('school_id', $school_id)->orderby('subject', 'asc')->get(),
        ];

        return response([
            'data' => $data
        ]) ;
    }
}
