<style>
	#myChartPie {
		margin-top: 30px;
	}
</style>

<div class="col-md-6 col-md-offset-3">
	<canvas id="myChartPie"></canvas>
	<input type="hidden" value="{{ $data['user'] }}" name="user" id="indexUser">
	<input type="hidden" value="{{ $data['category'] }}" name="category" id="indexCategory">
	<input type="hidden" value="{{ $data['product'] }}" name="product" id="indexProduct">
</div>


<script>

$(function () {
	var user = document.getElementById("indexUser").value;
	var category = document.getElementById("indexCategory").value;
	var product = document.getElementById("indexProduct").value;

   	var ctx = document.getElementById("myChartPie").getContext('2d');
   	var myChart = new Chart(ctx, {
       	type: 'pie',
       	data: {
           	labels: ["用户数", "类别数", "商品数"],
           	datasets: [{
               	label: '# of Votes',
               	data: [user, category, product],
               	backgroundColor: [
               		'rgba(75, 192, 192, 0.2)',
                   	'rgba(54, 162, 235, 0.2)',
                   	'rgba(255, 99, 132, 0.2)',
               	],
               	borderColor: [
               		'rgba(75, 192, 192, 1)',
                   	'rgba(54, 162, 235, 1)',
                   	'rgba(255,99,132,1)',
               	],
               	borderWidth: 1,
               	hoverBackgroundColor: [
               		'rgba(75, 192, 192, 0.4)',
                   	'rgba(54, 162, 235, 0.4)',
                   	'rgba(255, 99, 132, 0.4)',
               	]
           	}]
       	},
       	options: {
           	cutoutPercentage: 0
       	}
   }); 
});
</script>