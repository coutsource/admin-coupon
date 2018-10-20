<style>
    .us {
    	display: block;
    	width: 200px;
    	height: 200px;
    	font-family: 'Raleway', sans-serif;
        font-weight: 200;
        text-align: center;
        background-color: rgba(75, 192, 192, 0.2);
        margin: auto;
    }

    .us-count {
    	font-weight: 200;
    	color: white;
    	font-size: 50px;
    	height: 120px;
    	line-height: 120px;
    }

    .us-title {
    	color: 'Raleway', sans-serif;
    	font-size: 20px;
    	height: 80px;
		line-height: 80px;
    }
</style>

<div class="us">
	<div class="us-count">
		{{ $arr['count'] }}
	</div>
	<div class="us-title">
		{{ $arr['title'] }}
	</div>
</div>

