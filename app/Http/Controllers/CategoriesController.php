<?php
namespace App\Http\Controllers;

use App\Models\UserConversionCode;
use App\Models\ConversionCode;
use App\Models\Category;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CategoriesController extends Controller
{
	public function index(Request $request)
	{
		$user = Auth::guard('api')->user();
		if ($user) {
			$userConversionCode = UserConversionCode::where('user_id', $user->id)->first();
			$conversionCodeId = $userConversionCode->conversion_code_id;
			$conversionCode = ConversionCode::find($conversionCodeId);
			$categoryId = $conversionCode->category_id;
			

			$categories = Category::where('parent_id', $categoryId)->get();

			return response()->json($categories);
		}
		return response()->json([]);
	}
}