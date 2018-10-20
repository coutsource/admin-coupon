<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\Dashboard;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;

use App\Models\User;
use App\Models\Category;
use App\Models\Product;

class HomeController extends Controller
{
    public function index()
    {
        return Admin::content(function (Content $content) {

            // data
            $data = $this->getStatisticsData();

            $content->header('Dashboard');
            $content->description('Welcome to dashboard');

            $content->row(view('admin.indexs.title'));

            $content->row(function (Row $row) {
                // $row->column(4, function (Column $column) {
                //     $column->append(view('admin.charts.bar'));
                // });
                $row->column(2, '');
                $row->column(8, function (Column $column) {
                    $column->row(function (Row $row) {
                        $row->column(4, function (Column $column) {
                            $arr = [
                                'count' => User::all()->count(),
                                'title' => '用户数'
                            ];
                            $column->append(view('admin.indexs.user', compact('arr')));
                        });
                        $row->column(4, function (Column $column) {
                            $arr = [
                                'count' => Category::all()->count(),
                                'title' => '类别数'
                            ];
                            $column->append(view('admin.indexs.category', compact('arr')));
                        });
                        $row->column(4, function (Column $column) {
                            $arr = [
                                'count' => Product::all()->count(),
                                'title' => '商品数'
                            ];
                            $column->append(view('admin.indexs.product', compact('arr')));
                        });
                    });
                });
            });

            $content->row(view('admin.charts.pie', compact('data')));
        });
    }


    private function getStatisticsData()
    {
        $user = User::all()->count();
        $category = Category::all()->count();
        $product = Product::all()->count();
        return [
            'user' => $user,
            'category' => $category,
            'product' => $product
        ];
    }
}
