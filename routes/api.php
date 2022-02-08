<?php

use App\Http\Controllers\BillController;
use App\Http\Controllers\SchoolController;
use App\Http\Controllers\SessionController;
use App\Http\Controllers\StaffController;
use App\Http\Controllers\SubjectController;
use App\Http\Controllers\ClassController;
use App\Http\Controllers\FeeController;
use App\Http\Controllers\GuardianController;
use App\Http\Controllers\MiscellaneousController;
use App\Http\Controllers\ResultController;
use App\Http\Controllers\StudentController;
use App\Models\School;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('/register/school', [\App\Http\Controllers\SchoolController::class, 'registerSchool']);
Route::post('/login/staff', [\App\Http\Controllers\AuthController::class, 'login']);

Route::get('/get_school_info/{school_id}', function ($school_id) {
    $school = School::where('id', $school_id)->get();
    return $school;
});



Route::get('/transaction/range/{from?}/{to?}', [BillController::class, 'fetchDateRangeFee']);
Route::get('/result/{student_id}', [ResultController::class, 'currentTermResult']);







Route::group(['prefix'=>'control', 'as'=>'control.', 'middleware' => ['auth:api'] ], function (){


    Route::get('/registration_requirements', [MiscellaneousController::class, 'fetchParentClassArm']);





    /*
        terms and sessions routes are listed below
        most of the routes functions are created in the SessionController
    */

    // Route::post('/get/session', [SessionController::class, 'fetchSession']);
    Route::get('/get/session', [SessionController::class, 'fetchSession']);
    Route::post('/create/session', [SessionController::class, 'createSession']);
    Route::post('/update/term/info', [SessionController::class, 'updateTermInfo']);
    Route::post('/activateterm', [SessionController::class, 'activateTerm']);

    /*
        update school informations
    */
    Route::post('/update_school_information', [SchoolController::class, 'updateSchoolInformation']);

    /*
        Staff Routes ... these includes
        Creating of staff profile,
        Updaeting of staff profile,
        Activating / Deactivating staff
        route function can be found in the staffcontroller
    */
    Route::post('/add_staff', [StaffController::class, 'createStaff']);
    Route::post('/update_staff_info', [StaffController::class, 'updateStaffInfo']);
    Route::get('/get_all_staffs', [StaffController::class, 'fetchAllStaffs']);
    Route::get('/get_staff/{staff_id}', [StaffController::class, 'fetchSingleStaff']);
    Route::post('/chnage_staff_status', [StaffController::class, 'updateStaffStatus']);


    /*
        Subjects Routes includes... Creating, Updating and deleting subeject
        also viewing some info
    */

    Route::post('/create_subject', [SubjectController::class, 'createSubject']);
    Route::post('/update_subject', [SubjectController::class, 'updateSubject']);
    Route::get('/get_all_subject', [SubjectController::class, 'fetchallSubjects']);


    /*
        Create , update fetch Arm
    */
    Route::post('/create_arm', [ClassController::class, 'createClassArm']);
    Route::post('/update_arm', [ClassController::class, 'updateClassArm']);
    Route::get('/get_class_arm', [ClassController::class, 'fecthClassArms']);


    /*
        Create , update fetch Class Category
    */
    Route::post('/create_class_category', [ClassController::class, 'createClassCategory']);
    Route::post('/update_class_category', [ClassController::class, 'updateClassCategory']);
    Route::get('/get_class_category', [ClassController::class, 'fetchAllClassCategory']);



    /*
        Create , update fetch Class Core Classes
    */
    Route::post('/create_class', [ClassController::class, 'createClass']);
    Route::post('/order_class', [ClassController::class, 'orderClass']);
    Route::get('/get_class', [ClassController::class, 'fetchClasses']);

    //  `````````````````````````````````````````````````````````Stopped collection creation here````````````````````````````````````````

    /*
        Create Guardian Profile
        update Guardian Profile
        Remove Guardian From List
        Fetch Guardians Summary
        Fetch Guardians Details
        Fetch Single Guardian Information
    */
    Route::post('/create_guardian_profile', [GuardianController::class, 'createGuardianProfile']);
    Route::post('/update_guardian_profile', [GuardianController::class, 'updateGuardianProfile']);
    Route::post('/check_gurdian_email', [GuardianController::class, 'checkGurdianEmail']);
    Route::get('/fetch_guardians_info_summmary', [GuardianController::class, 'fetchGuardiansSummmary']);
    Route::post('/fetch_guardians_info_details', [GuardianController::class, 'fetchGuardiansDeatils']);




    /*
        Students Routes
    */
    Route::post('/create_student_profile', [StudentController::class, 'createStudentProfile']);
    Route::get('/fetch_recently_registered_student', [StudentController::class, 'fetchStudentL100']);
    Route::get('/get_all_student', [StudentController::class, 'fetchAllStudentSummary']);
    Route::get('/search_student/{q}', [StudentController::class, 'searchStudent']);
    Route::get('/get_student/{student_id}', [StudentController::class, 'getStudent']);
    Route::get('/student/fee_sum/{student_id}/{term_id?}', [BillController::class, 'fetchTermFeeSummary']);

    Route::post('/student/update_miscellaneous', [StudentController::class, 'updateMiscellaneous']);
    Route::post('/student/update_student_class', [StudentController::class, 'updateStudentClass']);
    Route::post('/student/update_authdetails', [StudentController::class, 'updateAuthdetails']);
    Route::post('/student/update_basic_info', [StudentController::class, 'updateBasicInfo']);



    // students routes are yet to be added and tested





    /*
        Fee Routes ..
        Creating feee category

        Feee Routings `````````````````````````````````````````````````````````````````````````````
    */

    Route::get('/fee_requirements', [FeeController::class, 'feeRequirements']);
    Route::post('/create_fee_category', [FeeController::class, 'crerateFeeCategory']);
    Route::post('/update_fee_category', [FeeController::class, 'updateFeeCategory']);
    Route::post('/fetch_fee_category', [FeeController::class, 'fetchTermFee']);

    Route::post('/set_fee', [BillController::class, 'setFees']);
    Route::get('/fetch_fee/{fee}/{class}', [BillController::class, 'fetSettedFee']);
    Route::get('/get_student_fee/{student_id}/{term?}', [BillController::class, 'fetchStudentFee']);
    Route::post('/update_school_fee_per_record', [BillController::class, 'updateSchoolFeePerRecord']);
    Route::post('/update_school_fee_record', [BillController::class, 'updateSchoolFeePerRecord_MultipleStudent']);
    Route::post('/make_fee_payment', [BillController::class, 'MakeFeePayment']);

    Route::get('/get_student_payment_all/{student_id}', [BillController::class, 'fetchAllStudentPayment']);
    Route::get('/get_student_payment_per_term/{student_id}/{term_id}', [BillController::class, 'fetchTermlyPaymentPerStudent']);
    Route::get('/get_student_payment_per_session/{student_id}/{session_id}', [BillController::class, 'fetchSessionPaymentPerStudent']);

    Route::get('/get_fee_payment_history_per_term/{fee_id}/{term_id}', [BillController::class, 'fetchTermPaymentPerFeeCategory']);


    //fetch transactions
    Route::get('/transaction/daily/{day}', [BillController::class, 'fetchDailyFeeTransaction']);
    Route::get('/transaction/weekly/{week}', [BillController::class, 'fetchWeeklyTransaction']);
    Route::get('/transaction/termly/{term?}', [BillController::class, 'fetchTermlyTransaction']);
    Route::get('/transaction/range/{from?}/{to?}', [BillController::class, 'fetchDateRangeFee']);






    /*
        result routes
        ```````````````````````````````````````````````````````````````````````````````````````````````````
    */


    Route::post('/assign_subject_to_teacher', [ResultController::class, 'assignSubjectToTeacher']);
    Route::post('/remove_assigned_subject', [ResultController::class, 'removeAssignedSubject']);
    Route::get('/assign_subject_req', [ResultController::class, 'requirments']);

    Route::get('/fetch_subject_teacher', [ResultController::class, 'fetchSubjectTeachers']);
    Route::get('/fetch_subject_teacher/{class_id}', [ResultController::class, 'fetchSubjectTeachersByClass']);
    Route::get('/fetch_teacher_subject/{teacher_id}', [ResultController::class, 'fetchTeacherSubject']);

    //res
    Route::post('/start_result', [ResultController::class, 'startResult']);
    Route::post('/update/student/result', [ResultController::class, 'editStudentResult']);
    Route::post('/update/student/result/all', [ResultController::class, 'editMultipleResult']);
    Route::get('/load/program/{program}', [ResultController::class, 'loadResult']);
    Route::get('/broad/{program}', [ResultController::class, 'fetchSessionBroadSheet']);

    Route::post('/update_ca', [ResultController::class, 'updateCa']);
    Route::get('/ca', [ResultController::class, 'Ca']);
    Route::get('/results/{student_id}', [ResultController::class, 'studentResults']);



    /*
        Class Routes
    */

    Route::get('/class_summary/{class_id}', [MiscellaneousController::class, 'classProfileInfo']);
    Route::get('/class_students/{class_id}', [MiscellaneousController::class, 'fetchClassStudents']);
    Route::get('/class_fee/{class_id}/{term_id?}', [MiscellaneousController::class, 'fetchClassFee']);
    Route::get('/class_payment/{class_id}/{term_id?}', [MiscellaneousController::class, 'fetchClassPayments']);
    Route::get('/class_teachers/{class_id}', [MiscellaneousController::class, 'fetchClassTeachers']);

    //permissions power access fetchUserPermission
    Route::get('/users/permission', [StaffController::class, 'fetchUserPermission']);
    Route::post('/permission/update', [StaffController::class, 'updateSinglePermission']);
    Route::post('/permission/update_all', [StaffController::class, 'updatePermissionAll']);




});

