<?php

namespace App\Http\Controllers;

use App\Models\ResultSummary;
use App\Models\Student;
use App\Models\Term;
use Illuminate\Http\Request;

class TranscriptController extends ResultController
{
    function Trans($result_id)
    {

        $sum = ResultSummary::find($result_id);

        $term_id = $sum->term_id;
        $student_id = $sum->student_id;

        $term = Term::find($term_id);
        $student = Student::find($student_id); $subjects = [];

        // @$sum = ResultSummary::where(['term_id' => $term->id, 'student_id' => $student->id])->first();
        if(!$sum) { return response(['message' => 'No result Found'], 404); }
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
                'cla_avr' => $this->subject_classaverage($res->subject_id, $term_id, $sum->class_id),
                'min' => '',
                'max' => '',
                'prev' => $prev,
                'total' => $total,
                'grade' => $gradings->grade,
                'remark' => $gradings->remark,
            ];
            if($res->total > 0) { $subjects[] = $data; }
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
            'result_id' => $sum->id,
            'principal_remark' => $sum->principal_remark,
            'teacher_remark' => $sum->teacher_remark,
        ];


        return response([
            'data' => $data
        ]);
    }
}
