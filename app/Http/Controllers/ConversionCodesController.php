<?php

namespace App\Http\Controllers;

use App\Models\ConversionCode;
use App\Models\User;
use App\Models\UserConversionCode;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ConversionCodesController extends Controller
{

   	public function show (ConversionCode $conversionCode)
   	{
   		return $conversionCode;
   	}

   	public function login (Request $request)
   	{
   		$data = $request->all();
   		if (!$this->validateCode($data)) {
   			return response()->json(['code' => 40001, 'message' => '卡号或者密码不正确']);
   		}

   		$conversionCode = ConversionCode::where('code', $data['code'])->where('passwd', $data['passwd'])->firstOrFail();
   		if (!$conversionCode->actived) {
   			return response()->json(['code' => 40002, 'message' => '卡号未激活']);
   		}
         if ($conversionCode->used) {
            $user = $this->findUserByConversionCode($conversionCode->id);
            if (empty($user)) {
               return response()->json(['code' => 50000, 'message' => '数据不存在']);
            }
            if (empty($user->api_token)) {
               $user->api_token = str_random(60);
               $user->save();
            }
            return response()->json(['code' => 200, 'user' => $user]);
         }
   		$now = time();
   		if ($now < strtotime($conversionCode->not_before)) {
   			return response()->json(['code' => 40003, 'message' => '卡已经失效或还未生效']);
   		}
   		if (!empty($conversionCode->not_after)) {
   			if ($now > strtotime($conversionCode->not_after)) {
   				return response()->json(['code' => 40003, 'message' => '卡已经失效或还未生效']);
   			}
   		}
   		$user = $this->handleConversionCode($conversionCode);
         if (empty($user)) {
            return response()->json(['code' => 50000, 'message' => '数据不存在']);
         }
   		return response()->json(['code' => 200, 'user' => $user]);
   	}

      public function logout (Request $request)
      {
         $user = Auth::guard('api')->user();

         if ($user) {
            $user->api_token = null;
            $user->save();
         }

         return response()->json(['data' => 'User logged out.'], 200);
      }

   	private function validateCode($data)
   	{
   		try {
   			if (!isset($data['code']) || !isset($data['passwd']))
   			{
   				return false;
   			}
   			$count = ConversionCode::where('code', $data['code'])->where('passwd', $data['passwd'])->count();
   			if ($count < 1) {
   				return false;
   			} else {
   				return true;
   			}
   		} catch (\Exception $e) {
   			return false;
   		}
   		return false;
   	}

   	private function handleConversionCode($conversionCode)
   	{
   		$conversionCode->used = true;
   		$conversionCode->save();
   		$user = $this->mockUser($conversionCode->id);
   		$this->createUserConversionCode($user->id, $conversionCode->id);
         return $user;
   	}

   	private function mockUser($conversionCodeId)
   	{
   		$user = new User();
   		$user->name = "user" . $conversionCodeId;
   		$user->email = "example" . $conversionCodeId . "@qq.com";
   		$user->password = md5(md5("abc123_"));
         $user->api_token = str_random(60);
   		$user->save();
   		return $user;
   	}

   	private function createUserConversionCode($userId, $conversionCodeId)
   	{
   		$userConversionCode = new UserConversionCode();
   		$userConversionCode->user_id = $userId;
   		$userConversionCode->conversion_code_id = $conversionCodeId;
   		$userConversionCode->save();
   	}

      private function findUserByConversionCode($conversionCodeId)
      {
         $userConversionCode = UserConversionCode::where('conversion_code_id', $conversionCodeId)->first();
         if (empty($userConversionCode)) {
            return null;
         }
         $user = User::findOrFail($userConversionCode->user_id);
         return $user;
      }
}