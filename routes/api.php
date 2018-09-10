<?php

use Illuminate\Http\Request;

use App\Models\ConversionCode;

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['middleware' => 'auth:api'], function() {
    Route::get('conversion_codes', function () {
    	return ConversionCode::all();
    });
    Route::get('conversion_codes/{conversionCode}', 'ConversionCodesController@show');
    Route::post('conversion_codes/logout', 'ConversionCodesController@logout');

    // get all categories
    Route::get('categories', 'CategoriesController@index');

    // get all products
   	Route::get('category_products', 'ProductsController@categories');

   	// get products by category
   	Route::get('category_products/{category_id}', 'ProductsController@getByCategoryId');
	
   	// get banners
   	Route::get('banners', 'BannersController@index');

   	// get addresses
   	Route::get('addresses', 'UserAddressesController@apiIndex');
   	Route::post('address/store', 'UserAddressesController@apiStore');
});

Route::post('conversion_codes/login', 'ConversionCodesController@login');

