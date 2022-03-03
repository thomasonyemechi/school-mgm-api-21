<?php

namespace App\Http\Controllers;

use App\Models\School;
use App\Models\Student;
use App\Models\Subscription;
use App\Models\Term;
use App\Models\WalletLinks;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Validator;


class SubscriptionController extends Controller
{
    //


    function subscribeSpot($term_id)
    {
        $school_id = auth()->user()->school_id;
        $total_student = Student::where(['school_id' => $school_id])->count();
        $active_student = Student::where(['school_id' => $school_id, 'status' => 1])->count();

        $packages = [];
        $packages[] = [
            'id' => 1,
            'name' => 'Basic',
            'features' => [
                'Registration management', 'Academic Calender', 'Multiple Simultaneos User', 'Financial Accounting', 'Result & Transcript Logging'
            ],
            'total_student' => $total_student,
            'active' => $active_student,
            'amount' => 500,
            'price' => $active_student * 500,
        ];

        return response([
            'term' => Term::with(['session:id,session'])->find($term_id),
            'data' => $packages
        ], 200);
    }


    function renewSubscription(Request $request)
    {
        $val = Validator::make($request->all(), [
            'term_id' => 'required|exists:terms,id',
            'pack' => 'required|integer',
        ]);
        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}
        $user = auth()->user();
        if($user->school->live_id == 0) {
            return response([
                'message' => 'No wallet is linked to this account, Link wallet!'
            ], 402);
        }

        $term = Term::find($request->term_id);

        if($term->paid == 1)  {
            return response([
                'message' => 'This term has already being paid for'
            ], 406);
        }

        $active_student = Student::where(['school_id' => $user->school_id, 'status' => 1])->count();
        $amount = ($active_student * 500);
        $trno = rand(11111111111, 99999999999);
        $res = Http::asForm()->post(env('LINK'), [
            'purchaseSlots' => '...',
            'school_id' => $user->school->id,
            'live_id' => $user->school->live_id,
            'amount' => $amount,
            'students' => $active_student,
            'pack' => $request->pack,
            'tran_id' => $trno,
            'term_id' => $request->term_id,
        ]);

