window.addEvent('domready', function() {

	String.implement({
		unencode: function() {
			return decodeURIComponent(unescape(this));
		},
		encode: function() {
			return escape(encodeURIComponent(this));
		}
	});

/* Handles nav */
// we have to hide the nav, else it obscures the click targets below it
if( $('section_selector') ) {
	$('section_selector').setStyle('display', 'none');
	$('section_select').addEvent('click', function(){
		if( $('section_selector').hasClass('open') ) {
			setTimeout(function() {
				$('section_selector').setStyle('display', 'none');
			}, 500); 
		} else {
			$('section_selector').setStyle('display', '');
		}
		$('section_selector').toggleClass('open');
		return false;
	});	
}
/* Handles input text clearing */

	$$('input.replace-text').each( function(el) {
		var text = el.value;
		el.store( 'default-text', text );
		
		el.addEvents({
			'focus': function(e) {
				this.setStyle( 'color', '#000' );
				if( this.value == this.retrieve( 'default-text' ) ) {
					this.value = '';
				}
			},
			'blur': function(e) {
				this.setStyle( 'color', '#999' );
				if( this.value == '' ) {
					this.value = this.retrieve( 'default-text' );
				}
			}
		});
	});

});