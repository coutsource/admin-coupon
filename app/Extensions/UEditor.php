<?php
namespace App\Extensions;
use Encore\Admin\Form\Field;
class UEditor extends Field
{
        protected static $css = [
                ];
            public static $isJs=false;
            protected static $js = [
                        '/laravel-u-editor/ueditor.config.js',
                                '/laravel-u-editor/ueditor.all.min.js',
                                        '/laravel-u-editor/lang/zh-cn/zh-cn.js',
                                            ];
                protected $view = 'Admin.Tool.UEditor';
                public function render()
                        {
                                    $this->script = <<<EOT
        UE.delEditor('{$this->id}');
             var  ue = UE.getEditor('{$this->id}');
EOT;
                                            return parent::render();
                                        }
}

