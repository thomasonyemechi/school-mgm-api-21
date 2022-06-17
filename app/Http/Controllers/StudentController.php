<?php

namespace App\Http\Controllers;

use App\Models\Guardian;
use App\Models\Student;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class StudentController extends Controller
{

    function updateStudentPhoto(Request $request)
    {
        $val = Validator::make($request->all(), [
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'id' => 'required|exists:students,id'
        ]);
        if($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}

        $student = Student::find($request->id);
        $oldname = $student->photo;
        if($request->hasFile('image')){
            $img = $request->file('image');
            $name = 'assets/img/students/'.$student->firstname.'_'.time().rand().'.'.$img->getClientOriginalExtension();
            move_uploaded_file($img, $name);
            if($oldname == 'assets/img/students/user.png') {} else { unlink($oldname); }
        }
        $student->update([
            'photo' => $name
        ]);

        return response([
            'message' => 'Profile picture has been change shcessfully',
            'name' => $name
        ], 200);
    }

    function getStudent($student_id) {
        $student = Student::with(['guardian', 'arm:id,arm', 'class:id,class'])->find($student_id);
        return response([
            'data' =>  $student
        ]);
    }


    function fetchStudents()
    {
        $students = Student::with(['class:id,class', 'arm:id,arm'])->where(['school_id' => auth()->user()->school_id , 'status' => 1])->get(['id', 'surname', 'firstname', 'othername', 'sex', 'class_id', 'arm_id']);
        return response([
            'data' => $students
        ], 200);
    }


    function fetchAllStudentSummary(){
        $students = Student::with(['class:id,class', 'arm:id,arm'])->where('school_id', auth()->user()->school_id)->orderBy('id', 'desc')->paginate(50 ,['id', 'surname', 'firstname', 'class_id', 'arm_id', 'status', 'sex', 'photo']);
        return response([
            'data' => $students
        ], 200);
    }



    function searchStudent($q)
    {
        $students = Student::with(['class:id,class', 'arm:id,arm'])
            ->orWhere('registration_number', 'like', "%$q%")
            ->orWhere('surname', 'like', "%$q%")
            ->orWhere('firstname', 'like', "%$q%")
            ->orWhere('othername', 'like', "%$q%")
            ->orWhere('username', 'like', "%$q%")
            ->where('school_id', auth()->user()->school_id)
            ->limit(150)->get(['id', 'surname', 'firstname', 'class_id', 'arm_id', 'guardian_id', 'sex', 'status']);

        return response([
            'data' => $students
        ]);
    }



    function fetchStudentL100()
    {
        $students = Student::with(['guardian:id,guardian_name', 'class:id,class', 'arm:id,arm'])->where('school_id', auth()->user()->school_id)->orderBy('id', 'desc')->limit(100)->get(
            ['id', 'surname', 'firstname', 'class_id', 'arm_id', 'guardian_id', 'sex'
        ]);
        return response([
            'data' => $students
        ], 200);
    }



    function updateAuthdetails(Request $request)
    {
        $val = Validator::make($request->all(), [
            'student_id' => 'required|exists:students,id',
            'username' => 'required|unique:students,username|string',
            'password' => 'required|string',
        ]);
        if($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}

        $student = Student::find($request->student_id);
        $student->update([
            'username' => $request->username,
            'password' => Hash::make($request->password),
            'pwd' => $request->password
        ]);

        return response([
            'message' => 'Auth details sucessfully updated',
            'status' => true
        ], 200);
    }


    function updateStudentClass(Request $request)
    {
        $val = Validator::make($request->all(), [
            'class_id' => 'required|exists:classcores,id',
            'student_id' => 'required|exists:students,id',
        ]);
        if($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}
        $student = Student::find($request->student_id);
        $student->update([
            'class_id' => $request->class_id
        ]);
        return response([
            'message' => 'Class updated sucessfully'
        ], 200);
    }

    function updateMiscellaneous(Request $request) {
        $val = Validator::make($request->all(), [
            'blood_group' => 'string|max:5',
            'genotype' => 'string|max:5',
            'disability' => 'string',
            'ailment' => 'string',
            'student_id' => 'required|exists:students,id'
        ]);
        if($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}
        $student = Student::find($request->student_id);
        $others = [
            'previous_school' => $request->previous_school,
            'reason_for_leaving' => $request->reason_for_leaving,
            'blood_group' => $request->blood_group,
            'genotype' => $request->genotype,
            'ailment' => $request->ailment,
            'disability' => $request->disability,
        ];
        $student->update([
            'others' => json_encode($others),
        ]);
        return response([
            'message' => 'Info updated sucessfully'
        ]);
    }



    function updateBasicInfo(Request $request)
    {
        $val = Validator::make($request->all(), [
            'guardian_id' => 'required|exists:guardians,id',
            'surname' => 'required',
            'firstname' => 'required',
            'student_id' => 'required|exists:students,id'
        ]);
        if($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}
        $student = Student::find($request->student_id);
        $student->update([
            'guardian_id' => $request->guardian_id,
            'surname' => $request->surname,
            'firstname' => $request->firstname,
            'firstname' => $request->firstname,
            'othername' => $request->othername,
            'sex' => $request->gender,
            'registration_number' => $request->reg,
        ]);

        return response([
            'message' => 'Basic info has been update sucessfully',
        ], 200);
    }


    public function createStudentProfile(Request $request)
    {
        $val = Validator::make($request->all(), [
            'guardian_id' => 'required|exists:guardians,id',
            'class_id' => 'required|exists:class_cores,id',
            'surname' => 'required',
            'firstname' => 'required',
        ]);
        if($val->fails()){ return response(['errors'=>$val->errors()->all()], 422);}

        $pwd = rand(1000, 9999);

        $username = strtolower($request->surname).$pwd;
        if($this->checkUserName($username) > 0){
            $username = $username.$request->guardian_id.$request->class_id;
        }

        $others = [
            'previous_school' => 'null',
            'reason_for_leaving' => 'null',
            'blood_group' => 'null',
            'genotype' => 'null',
            'ailment' => 'null',
            'disability' => 'null',
        ];


        Student::create([
            'school_id' => auth()->user()->school_id,
            'guardian_id' => $request->guardian_id,
            'class_id' => $request->class_id,
            'arm_id' => $request->arm_id ?? 0,
            'registration_number' => $request->registration_number ?? '',
            'surname' => $request->surname,
            'firstname' => $request->firstname,
            'othername' => $request->othername,
            'sex' => $request->sex,
            'username' => $username,
            'password' => Hash::make($pwd),
            'pwd' => $pwd,
            'others' => json_encode($others),
            'created_by' => auth()->user()->id,
        ]);


        return response([
            'message' => 'Student profile created sucessfully',
            'status' => true,
        ], 200);
    }



    function checkUserName($username){
        $ck = Student::where(['username' => $username])->count();
        return $ck;
    }

}
