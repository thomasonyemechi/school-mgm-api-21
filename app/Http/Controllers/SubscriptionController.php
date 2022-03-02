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


    function renewSubscription()
    {

    }


    function S()
    {
        $sub = Subscription::where(['school_id' => auth()->user()->id])->paginate(25);

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

            $ck_term = Term::where(['school_id' => $user->school_id, 'status' => 1])->count();
            $type = ($ck_term == 0) ? 3 : 2 ;
            Subscription::create([
                'school_id' => $user->school_id,
                'session_id' => Term::find($request->term_id)->session_id,
                'term_id' => $request->term_id,
                'pack' => $request->pack,
                'students' => Student::where(['school_id' => $user->school_id])->count(),
                'active' => Student::where(['school_id' => $user->school_id, 'status' => 0])->count(),
                'slots' => $request->slots,
                'amount' => $amount,
                'type' => $type
            ]);

            if($type == 3) {
                Term::where('id', $request->term_id)->update([
                    'paid' => 1,
                    'status' => 1,
                ]);
            }

            return response([
                'message' => 'Slot was sucessfully purchased'
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
        $res = Http::get(env('LINK').'?balance='.auth()->user()->school->live_id);
        return $res;
    }


    function availbaleSlots() {
        $total = Subscription::where(['school_id' => auth()->user()->school_id, 'status' => 2])->orWhere('status' , 3)->sum('slots');
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
