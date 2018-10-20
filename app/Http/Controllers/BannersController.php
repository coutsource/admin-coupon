<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\UserConversionCode;
use App\Models\ConversionCode;
use App\Models\Banner;

class BannersController extends Controller
{
	public function index(Request $request)
	{
		$user = Auth::guard('api')->user();
		if ($user) {
			$userConversionCode = UserConversionCode::where('user_id', $user->id)->first();
			$conversionCodeId = $userConversionCode->conversion_code_id;
			$conversionCode = ConversionCode::find($conversionCodeId);
			$categoryId = $conversionCode->category_id;
			

			$banners = Banner::where('category_id', $categoryId)->get();

			return response()->json($banners);
		}
		return response()->json([]);
	}
}