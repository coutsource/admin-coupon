<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class ConversionCode extends Model
{
	protected $fillable = [
		'name',
		'code',
		'passwd',
		'actived',
		'used',
		'not_before',
		'not_after',
	];

	protected $casts = [
		'actived' => 'boolean',
		'used' => 'boolean'
	];

	// 指明这两个字段是日期类型
    protected $dates = ['not_before', 'not_after'];


    public static function findAvailableCode($length = 8)
    {
        do {
            // 生成一个指定长度的随机字符串，并转成大写
            $code = strtoupper(Str::random($length));
        // 如果生成的码已存在就继续循环
        } while (self::query()->where('code', $code)->exists());

        return $code;
    }

    public static function createConversionCode()
    {
    	$time = date('YmdHis', time());
    	$num = mt_rand(100, 999);
    	return substr($time, 2) . $num;
    }
    
}