<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OrderLogistic extends Model
{
    protected $fillable = ['logistics_type', 'logistics_number', 'order_id'];
    public $timestamps = false;

    public function order()
    {
        return $this->belongsTo(Order::class);
    }

    public static function getLogisticsOptions() {
    	$directors = [
	        'zhongtong'  => '中通',
	        'yuantong' => '圆通',
	        'shentong' => '申通',
	        'shunfeng'  => '顺丰',
	        'youzheng' => '邮政',
	        'cainiao' => '菜鸟快递'
    	];
    	return $directors;
    }
}
