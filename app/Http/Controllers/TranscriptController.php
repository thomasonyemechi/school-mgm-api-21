<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class TranscriptController extends ResultController
{
    function Trans()
    {
        return response([
            'data' => 'Something'
        ]);
    }
}
