<style>
    .cate {
    	display: block;
    	width: 200px;
    	height: 200px;
    	font-family: 'Raleway', sans-serif;
        font-weight: 200;
        text-align: center;
        background-color: rgba(54, 162, 235, 0.2);
        margin: auto;
    }

    .cate-count {
    	font-weight: 200;
    	color: white;
    	font-size: 50px;
    	height: 120px;
    	line-height: 120px;
    }

    .cate-title {
    	color: 'Raleway', sans-serif;
    	font-size: 20px;
    	height: 80px;
		line-height: 80px;
    }
</style>

<div class="cate">
	<div class="cate-count">
		{{ $arr['count'] }}
	</div>
	<div class="cate-title">
		{{ $arr['title'] }}
	</div>
</div>

