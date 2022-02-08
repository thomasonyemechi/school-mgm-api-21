<?php

namespace App\Http\Controllers;

use App\Models\Permission;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class StaffController extends Controller
{



    function updateStaffStatus(Request $request)
    {
        $staff = User::find($request->staff_id);
        if(!$staff) { return response(['message' => 'The staff id selected is invalid', 'status' => false], 422); }
        if(!checkUserSchool($staff->school_id)) { return response(bidMisMatchRes(), 401); }

        $this->changeStaffStatus($staff->id, $staff->status);

        return response([
            'message' => 'Operation Sucessfull',
            'status' => true
        ], 200);
    }


    function changeStaffStatus($staff_id, $status)
    {
        $new_status = ($status == 1) ? 0 : 1 ;
        User::where('id', $staff_id)->update([
            'status' => $new_status
        ]);
        return;
    }


    // Fetches a single staff form the database
    function fetchSingleStaff($staff_id)
    {
        $staff = User::find($staff_id);
        if(!$staff) { return response(['message' => 'The staff id selected is invalid', 'status' => false], 422); }
        if(!checkUserSchool($staff->school_id)) { return response(bidMisMatchRes(), 401); }

        return response([
            'data' => [
                'id' => $staff->id,
                'name' => ucwords($staff->name),
                'phone' => $staff->phone,
                'addres' => $staff->address,
                'photo' => $staff->photo,
                'status' => ($staff->status == 0) ? 'In-active' : 'Active',
                'role' => userRole($staff->role),
                'school' => ucwords($staff->school->name),
            ],
            'message' => 'Sucessfull Search',
            'status' => true,
        ], 200);
    }


    // fecth all the staff in a school
    function fetchAllStaffs()
    {
        $staffs = User::where('school_id', auth()->user()->school_id)->orderBy('id', 'desc')->paginate(100);
        return response([
            'data' => $staffs,
            'message' => 'Request successfull',
            'status' => true,
        ], 200);
    }

    //for updating staff profile
    function updateStaffInfo(Request $request)
    {
        $val = Validator::make($request->all(), [
            'staff_id' => 'required|exists:users,id',
        ]);
        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}
        $staff = User::find($request->staff_id);
        if(!checkUserSchool($staff->school_id)) { return response(bidMisMatchRes(), 401); }

        if($request->hasFile('photo')){
            $photo = $request->file('photo');
            $extension = $photo->getClientOriginalExtension();
            $photo_name = 'assets/img/users/'.rand(11111,9999999).Str::slug($staff->name).'.'.$extension;
            move_uploaded_file($photo, $photo_name);
            @unlink($staff->photo);
        }

        User::where('id', $request->staff_id)->update([
            'name' => $request->name ?? $staff->name,
            'address' => $request->address ?? $staff->address,
            'phone' => $request->phone ?? $staff->phone,
            'photo' => $photo_name ?? $staff->photo,
        ]);

        return response([
            'data' => User::find($staff->id),
            'message' => 'Staff profile updated sucessfully',
            'status' => false
        ], 200);
    }


    function mutiplyuser()
    {
        // $names = ['Dayo', 'Grace', 'Ushie', 'Uche', 'Ammon', 'Yusuf', 'Kaka', 'Valentine', 'Saliu', 'Samuel', 'Perry', 'Bash', 'Dollar',
        //     'Park', 'Jazzy', 'Jay', 'Yoncy', 'Ravo', 'Joe', 'Doe', 'Poe', 'Gideon', 'Nimi', 'Braid', 'Dorcas', 'Tem', 'Blaze', 'Bowy', 'Boss', 'Moscow'];

        // $roles = [6,7,8,9];


        // for($i=0; $i <= 50; $i++){
        //     $role_id = $roles[rand(0, count($roles)-1)];
        //     $name1 = $names[rand(0, count($names)-1 )];
        //     $fullname = $names[rand(0, count($names)-1 )].' '.$name1;
        //     $email = strtolower($name1.rand(1111,99999).'@schoolpetal.com');
        //     echo $fullname. '<br>';
        //     $request = [
        //         'name' => $fullname,
        //         'phone' => rand(1111111111,99999999999999999),
        //         'email' => $email,
        //         'role' => $role_id
        //     ];

        //     $this->createStaff(json_decode(json_encode($request)));
        // }




        $users = User::where('id', '>', 1)->get();

        foreach($users as $user){
            $p = rand(1111111,9999999);
            $user->update([
                'phone' => $p,
                'password' => Hash::make($p)
            ]);
        }

        return 'done';

    }


    function createStaff(Request $request)
    {
        $val = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'phone' => 'required|string|max:20',
            'email' => 'required|email|unique:users,email',
            'role' => 'required|integer'
        ]);
        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}

        $user = User::create([
            'school_id' => auth()->user()->school_id,
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make(trim($request->phone)),
            'role' => $request->role,
            'phone' => $request->phone,
            'created_by' => auth()->user()->id,
        ]);

        $this->createPermission($user->id, 10);

        return response([
            'message' => 'Staff added sucessfully',
            'status' => false
        ], 200);
    }


    function updatePermissionAll(Request $request)
    {
        $val = Validator::make($request->all(), [
            'data' => 'required',
        ]);
        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}
        $permssions = $request->data;
        foreach($permssions as $per) {
            Permission::where('id', $per['permission_id'])->update([
                'u_result' => $per['result'] ?? 0,
                'fee' => $per['fee'] ?? 0,
                'registration' => $per['registration'] ?? 0,
                'other' => $per['other'] ?? 0
            ]);
        }
        return response([
            'message' => count($permssions).' users permissions updated sucesffullly'
        ], 200);
    }


    function updateSinglePermission(Request $request) {
        $val = Validator::make($request->all(), [
            'permission_id' => 'required|exists:permissions,id',
        ]);
        if ($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}

        Permission::where('id', $request->permission_id)->update([
            'u_result' => $request->result ?? 0,
            'fee' => $request->fee ?? 0,
            'registration' => $request->registration ?? 0,
            'other' => $request->other ?? 0
        ]);

        return response([
            'message' => 'User permissions updated sucessfully'
        ], 200);
    }


    // function below creates permmison fo users based in their role in the system
    function createPermission($user_id, $role)
    {
        $check_permission = Permission::where(['user_id' => $user_id])->count();
        if($check_permission > 0) { return; } // stops function if user already has permmison
        if($role == 10)
        {
            Permission::create([
                'user_id' => $user_id,
                'fee' => 1,
                'registration' => 1,
                'other' => 1
            ]);
        }else {
            Permission::create([
                'user_id' => $user_id
            ]);
        }
        return response(['message' => 'Permission added'], 200);
    }


    function fetchUserPermission() {
        $users = User::with(['permission'])->where(['school_id' => auth()->user()->school_id])->paginate(100);
        return response([
            'data' => $users
        ], 200);
    }




}
