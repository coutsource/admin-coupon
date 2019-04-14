<?php

use Illuminate\Routing\Router;

Admin::registerAuthRoutes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {
    $router->get('/', 'HomeController@index');
    $router->get('users', 'UsersController@index');
    $router->get('products', 'ProductsController@index');
    $router->get('products/create', 'ProductsController@create');
    $router->post('products', 'ProductsController@store');
    $router->get('products/{id}/edit', 'ProductsController@edit');
    $router->put('products/{id}', 'ProductsController@update');
    $router->get('orders', 'OrdersController@index')->name('admin.orders.index');
    $router->get('orders/{order}', 'OrdersController@show')->name('admin.orders.show');
    $router->post('orders/{order}/ship', 'OrdersController@ship')->name('admin.orders.ship');
    $router->post('orders/{order}/refund', 'OrdersController@handleRefund')->name('admin.orders.handle_refund');
    $router->get('order_logistics/{orderId}', 'LogisticsController@create')->name('admin.order_logistics.create');
    $router->get('coupon_codes', 'CouponCodesController@index');
    $router->post('coupon_codes', 'CouponCodesController@store');
    $router->get('coupon_codes/create', 'CouponCodesController@create');
    $router->get('coupon_codes/{id}/edit', 'CouponCodesController@edit');
    $router->put('coupon_codes/{id}', 'CouponCodesController@update');
    $router->delete('coupon_codes/{id}', 'CouponCodesController@destroy');
    // conversion code
    $router->get('conversion_codes', 'ConversionCodesController@index');
    $router->post('conversion_codes', 'ConversionCodesController@store');
    $router->get('conversion_codes/create', 'ConversionCodesController@create');
    $router->get('conversion_codes/{id}/edit', 'ConversionCodesController@edit');
    $router->put('conversion_codes/{id}', 'ConversionCodesController@update');
    $router->delete('conversion_codes/{id}', 'ConversionCodesController@destroy');
    $router->post('conversion_codes/active', 'ConversionCodesController@active');
    // products category
    $router->get('categories', 'CategoriesController@index');
    $router->post('categories', 'CategoriesController@store');
    $router->get('categories/create', 'CategoriesController@create');
    $router->get('categories/{id}/edit', 'CategoriesController@edit');
    $router->put('categories/{id}', 'CategoriesController@update');
    $router->delete('categories/{id}', 'CategoriesController@destroy');
    // banner
    $router->get('banners', 'BannersController@index');
    $router->post('banners', 'BannersController@store');
    $router->get('banners/create', 'BannersController@create');
    $router->get('banners/{id}/edit', 'BannersController@edit');
    $router->put('banners/{id}', 'BannersController@update');
    $router->delete('banners/{id}', 'BannersController@destroy');

});