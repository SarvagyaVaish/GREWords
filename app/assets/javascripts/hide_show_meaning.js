
$(document).ready(function(){

	$("#click-to-show-meaning").css({'cursor': 'pointer'})

	$("#click-to-show-meaning").click(function() { 
		$("#hidden-meaning").toggle();
		$("#click-to-show-meaning").toggle();
	});
	
});

