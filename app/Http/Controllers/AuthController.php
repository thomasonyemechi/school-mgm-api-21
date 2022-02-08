<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{


    public function allUsers()
    {
        return User::all();
    }




    public function register(Request $request)
    {
        $validatedData = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6|confirmed',
        ]);
        if ($validatedData->fails())
        {
            return response(['errors'=>$validatedData->errors()->all()], 422);
        }

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password)
        ]);
        $accessToken = $user->createToken('authToken')->accessToken;
        return response([ 'user' => $user, 'access_token' => $accessToken], 200);
    }


    public function login(Request $request)
    {
        $validatedData = Validator::make($request->all(), [
            'email' => 'email|required',
            'password' => 'required'
        ]);
        if ($validatedData->fails())
        {
            return response(['errors'=>$validatedData->errors()->all()], 422);
        }
        if (!auth()->attempt(['email' => $request->email, 'password' => $request->password])) {
            return response(['message' => 'Invalid Credentials'], 401);
        }
        $accessToken = auth()->user()->createToken('authToken')->accessToken;
        $user = auth()->user();
        $user['permission'] = $user->permission;
        $user['school'] = $user->school;
        $data = [
            'user' => $user,
            'term' => currentActiveTerm()
        ];
        return response(['data' => $data, 'message' => 'Login successfull' , 'access_token' => $accessToken], 200);
    }


}
