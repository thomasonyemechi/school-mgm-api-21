<?php

namespace App\Http\Controllers;

use App\Models\ClassCore;
use App\Models\FeeCategory;
use App\Models\Payment;
use App\Models\Session;
use App\Models\Student;
use App\Models\Term;
use DateTime;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class BillController extends Controller
{
    // id type amount 

    function getStartAndEndDate($week, $year) {
        $dto = new DateTime();
        $dto->setISODate($year, $week);
        $ret['week_start'] = $dto->format('Y-m-d');
        $dto->modify('+6 days');
        $ret['week_end'] = $dto->format('Y-m-d');
        return $ret;
    }



    function fetchDateRangeFee($from, $to){
        $start = strtotime($from);
        $end = strtotime($to)+(86400-1);
        $payments = Payment::with(['fee_cat:id,fee', 'student:id,surname,firstname', 'class:id,class', 'term:id,term', 'creator:id,name'])
        ->where(['school_id' => auth()->user()->id ])->whereBetween('ctime', [$start, $end])->orderBy('id', 'desc')->paginate(200);
        return response([
            'data' => $payments,
            'date' => date('j M, Y', $start).' to '. date('j M, Y', $end).'',
        ]);
    }



    function fetchTermlyTransaction($term_id=0) {
        $term = ($term_id == 0) ? currentActiveTerm() : Term::find($term_id);
        $payments = Payment::with(['fee_cat:id,fee', 'student:id,surname,firstname', 'class:id,class', 'term:id,term', 'creator:id,name'])
        ->where(['term_id' => $term->id, 'school_id' => auth()->user()->id ])->orderBy('id', 'desc')->paginate(200);
        return response([
            'data' => $payments,
            'date' => $term->session->session.' '.term_text($term->term).'',
        ]);
    }



    function fetchWeeklyTransaction($week) {
        $week_array = $this->getStartAndEndDate($week,date('Y'));
        $start = strtotime($week_array['week_start']);
        $end = strtotime($week_array['week_end'])+(86400-1);
        $payments = Payment::with(['fee_cat:id,fee', 'student:id,surname,firstname', 'class:id,class', 'term:id,term', 'creator:id,name'])
        ->where(['school_id' => auth()->user()->id ])->whereBetween('ctime', [$start, $end])->orderBy('id', 'desc')->paginate(200);
        return response([
            'data' => $payments,
            'date' => date('j M, Y', $start).' to '. date('j M, Y', $end).' (Week '.$week.')',
        ]);
    }


    function fetchDailyFeeTransaction($day) {
        $start = strtotime($day);
        $end = $start+(86400-1);

        $payments = Payment::with(['fee_cat:id,fee', 'student:id,surname,firstname', 'class:id,class', 'term:id,term', 'creator:id,name'])
        ->where(['school_id' => auth()->user()->id ])->whereBetween('ctime', [$start, $end])->orderBy('id', 'desc')->paginate(100);
        return response([
            'data' => $payments,
            'date' => date('j M, Y', $end),
        ]);
    }



    ////fee summarry for a single student
    function fetchTermFeeSummary($student_id, $term_id=0) {
        if($term_id == 0) { $term_id = currentActiveTerm()->id; }
        $a = $this->calculateBalanceBroughtFwd($student_id, $term_id);

        $data = [
            'brought_fwd' => $a[0],
            'amt_paid' => $a[1],
            'fees' => Payment::with(['fee_cat:id,fee'])->where(['term_id' => $term_id, 'student_id' => $student_id, 'type' => 1])->orderBy('id', 'desc')->get(),
            'pays' => Payment::with(['fee_cat:id,fee'])->where(['term_id' => $term_id, 'student_id' => $student_id, 'type' => 5])->orderBy('id', 'desc')->limit(50)->get(),
        ];
        return response([
            'data' => $data
        ]);
    }


    function calculateBalanceBroughtFwd($student_id, $term_id) {
        $prv_terms = Term::where(['school_id' => auth()->user()->school_id, ['id', '<', $term_id] ])->get(); $amt = 0; $paid = 0;
        foreach($prv_terms as $term) {
            $amt += Payment::where(['student_id' => $student_id, 'term_id' => $term->id, 'type' => 1])->sum('total');
            $paid += Payment::where(['student_id' => $student_id, 'term_id' => $term->id, 'type' => 5])->sum('total');
        }

        $paid += Payment::where(['student_id' => $student_id, 'term_id' => $term_id, 'type' => 5])->sum('total');



        return [$amt, $paid];
    }


    function fetchStudentFee($student_id, $term_id = 0) {
        if($term_id == 0) { $term_id = currentActiveTerm()->id; }
        $fees = Payment::with(['fee_cat:id,fee',])->where(['student_id' => $student_id, 'term_id' => $term_id])->paginate(100);
        $term = Term::with(['session:id,session'])->find($term_id);
        $data = [
            'transactions' => $fees,
            'student' => Student::find($student_id),
            'term' => $term,
        ];
        return response([
            'data' => $data
        ]);
    }

    function fetchAllStudentPayment($student_id)
    {
        $student = Student::find($student_id);
        if(!checkUserSchool($student->school_id)){ return response( bidMisMatchRes() ); }
        $payments = Payment::where(['student_id' => $student->id])->get()->with(['class', 'term', 'fee_cat']);
        return response([
            'data' => $payments,
            'status' => true,
        ], 200);
    }


    function fetchSessionPaymentPerStudent($student_id, $session_id)
    {
        $student = Student::find($student_id);

        $session = Session::find($session_id);
        if(!checkUserSchool($session->school_id) OR !checkUserSchool($student->school_id)){ return response( bidMisMatchRes() ); }

        $session_terms = Term::where(['session_id' => $session_id])->get(); $payments = [];
        foreach($session_terms as $term)
        {
            $payments[] = Payment::where(['term_id' => $term->id, 'student_id' => $student->id])->get()->with(['class', 'term', 'fee_cat', 'student']);
        }
        return response([
            'data' => $payments,
        ], 200);

    }


    function fetchTermlyPaymentPerStudent($student_id, $term_id)
    {
        $student = Student::find($student_id);
        $term = Term::find($term_id);
        if(!checkUserSchool($term->school_id) OR !checkUserSchool($student->school_id)){ return response( bidMisMatchRes() ); }
        $payments = Payment::where(['term_id' => $term->id, 'student_id' => $student->id])->get()->with(['class', 'term', 'fee_cat', 'student']);
        return response([
            'data' => $payments,
            'status' => true,
            'message' => ''
        ], 200);
    }

    // function fetchPaymentHistory($fee_id, $term_id)
    // {
    //     $fee = FeeCategory::find($fee_id);
    //     $term = Term::find($term_id);
    //     if(!checkUserSchool($fee->school_id)){ return response( bidMisMatchRes() ); }

    //     $payments = Payment::where(['term_id' => $term_id, 'fee_id' => $fee_id])->get()->with(['student', 'class', 'fee_category']);
    //     return response([
    //         'data' => $payments,
    //         'status' => true
    //     ], 200);
    // }

    function fetchTermPaymentPerFeeCategory($fee_id, $term_id)
    {
        $fee = FeeCategory::find($fee_id);
        $term = Term::find($term_id);
        if(!checkUserSchool($fee->school_id)){ return response( bidMisMatchRes() ); }
        $payments = Payment::where(['term_id' => $term_id, 'fee_id' => $fee_id, 'type' => 1])->get()->with(['student', 'class', 'fee_category']);
        return response([
            'data' => $payments,
            'status' => true
        ], 200);
    }


    // function fetchBill($term_id, $class_id)
    // {
    //     $term = Term::find($term_id);
    //     $class = ClassCore::find($class_id);
    //     if(!checkUserSchool($class->school_id) OR !checkUserSchool($term->school_id)){ return response( bidMisMatchRes() ); }

    //     $payments = Payment::where(['term_id' => $term_id, 'class_id' => $class_id, 'type' => 1])->get()->with(['student', 'class', 'fee_category']);

    //     return response([
    //         'data' => $payments,
    //         'success' => true,
    //         'message' => ''
    //     ], 200);
    // }


    function MakeFeePayment(Request $request)
    {
        $val = Validator::make($request->all(), [
            'student_id' => 'required|exists:students,id',
            'amount' => 'required|integer',
        ]);
        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}
        $student = Student::find($request->student_id);
        Payment::create([
            'school_id' => auth()->user()->school_id,
            'term_id' => currentActiveTerm()->id,
            'fee_id' => $request->fee_cat_id ?? 0,
            'fee_index' => rand(111111,99999) ,
            'class_id' => $student->class_id,
            'student_id' => $student->id,
            'total' => $request->amount,
            'amount' => 0,
            'discount' => 0,
            'ctime' => time(),
            'creator' => auth()->user()->id,
            'type' => 5
        ]);
        return response([
            'message' => 'Payment sucessful',
            'status' => true
        ], 200);
    }


    function updateSchoolFeePerRecord_MultipleStudent(Request $request)
    {
        $val = Validator::make($request->all(), [
            'payments' => 'required|array',
        ]);

        $data = [];

        foreach($request->payments as $pay)
        {
            $payment = Payment::find($pay['id']);
            $dis = $pay['discount'];
            $payment->update([
                'amount' => $pay['amount'],
                'discount' => $dis,
                'total' => $pay['amount'] - $dis
            ]);
            $data[] = $dis;
        }

        return response([
            'data' => $data,
            'message' => 'School Fees has been Updated sucessfuly'
        ]);
    }


    function updateSchoolFeePerRecord(Request $request)
    {
        $val = Validator::make($request->all(), [
            'payment_id' => 'required|exists:payments,id',
            'amount' => 'required|integer',
            'discount' => 'integer',
        ]);

        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}
        $payment = Payment::find($request->payment_id);
        $payment->update([
            'amount' => $request->amount,
            'discount' => $request->discount,
            'total' => $request->amount-$request->discount
        ]);

        return response([
            'message' => 'Fee updated sucessfully',
            'status' => true
        ], 200);

    }



    function fetchFee($fee_id, $term_id, $class_id)
    {
        $payments = Payment::where(['fee_id' => $fee_id, 'term_id' => $term_id, 'class_id' => $class_id, 'type' => 1])->get([
            'fee_id', 'term_id', 'student_id', 'class_id', 'amount', 'discount'
        ])->with(['fee_cat', 'term', 'student', 'class']);

        return response([
            'data' => $payments,
            'message' => '',
            'status' => true
        ], 200);
    }





    // function fetchFeeAssignmentByClass($class_id, $fee_id)
    // {

    // }



    /*
        Scale Apllication by using que and jobs

    */

    function fetSettedFee($fee, $class){
        $fee = FeeCategory::find($fee); $class = ClassCore::find($class);
        $term = currentActiveTerm();
        $data = [
            'term' => $term,
            'fee' => $fee,
            'class' => $class,
            'records' => Payment::with(['student:id,surname,firstname'])
            ->where(['class_id' => $class->id , 'fee_id' => $fee->id , 'term_id' => $term->id, 'type' => 1])->paginate(50, [
                'id', 'fee_id', 'class_id', 'student_id', 'amount', 'discount'
            ])
        ];

        return response([
            'data' => $data
        ]);
    }

    function setFees(Request $request)
    {
        $val = Validator::make($request->all(), [
            'fee_cat_id' => 'required|exists:fee_categories,id',
            'class_id' => 'required|exists:class_cores,id',
            'amount' => 'required|integer',
            'discount' => 'integer',
        ]);
        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}
        $current_term = currentActiveTerm()->id;

        $fee_cat = FeeCategory::find($request->fee_cat_id);
        $class = ClassCore::find($request->class_id);

        if(!checkUserSchool($class->school_id) OR !checkUserSchool($fee_cat->school_id))
        { return response(bidMisMatchRes(), 401); }


        $students = Student::where(['class_id' => $request->class_id, 'status' => 1])->get(['id', 'class_id']);

        if(count($students) == 0) { return response(['message' => 'There are no students in this class'], 422);  }

        $ctime = time();

        foreach($students as $student){
            ////fee index .... fee_cat_id.term_id.student_id
            $fee_index = $fee_cat->id.$current_term.$student->id;

            $check_fee_exists = Payment::where(['fee_index' => $fee_index])->count();
            if($check_fee_exists > 0) { } else {
                Payment::create([
                    'school_id' => auth()->user()->school_id,
                    'term_id' => $current_term,
                    'fee_id' => $fee_cat->id,
                    'fee_index' => $fee_index,
                    'class_id' => $student->class_id,
                    'student_id' => $student->id,
                    'amount' => $request->amount,
                    'total' => -$request->amount,
                    'discount' => 0,
                    'ctime' => time(),
                    'creator' => auth()->user()->id,
                    'type' => 1
                ]);
            }
        }

        return response([
            'message' => 'Fee set sucessfully',
            'status' => true
        ], 200);
    }
}
