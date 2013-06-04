$(document).ready(function(){
	$('#btn-add-feature').click(function () {
		$('.new_feature').show("slow");
/*		$.ajax({
			url: "feature_sayHello",
			type: "GET",
			dataType: 'text',
			success: function(data) {
				console.log(data);
			}
		});*/
	});

	$('.feature').find('.list').find('.name').click(function () {
		for (var i=0;i<$('.feature').find('.list').find('.name').length;i++)
		{ 
			//reset the color
			$('.feature').find('.list').find('.name').eq(i).css("background-color","transparent");
		}

		$(this).css("background-color","#bfbdbd");
	});
});



