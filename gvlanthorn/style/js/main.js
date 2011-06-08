window.addEvent('domready', function() {

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

