$(function(){
	if ($('select').length) {
		$('#variants').change(function(){
			$('.price .ch').text( $(this).find('option:selected').attr('prc') );
		});
		/*$('select option').each(function() {
			if ( !$(this).is(':disabled') )
			{
				$(this).attr('selected', true);
				$('#variants').trigger('change');
				return false;
			}
		});*/
		$('select').selectmenu({
			style: 'dropdown'
		});	
	}
	
	var galleries = $('.ad-gallery').adGallery({
		  loader_image: 'loader.gif',
		  thumb_opacity: 0.7,
		  description_wrapper: false,
		  display_back_and_forward: true,
		  width: 400,
		  effect: 'fade',
		  slideshow: {
			enable: false
		  },
		  callbacks: {
				afterImageVisible: function() {
					var src = this.current_image.find('img').attr('src');
					//src = src.replace('th480', 'th640');
					this.current_image.find('img').wrap('<a href="' + src + '" rel="lightbox" />');
					
					$('a[rel="lightbox"]').lightBox();
				}
		 }
		});
});