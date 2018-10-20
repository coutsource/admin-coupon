<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserConversionCode extends Model
{
	protected $fillable = [
		'user_id',
		'conversion_code_id'
	];
}