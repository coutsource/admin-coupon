<?php

namespace App\Admin\Controllers;

use App\Models\OrderLogistic;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\ModelForm;

class LogisticsController extends Controller {


	/**
     * Create interface.
     *
     * @return Content
     */
    public function create($orderId)
    {
        return Admin::content(function (Content $content) use ($orderId) {

            $content->header('header');
            $content->description('description');

            $content->body($this->form($orderId));
        });
    }

    public function store(OrderLogistic $orderLogistic) {
        $this->form(request('order_id'))->store();
        return redirect('admin/orders');
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form($orderId)
    {
        return Admin::form(OrderLogistic::class, function (Form $form) use ($orderId) {

            $form->display('id', 'ID');
            $form->hidden('order_id')->value($orderId);
            $form->select('logistics_type', '物流类型')->options(OrderLogistic::getLogisticsOptions());
            $form->text('logistics_number', '物流单号');
            $form->display('created_at', '创建时间');
            $form->display('updated_at', '更新时间');
        });
    }  

}