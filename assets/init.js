$(function() {
	$('.nav > ul > li').hover(
		function() {
			/*if (!$(this).hasClass('active')) {
				$(this).addClass('animated active');
			}
			else {
				$(this).addClass('active');
			}*/
			
			if ($(this).children('ul').length) {
				$(this).children('ul').stop(true, true).slideDown('fast');
			}
		},
		function() {
			if ($(this).children('ul').length) {
				$(this).children('ul').stop(true, true).slideUp('fast', function() {
					if ($(this).hasClass('animated')) {
				//		$(this).parents('li').removeClass('active');
					}
				});
			}
			
			if ($(this).hasClass('animated')) {
			//	$(this).removeClass('active');
			}
		}
	);
	
});