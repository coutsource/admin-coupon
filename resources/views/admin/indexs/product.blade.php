<style>
    .product {
    	display: block;
    	width: 200px;
    	height: 200px;
    	font-family: 'Raleway', sans-serif;
        font-weight: 200;
        text-align: center;
        background-color: rgba(255, 99, 132, 0.2);
        margin: auto;
    }

    .product-count {
    	font-weight: 200;
    	color: white;
    	font-size: 50px;
    	height: 120px;
    	line-height: 120px;
    }

    .product-title {
    	color: 'Raleway', sans-serif;
    	font-size: 20px;
    	height: 80px;
		line-height: 80px;
    }
</style>

<div class="product">
	<div class="product-count">
		{{ $arr['count'] }}
	</div>
	<div class="product-title">
		{{ $arr['title'] }}
	</div>
</div>

