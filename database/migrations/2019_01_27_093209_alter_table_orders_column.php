<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterTableOrdersColumn extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->string('buyer_name', 50)->default('');
            $table->string('buyer_phone', 50)->default('');
            $table->string('conversion_code', 50)->default('');
            $table->unsignedInteger('conversion_code_id')->default(0);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->dropColumn(['buyer_name', 'buyer_phone', 'conversion_code', 'conversion_code_id']);
        });
    }
}
