<?php

namespace App\Admin\Controllers;

use App\Models\ConversionCode;
use App\Models\Category;
use App\Admin\Extensions\Tools\ActiveConversionCode;

use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\ModelForm;

use Illuminate\Support\MessageBag;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Input;
use App\Admin\Extensions\CsvExpoter;

class ConversionCodesController extends Controller
{
    use ModelForm;

    /**
     * Index interface.
     *
     * @return Content
     */
    public function index()
    {
        return Admin::content(function (Content $content) {

            $content->header('兑换码列表');

            $content->body($this->grid());
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

            $content->header('编辑兑换码');
            $content->description($id);

            $content->body($this->form(true)->edit($id));
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

            $content->header('创建兑换码');

            $content->body($this->form());
        });
    }

    // Batch active operation
    public function active(Request $request)
    {
        foreach (ConversionCode::find($request->get('ids')) as $post) {
            $post->actived = $request->get('action');
            $post->save();
        }
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Admin::grid(ConversionCode::class, function (Grid $grid) {

            $grid->id('ID')->sortable();
            $grid->name('名称')->sortable();
            $grid->code('兑换码');
            $grid->passwd('卡密');
            $grid->actived('是否激活')->display(function ($value) {
                return $value ? '是' : '否' ;
            });
            $grid->used('是否使用')->display(function ($value) {
                return $value ? '是' : '否' ;
            });
            $grid->column('isValid', '是否过期')->display(function () {
                return strtotime($this->not_after) < time() ? '是' : '否';
            });
            $grid->not_before('生效日期');
            $grid->not_after('失效日期');
            $grid->created_at('创建时间');
            $grid->actions(function ($actions) {
                if ($actions->row['actived']) {
                    $actions->disableDelete();
                }
                if ($actions->row['used']) {
                    $actions->disableDelete();
                    $actions->disableEdit();
                }
            });

            // close batch delete function
            $grid->tools(function ($tools) {
                $tools->batch(function ($batch) {
                    $batch->disableDelete();
                    $batch->add('批量激活', new ActiveConversionCode(1));
                });
            });
            $grid->model()->orderBy('updated_at', 'desc');

            // filter
            $grid->filter(function($filter) {
                $filter->disableIdFilter();
                $filter->like('name', '名称');
                $filter->equal('code', '兑换码');
                $filter->date('not_before', '生效日期');
                $filter->equal('used', '使用状态')->select([0 => '未使用', 1 => '已使用']);
            });

            // custom grid exporter
            $grid->exporter(new CsvExpoter());
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form($edit = false)
    {
        return Admin::form(ConversionCode::class, function (Form $form) use ($edit) {
            $form->display('id', 'ID');

            $form->text('name', '名称')->rules('required');
            if (!$edit) {
                $form->number('count', '张数');
                $form->model()->code = ConversionCode::findAvailableCode();
                $form->model()->passwd = Str::random(4); 
                $form->model()->used = 0;
            } 
            $form->datetime('not_before', '生效时间');
            $form->datetime('not_after', '失效时间');
            $form->select('category_id', '类别')->options(Category::selectOptions());
            $form->radio('actived', '是否激活')->options([
                '1' => '是',
                '0' => '否'
            ]);
            $form->ignore(['count']);
            $form->saving(function (Form $form) {
                if ($form->used == 1) {
                    throw new \Exception('兑换码已使用，不能编辑');
                }
                if (!$form->not_before) {
                    $form->not_before = date('Y-m-d H:i:s', time());
                }
                if ($form->not_after) {
                    if (strtotime($form->not_after) < time()) {
                        $error = new MessageBag([
                            'title'   => '时间错误',
                            'message' => '时间必须晚于当前时间',
                        ]);
                        return back()->with(compact('error'));
                    }
                    if (strtotime($form->not_before) >= strtotime($form->not_after)) {
                        $error = new MessageBag([
                            'title'   => '时间错误',
                            'message' => '生效日期必须早于失效日期',
                        ]);
                        return back()->with(compact('error'));
                    }
                }
            });
        });
    }

    public function store() 
    {
        $data = Input::all();
        $count = (int) $data['count'];

        if ($count <= 0 || $count > 100) {
            $error = new MessageBag([
                    'title'   => '兑换卡张数错误',
                    'message' => '一次只能新建1到100张兑换码',
            ]);
            return back()->with(compact('error'));
        }

        if (!$data['name']) {
            $error = new MessageBag([
                    'title'   => '名字必填',
                    'message' => '请填写名字',
            ]);
            return back()->with(compact('error'));
        }

        if (!$data['name']) {
        
        }

        if (!$data['not_before']) {
            $data['not_before'] = date('Y-m-d H:i:s', time());
        }
        if ($data['not_after']) {
            if (strtotime($data['not_after']) < time()) {
                $error = new MessageBag([
                    'title'   => '时间错误',
                    'message' => '时间必须晚于当前时间',
                 ]);
                return back()->with(compact('error'));
            }
            if (strtotime($data['not_before']) >= strtotime($data['not_after'])) {
                $error = new MessageBag([
                    'title'   => '时间错误',
                    'message' => '生效日期必须早于失效日期',
                ]);
                return back()->with(compact('error'));
            }
        }

        while($count > 0 ) {
            $count--;
            $res = $this->form()->store();
        }

        return redirect('admin/conversion_codes');

    }
}
