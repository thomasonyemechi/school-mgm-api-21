<?php

namespace App\Http\Controllers;

use App\Models\Session;
use App\Models\Term;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class SessionController extends Controller
{

    function fetchSession()
    {
        return response([
            'data' => Session::with(['terms'])->where('school_id', auth()->user()->school_id)->orderBy('id', 'desc')->get(),
            'status' => true
        ], 200);
    }


    function createSession(Request $request)
    {
        $val = Validator::make($request->all(), [
            'session' => 'required|string|max:10',
        ]);
        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}

        $check_session = Session::where(['school_id' => auth()->user()->school->id, 'session' => $request->session])->count();
        if($check_session > 0) {
            return response(['message' => 'Session already exsits', 'status' => false], 409);
        }

        $session = Session::create([
            'school_id' => auth()->user()->school->id,
            'session' => $request->session,
            'created_by' => auth()->user()->school->id,
        ]);

        for ($i=1; $i <=3; $i++) {
            Term::create([
                'school_id' => auth()->user()->school_id,
                'session_id' => $session->id,
                'term' => $i,
                'year' => explode('/',$request->session)[0],
            ]);
        }

        return response([
            'message' => 'Session created successfully',
            'status' => true
        ], 200);
    }


    function updateTermInfo(Request $request)
    {
        $val = Validator::make($request->all(), [
            'year' => 'required|string|max:255',
            'term_id' => 'required|exists:terms,id',
            'close' => 'required',
            'resume' => 'required',
        ]);
        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422 );}
        Term::where(['id' => $request->term_id])->update([
            'year' => $request->year,
            'close' => $request->close,
            'resume' => $request->resume,
        ]);
        return response(['message' => 'Term Info updated successfully', 'status' => true], 200);
    }


    function activateTerm(Request $request)
    {
        $val = Validator::make($request->all(), [
            'term_id' => 'required|exists:terms,id',
        ]);
        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}
        $this->deactivateTerm(auth()->user()->school->id);
        Term::where('id', $request->term_id)->update([
            'status' => 1
        ]);
        return response(['message' => 'Term activated sucessfully', 'status' => true], 200);
    }



    function deactivateTerm($school_id)
    {
        $sessions = Session::where(['school_id' => $school_id])->get();
        foreach($sessions as $sess)
        {
            $terms = $sess->terms;
            foreach($terms as $term)
            {
                Term::where(['id' => $term->id])->update([
                    'status' => 0
                ]);
            }
        }
        return;
    }


}
