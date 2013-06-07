$(document).ready(function(){
	var selectedFeatureId = 'empty';

	$('#btn-add-feature').click(function () {
		$('.new_feature').show("slow");
	});

	$('.feature').find('.list').find('.name').click(function () {
		for (var i=0;i<$('.feature').find('.list').find('.name').length;i++)
		{ 
			//reset the color
			$('.feature').find('.list').find('.name').eq(i).css("background-color","transparent");
		}
		$(this).css("background-color","#bfbdbd");
		selectedFeatureId = $(this).attr('id');

		$.ajax({
			url: "load-test-suite",
			type: "GET",
			dataType: 'json',
			data: { 'id' : $(this).attr('id')},
			success: function(data) {
				var suites = [];

				for( var i=0; i<data.length; i++ ){
					suites.push('<div class="row list"><div class="span9 name" id="' + data[i].id + '">' + data[i].name + '</div><div class="span3"><i class="icon-edit"></i><i class="icon-remove"></i></div></div>');
				}

				$('.test-suite').find('.list-placeholder').html(suites);
			}
		});
	});

	//test suites
	$('#btn-add-suite').click(function () {
		if (selectedFeatureId != 'empty') {
			$('.new_test_suite').show("slow");
			$('#test_suite_name').after('<input id="test_suite_feature_id" name="feature_id" type="hidden" value="' + selectedFeatureId + '">');
		}
		else {
			alert('Please select a feature first');
		}
	});
});