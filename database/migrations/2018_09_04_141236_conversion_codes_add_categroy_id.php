<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class ConversionCodesAddCategroyId extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('conversion_codes', function (Blueprint $table) {
            $table->unsignedInteger('category_id')->default(0)->after('not_after');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('conversion_codes', function (Blueprint $table) {
            $table->dropColumn('category_id');
        });
    }
}
