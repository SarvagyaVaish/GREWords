
$(document).ready(function(){

	$("a.message-x").click(function() { 
		console.log(this.id);
		var row_selector = ".message-row#" + this.id;
		$(row_selector).toggle();
	});
	
});

