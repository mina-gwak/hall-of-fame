$(document).ready(function() {

	var setImageSize;
	var menuDiv;
	var priceDiv;
	
	setImageSize = setInterval(function() { changeImageSize(); }, 10);
	
	function changeImageSize() {
		if ($(".menu-store").length){
			menuDiv = $(".menu-store:first-child").outerWidth();
			$(".menu-store img").css("width", menuDiv * 0.9 + "px");
		};
		if ($(".price-store").length) {
			priceDiv = $(".price-store:first-child").outerWidth();
			$(".price-store img").css("width", priceDiv * 0.9 + "px");
		};
	};
	
	var $tags = $(".tag");
	
	console.log($tags);
	
	$tags.each(function() {
		$(this).click(function() {
			$tags.each(function() {
				$(this).removeClass("selected");
			});
			$(this).addClass("selected");
			
		});
	});
	
});