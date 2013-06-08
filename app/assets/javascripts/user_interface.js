$(document).ready(function(){
	var selectedFeatureId = 'empty';
	var selectedSuiteId = 'empty';

	//add feature
	$('#btn-add-feature').click(function () {
		$('.new_feature').show("slow");
	});

	//handle feature click effect and load related test suites
	$('.feature').find('.list').find('.name').click(function () {
		for (var i=0;i<$('.feature').find('.list').find('.name').length;i++)
		{ 
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
					var suite = '';
					suite += '<div class="row list"><div class="span9 suite-name" id="' + data[i].id + '">' + data[i].name + '</div>';
					suite += '<div class="span1"><a href="/test_suite/' + data[i].id + '/edit"><i class="icon-edit"></i></a></div>';
					suite += '<div class="span1"><a data-confirm="Are you sure?" data-method="delete" href="/test_suite/' + data[i].id + '"><i class="icon-remove"></i></a></div></div>';
					suites.push(suite);
				}

				$('.test-suite').find('.list-placeholder').html(suites);
				ClickSuite();
				//$('.suite-name').click(ClickSuite($(this)));
			}
		});
	});

	var ClickSuite = function() {
		$('.suite-name').click(function() {
			//handle test suite click effect and load related test cases
			for (var i=0;i<$('.suite-name').length;i++)
			{
				$('.suite-name').eq(i).css("background-color","transparent");
			}

			$(this).css("background-color","#bfbdbd");
			selectedSuiteId = $(this).attr('id');

			$.ajax({
				url: "load-test-case",
				type: "GET",
				dataType: 'json',
				data: { 'id' : $(this).attr('id')},
				success: function(data) {
					var cases = [];

					for( var i=0; i<data.length; i++ ){
						var thisCase = '';
						thisCase += '<div class="row list"><div class="span9 name" id="' + data[i].id + '">' + data[i].name + '</div>';
						thisCase += '<div class="span1"><a href="/test_case/' + data[i].id + '/edit"><i class="icon-edit"></i></a></div>';
						thisCase += '<div class="span1"><a data-confirm="Are you sure?" data-method="delete" href="/test_case/' + data[i].id + '"><i class="icon-remove"></i></a></div></div>';
						cases.push(thisCase);
					}

					$('.test-case').find('.list-placeholder').html(cases);
				}
			});
		});
	};

	//add test suite
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