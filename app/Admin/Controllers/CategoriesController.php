<?php

namespace App\Admin\Controllers;

use App\Models\Category;

use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Encore\Admin\Tree;
use Encore\Admin\Widgets\Box;
use Encore\Admin\Controllers\ModelForm;

use App\Http\Controllers\Controller;
use Illuminate\Support\MessageBag;

class CategoriesController extends Controller
{
    use ModelForm;

    /**
     * Index interface.
     *
     * @return Content
     */
    public function index()
    {
        // return Admin::content(function (Content $content) {

        //     $content->header('header');
        //     $content->description('description');

        //     $content->body($this->grid());
        // });
        return Admin::content(function (Content $content) {
            $content->header('商品分组');
            $content->row(function (Row $row) {
                $row->column(6, $this->treeView()->render());

                $row->column(6, function (Column $column) {
                    $form = new \Encore\Admin\Widgets\Form();
                    $form->action(admin_base_path('/categories'));
                    $form->text('title', '名称');
                    $form->icon('icon', '图标');
                    $form->number('order','排序序号');
                    $form->select('parent_id','父类名称')->options(Category::selectOptions());
                    $form->hidden('_token')->default(csrf_token());
                    $column->append((new Box(trans('admin.new'), $form))->style('success'));
                });
            });
        });
    }

    /**
     * Edit interface.
     *
     * @param $id
     * @return Content
     */
    public function edit($id)
    {
        return Admin::content(function (Content $content) use ($id) {

            $content->header('编辑类别');
            $content->description($id);

            $content->body($this->form()->edit($id));
        });
    }

    /**
     * Create interface.
     *
     * @return Content
     */
    public function create()
    {
        return Admin::content(function (Content $content) {

            $content->header('增加类别');

            $content->body($this->form());
        });
    }

    protected function treeView()
    {
        return Category::tree(function (Tree $tree) {
            $tree->disableCreate();
            $tree->branch(function ($branch) {
                $class = $branch['icon'];
                $icon = "<i class='fa $class'></i>";
                return "{$icon} {$branch['title']}";
            });
        });
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Admin::grid(Category::class, function (Grid $grid) {

            $grid->id('ID')->sortable();

            $grid->created_at();
            $grid->updated_at();
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Admin::form(Category::class, function (Form $form) {

            $form->display('id', 'ID');
            $form->text('title', '名称')->rules('required');
            $form->icon('icon', '图标')->rules('required');
            $form->number('order', '排序序号')->rules('required');
            $form->select('parent_id','父类名称')->options(Category::selectOptions())->rules('required');
            $form->saving(function (Form $form) {
                if ($form->id && $form->id == $form->parent_id) {
                    $error = new MessageBag([
                        'title'   => '类型父级错误',
                        'message' => '类型父级不能是本身',
                    ]);
                    return back()->with(compact('error'));
                }
            });
        });
    }
}