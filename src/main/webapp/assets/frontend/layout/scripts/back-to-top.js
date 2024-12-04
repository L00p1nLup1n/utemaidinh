var scrolltotop = {
	setting: { startline: 100, scrollto: 0, scrollduration: 1000, fadeduration: [500, 100] },
	controlHTML: '<img src="<c:url value="/assets/frontend/layout/img/up.png" />" style="width:40px; height:40px" />',
	controlattrs: { offsetx: 10, offsety: 10 },
	anchorkeyword: '#top',
	state: { isvisible: false, shouldvisible: false },

	scrollup: function() {
		this.$body.animate({ scrollTop: 0 }, this.setting.scrollduration);
	},

	keepfixed: function() {
		var $window = jQuery(window);
		var controlx = $window.scrollLeft() + $window.width() - this.$control.width() - this.controlattrs.offsetx;
		var controly = $window.scrollTop() + $window.height() - this.$control.height() - this.controlattrs.offsety;
		this.$control.css({ left: controlx + 'px', top: controly + 'px' });
	},

	togglecontrol: function() {
		var scrolltop = jQuery(window).scrollTop();
		if (!this.cssfixedsupport) this.keepfixed();
		this.state.shouldvisible = (scrolltop >= this.setting.startline);
		if (this.state.shouldvisible && !this.state.isvisible) {
			this.$control.stop().animate({ opacity: 1 }, this.setting.fadeduration[0]);
			this.state.isvisible = true;
		} else if (!this.state.shouldvisible && this.state.isvisible) {
			this.$control.stop().animate({ opacity: 0 }, this.setting.fadeduration[1]);
			this.state.isvisible = false;
		}
	},

	init: function() {
		jQuery(document).ready(function($) {
			var mainobj = scrolltotop;
			mainobj.cssfixedsupport = true; // Simplify to assume modern browsers
			mainobj.$body = $('html, body');
			mainobj.$control = $('<div id="topcontrol">' + mainobj.controlHTML + '</div>')
				.css({ position: 'fixed', bottom: mainobj.controlattrs.offsety, right: mainobj.controlattrs.offsetx, opacity: 0, cursor: 'pointer' })
				.attr({ title: 'Scroll Back to Top' })
				.click(function() {
					mainobj.scrollup();
					return false;
				})
				.appendTo('body');

			$(window).on('scroll resize', function() {
				mainobj.togglecontrol();
			});
		});
	}
};

scrolltotop.init();
