<?php
use App\Models\Term;


function currentActiveTerm()
{
    $sessions = auth()->user()->school->sessions;
    foreach($sessions as $sess)
    {
        foreach($sess->terms as $term){
            if($term->status == 1) { $current_term = $term; }
        }
    }
    return $current_term ?? '';
}


// function currentActiveTerm()
// {
//     $term = Term::where(['school_id' => auth()->user()->school_id, 'status' => 1])->get();
//     return $term ?? '';
// }


function walletProcess()
{
    // 1 to 10 = negative
    //above 10  = +ve
}


function bidMisMatchRes()
{
    return ['message' => 'Authentication failed', 'status' => false];
}

function checkUserSchool($incoming_bid)
{
    return (auth()->user()->school_id == $incoming_bid) ? TRUE : FALSE ;
}

function userRole($role)
{
    if($role == 10){
        $r = 'Super Admin';
    }elseif($role == 9){
        $r = 'Administrator';
    }elseif($role == 8){
        $r = 'Accountant';
    }elseif($role == 7){
        $r = 'Teacher';
    }elseif($role == 6){
        $r = 'Sales Rep';
    }else {
        $r = 'Inactive Account';
    }
    return $r;
}




function term_text($term) {
    $val = '';
    if ($term == 1) {
        $val = 'First Term';
    } else if ($term == 2) {
        $val = 'Second Term';
    } else if ($term == 3) {
        $val = 'Third Term';
    }

    return $val;
}


?>
