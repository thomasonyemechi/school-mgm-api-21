<?php

namespace App\Http\Controllers;

use App\Models\ClassCore;
use App\Models\FeeCategory;
use App\Models\Term;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class FeeController extends Controller
{


    function feeRequirements() {
        $data = [
            'classes' => ClassCore::where('school_id', auth()->user()->school_id)->orderBy('index', 'asc')->get(['id', 'class']),
            'fees' => FeeCategory::where('school_id', auth()->user()->school_id)->orderBy('id', 'desc')->get(['id', 'fee'])
        ];
        return response([
            'data' => $data
        ]);
    }

    function fetchTermFee()
    {
        $fees = FeeCategory::where('school_id', auth()->user()->school_id)->orderBy('id', 'desc')->get();
        return response([
            'data' => $fees,
            'status' => true
        ], 200);
    }


    function removeFeeCategoy(Request $request)
    {

    }



    function updateFeeCategory(Request $request)
    {
        $val = Validator::make($request->all(), [
            'fee_id' => 'required|exists:fee_categories,id',
            'fee' => 'required|string',
            'description' => 'string'
        ]);

        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}
        $fee_category = FeeCategory::find($request->fee_id);

        if(!checkUserSchool($fee_category->school_id)) { return response(bidMisMatchRes(), 401); }

        $fee_category->update([
            'fee' => $request->fee,
            'description' => $request->description,
        ]);

        // FeeCategory::where('id', $fee_category->id)->update([
        //     'fee' => $request->fee,
        //     'description' => $request->description,
        // ]);

        return response([
            'message' => 'Fee category has been updated',
            'status' => true
        ], 200);
    }


    public function crerateFeeCategory(Request $request)
    {
        $val = Validator::make($request->all(), [
            'fee' => 'required|string',
            'description' => 'required|string'
        ]);


        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}
        $ck = FeeCategory::where(['fee' => $request->fee])->count();
        if($ck > 0) {  return response(['message'=> 'Duplicate Cotent'] ,406); }

        FeeCategory::create([
            'school_id' => auth()->user()->school_id,
            'term_id' => currentActiveTerm()->id,
            'fee' => $request->fee,
            'description' => $request->description,
            'created_by' => auth()->user()->id,
        ]);

        return response([
            'message' => 'Fee category created sucessfully',
            'status' => true
        ], 206);
    }
}
