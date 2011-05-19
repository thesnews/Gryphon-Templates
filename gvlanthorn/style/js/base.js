window.addEvent( 'domready', function() {

if( $('front_slider') ) {
	frontSlider = new TSN.UI.SlideBox( $('front_slider'), {
		auto: true,
		orientation: 'horizontal',
		delay: 6000
	} );
}

if( $$('.recently').length ) {
	var currently = false;
	$$('.recently li ol').each( function(el, idx) {
		
		el.set( 'slide', { 'duration': 'short' } );
		el.getPrevious().addEvent( 'click', function(e) {
			if( currently ) {
				currently.slide( 'out' );
			}
			el.slide( 'toggle' );
			currently = el;
		});

		if( idx >= 1 ) {
			el.slide( 'hide' );
		} else {
			currently = el;
		}

	});
}

});