(function($) {
    $.fn.tinycarousel = function(options) {
        var defaults = {
            start: 1,
            display: 1,
            axis: 'x',
            controls: true,
            pager: false,
            interval: false,
            intervaltime: 3000,
            rewind: true,
            animation: true,
            duration: 400,
            callback: null
        };
        var identity = $(this).siblings('h2').find('a').attr('href');
        var options = $.extend(defaults, options);
        var oSlider = $(this);
        var oViewport = $('.viewport:first', oSlider);
        var oContent = $('.overview:first', oSlider);
        var oPages = oContent.children();
        var oBtnNext = $('#banner .buttons.next');
        var oBtnPrev = $('#banner .buttons.prev');
        var oPager = $('.pager:first', oSlider);
        var iPageSize,
        iSteps,
        iCurrent,
        oTimer,
        bPause,
        bForward = true,
        bAxis = options.axis == 'x';
        return this.each(function() {
            initialize();
        });
        function initialize() {
            iPageSize = bAxis ? $(oPages[0]).outerWidth(true) : $(oPages[0]).outerHeight(true);
            var iLeftover = Math.ceil(((bAxis ? oViewport.outerWidth() : oViewport.outerHeight()) / (iPageSize * options.display)) - 1);
            iSteps = Math.max(1, Math.ceil(oPages.length / options.display) - iLeftover);
            iCurrent = Math.min(iSteps, Math.max(1, options.start)) - 2;
            oContent.css(bAxis ? 'width': 'height', (iPageSize * oPages.length));
            move(1,'notrack');
            setEvents();
        }
        function setEvents() {
            if (options.controls && oBtnPrev.length > 0 && oBtnNext.length > 0) {
                oBtnPrev.click(function() {
                    move( - 1);
                    return false;
                });
                oBtnNext.click(function() {
                    move(1);
                    return false;
                });
            }
            if (options.interval) {
                oSlider.hover(function() {
                    clearTimeout(oTimer);
                    bPause = true
                },
                function() {
                    bPause = false;
                    setTimer();
                });
            }
            if (options.pager && oPager.length > 0) {
                $('a', oPager).click(setPager);
            }
        }
        function setButtons() {
            if (options.controls) {
                oBtnPrev.toggleClass('disable', !(iCurrent > 0));
                oBtnNext.toggleClass('disable', !(iCurrent + 1 < iSteps));
            }
            if (options.pager) {
                var oNumbers = $('.pagenum', oPager);
                oNumbers.removeClass('active');
                $(oNumbers[iCurrent]).addClass('active');
            }
        }
        function setPager(oEvent) {
            if ($(this).hasClass('pagenum')) {
                iCurrent = parseInt(this.rel) - 1;
                move(1);
            }
            return false;
        }
        function setTimer() {
            if (options.interval && !bPause) {
                clearTimeout(oTimer);
                oTimer = setTimeout(function() {
                    iCurrent = !options.rewind && (iCurrent + 1 == iSteps) ? -1: iCurrent;
                    bForward = iCurrent + 1 == iSteps ? false: iCurrent == 0 ? true: bForward;
                    move((options.rewind ? (bForward ? 1: -1) : 1));
                },
                options.intervaltime);
            }
        }
        function move(iDirection,notrack) {
        	if (iCurrent + iDirection >= iSteps) {
            	iCurrent = -1;
            }
            else if(iCurrent + iDirection <= -1){
            	iCurrent = iSteps;
            }
            
            iCurrent += iDirection;
            
            var oPosition = {};
            
            oPosition[bAxis ? 'left': 'top'] = -(iCurrent * (iPageSize * options.display));
            oContent.animate(oPosition, {
                queue: false,
                duration: options.animation ? options.duration: 0,
                complete: function() {
                    if (typeof options.callback == 'function') options.callback.call(this, oPages[iCurrent], iCurrent);
                }
            });
            setButtons();
            setTimer();
        }
    };
})(jQuery);

$(function() {
	$('#banner img').load(function() {
		$('#banner').tinycarousel({
			pager: true,
			interval: true,
			rewind: false
		});
	});
});