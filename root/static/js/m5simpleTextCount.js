/**
 * m5simpleTextCount
 *
 * @version      1.0
 * @author       nori (norimania@gmail.com)
 * @copyright    5509 (http://5509.me/)
 * @license      The MIT License
 * @link         http://5509.me/log/m5simpletextcount
 *
 * Date: 2010-12-05 21:20
 */

(function($) {
	
	$.fn.m5simpleTextCount = function(options) {
		var conf = $.extend({
				focusDisplay: false,
				padding: '3px',
				color: '#000',
				atColor: '#f00',
				background: '#eee',
				atBackground: '#eee',
				fontWeight: 'normal',
				atFontWeight: 'bold',
				opacity: .8,
				alertLength: 0,
				maxLength: 10
			}, options);
			
		$(this).each(function() {
			var target = $(this),
				targetOffset = target.offset(),
				border = {
					rightWidth: parseInt(target.css('borderRightWidth')),
					bottomWidth: parseInt(target.css('borderBottomWidth'))
				},
				currentCount = getCount(target),
				count = $('<span class="simpleTextCount"></span>')
					.css({
						padding: conf.padding,
						display: 'block',
						position: 'absolute',
						color: conf.color,
						background: conf.background,
						fontWeight: conf.fontWeight,
						opacity: conf.opacity
					})
					.text(currentCount),
				pos = {};
				
			countStyle(currentCount, count);
			
			$(window).resize(function() {
				setCountPos(count, getPos(target, count), border)
			});
			$('body').append(count);
			setCountPos(count, getPos(target, count), border);
			
			if ( conf.focusDisplay ) {
				count.hide();
				target
					.focus(function() {
						count.stop(true, true).fadeIn(250);
					})
					.blur(function() {
						count.stop(true, true).fadeOut(250);
					});
			}	
			target.keyup(function() {
				var currentCount = getCount(target);
				countStyle(currentCount, count);
				count.text(currentCount);
				setCountPos(count, getPos(target, count), border);
			});
		});
		
		function getCount(target) {
			return conf.maxLength - target.val().length;
		}
		
		function countStyle(currentCount, count) {
			if ( currentCount < (conf.alertLength + 1) ) {
				count.css({
					color: conf.atColor,
					background: conf.atBackground,
					fontWeight: conf.atFontWeight
				});
			} else {
				count.css({
					color: conf.color,
					background: conf.background,
					fontWeight: conf.fontWeight
				});
			}
		}
		
		function getPos(target, count) {
			var targetOffset = target.offset();
			return {
				x: Math.floor(targetOffset.left),
				y: Math.floor(targetOffset.top),
				xdash: target.attr('offsetWidth'),
				ydash: target.attr('offsetHeight'),
				cx: count.attr('offsetWidth'),
				cy: count.attr('offsetHeight')
			}
		}
		
		function setCountPos(count, pos, border) {
			return count.css({
				left: pos.x + pos.xdash - pos.cx - border.rightWidth,
				top: pos.y + pos.ydash - pos.cy - border.bottomWidth
			});
		}
	
	}

})(jQuery);