$(document).ready(function() {

	var setImageSize;
	var menuDiv;
	var priceDiv;
	

	
	var $tags = $(".tag");
	
	$tags.each(function() {
		$(this).click(function() {
			$tags.each(function() {
				$(this).removeClass("selected");
			});
			$(this).addClass("selected");
			
		});
	});
	
});