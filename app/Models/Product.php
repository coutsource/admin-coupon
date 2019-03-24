<?php

namespace App\Models;
use Illuminate\Support\Str;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = [
        'title', 
        'description', 
        'image', 
        'on_sale', 
        'rating', 
        'sold_count', 
        'review_count', 
        'price', 
        'category_id',
        'brand',
        'provider'
    ];


    protected $casts = [
        'on_sale' => 'boolean', // on_sale 是一个布尔类型的字段
    ];

    public function getCategoryNameAttribute()
    {
        if ($this->attributes['category_id'] == 0) {
            return "Root";
        } else {
            $category = Category::where('id', $this->attributes['category_id'])->first();
            if (empty($category)) {
                return "Root";
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
