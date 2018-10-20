<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Banner extends Model
{
	protected $fillable = [
		'category_id',
		'title',
		'image',
		'description',
		'href',
		'type'
	];

	public function getCategoryNameAttribute()
    {
        if ($this->attributes['category_id'] == 0) {
            return 'Root';
        } else {
            $category = Category::where('id', $this->attributes['category_id'])->firstOrFail();
            if (empty($category)) {
                return 'Root';
            } else {
                return $category->title;
            }
        }
    }

    public function getImageUrlAttribute()
    {
        // 如果 image 字段本身就已经是完整的 url 就直接返回
        if (Str::startsWith($this->attributes['image'], ['http://', 'https://'])) {
            return $this->attributes['image'];
        }
        return \Storage::disk('public')->url($this->attributes['image']);
    }
}