        if($res['status'] == 1){
            Term::where('id', $request->term_id)->update([
                'paid' => 1
            ]);

            Subscription::create([
                'school_id' => $user->school_id,
                'session_id' => $term->session_id,
                'term_id' => $request->term_id,
                'pack' => $request->pack,
                'students' => Student::where(['school_id' => $user->school_id])->count(),
                'active' => $active_student,
                'slots' => $active_student,
                'amount' => $amount,
                'type' => 1,
                'user_id' => $user->id,
                'trno' => $trno,
            ]);



            return response([
                'message' => 'Subscription was sucessfully, You can now activate term'
            ], 200);
        }
        return response([
            'message' => $res['message']
        ], 403);
    }


    function renewalHistory()
    {
        $sub = Subscription::with(['user:id,name'])->where(['school_id' => auth()->user()->id, 'type' => 1 ])->paginate(25);
        return response([
            'data' => $sub
        ], 200);
    }


    function slotPurchaseHistory()
    {
        $sub = Subscription::with(['user:id,name'])->where(['school_id' => auth()->user()->school_id, ['type', '>', 1] ])->orderby('id', 'desc')->limit(25)->get();
        return response([
            'data' => $sub
        ], 200);
    }


    function purchaseSlots(Request $request)
    {
        $val = Validator::make($request->all(), [
            'slots' => 'required|integer',
            'term_id' => 'required|exists:terms,id',
            'pack' => 'required|integer',
        ]);
        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}
        $user = auth()->user();
        if($user->school->live_id == 0) {
            return response([
                'message' => 'No wallet is linked to this account, Link wallet'
            ], 402);
        }
        $amount = ($request->slots * 500);
        $trno = rand(11111111111, 99999999999);
        $res = Http::asForm()->post(env('LINK'), [
            'purchaseSlots' => '...',
            'school_id' => $user->school->id,
            'live_id' => $user->school->live_id,
            'amount' => $amount,
            'students' => $request->slots,
            'pack' => $request->pack,
            'tran_id' => $trno,
            'term_id' => $request->term_id,
        ]);


        if($res['status'] == 1){

            $ck_term = Term::with(['session:id,session'])->where(['school_id' => $user->school_id, 'status' => 1])->count();
            $type = ($ck_term == 0) ? 3 : 2 ;
            $message = ($ck_term == 0) ? 'Term Activated Sucessfully' : 'Slot was sucessfully purchased' ;
            $term = Term::find($request->term_id);
            Subscription::create([
                'school_id' => $user->school_id,
                'session_id' => $term->session_id,
                'term_id' => $request->term_id,
                'pack' => $request->pack,
                'students' => Student::where(['school_id' => $user->school_id])->count(),
                'active' => Student::where(['school_id' => $user->school_id, 'status' => 1])->count(),
                'slots' => $request->slots,
                'amount' => $amount,
                'type' => $type,
                'user_id' => $user->id,
                'trno' => $trno,
            ]);

            if($type == 3) {
                Term::where('id', $request->term_id)->update([
                    'paid' => 1,
                    'status' => 1,
                ]);

                return response([
                    'message' => $message,
                    'term' => $term,
                    'type' => $type,
                ], 200);


            }

            return response([
                'type' => $type,
                'message' => $message

            ], 200);

        }
        return response([
            'message' => $res['message']
        ], 405);
    }



    function subscribe()
    {


    }



    function fetchBalance()
    {
        $live_id = auth()->user()->school->live_id;
        if($live_id == 0) {
            return response(['balance' => 0]);
        }
        $res = Http::get(env('LINK').'?balance='.$live_id);
        if(!$res['live_id']){
            return response([
                'message' => 'Error'
            ], 500);
        }
        return response([
            'id' => $res['live_id'],
            'balance' => $res['balance'],
            'name' => $res['data']['lastname'].' '.$res['data']['firstname']
        ], 200);
    }


    function availbaleSlots() {
        $total = Subscription::where(['school_id' => auth()->user()->school_id, ['type', '>' , 1] ])->sum('slots');
        $used = Student::where(['school_id' => auth()->user()->school_id])->count();
        return response([
            'total' => $total,
            'used' => $used,
            'available' => $total - $used
        ], 200);
    }




    function linkedWallets()
    {
        $linked = WalletLinks::with(['user:id,name'])->where(['school_id' => auth()->user()->school_id])->orderby('id', 'desc')->limit(20)->get();

        return response([
            'data' => $linked
        ], 200);
    }



    function walletLinker(Request $request)
    {
        $val = Validator::make($request->all(), [
            'id' => 'required',
            'password' => 'required'
        ]);
        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}
        $res = Http::asForm()->post(env('LINK'), [
            'validator' => 'kkkk',
            'password' => $request->password,
            'param' => $request->id,
        ]);


        if($res['status'] == 1) {
            $user = auth()->user();
            $res = $res['data'];
            $ct = WalletLinks::where(['live_id' => $res['sn'], 'school_id' =>  $user->school_id])->count();
            if($ct == 0){
                WalletLinks::create([
                    'school_id' => $user->school_id,
                    'user_id' => $user->id,
                    'live_id' => $res['sn'],
                    'name' => $res['lastname'].' '.$res['firstname'],
                    'phone' => $res['phone'],
                    'email' => $res['email'],
                ]);
            }

            School::where(['id' => $user->school_id])->update([
                'live_id' => $res['sn']
            ]);

            return response([
                'message' => 'Wallet has been linked to '. $res['lastname']. ' '.$res['firstname'] ,
            ], 200);
        }

        return response([
            'message' => $res['message'],
        ], 422);

    }


}
