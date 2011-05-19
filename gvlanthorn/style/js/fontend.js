window.addEvent( 'domready', function() {

/*
	Looks for DIV elements with the class name "accordion" and attempts to turn
	it's children into an accordion widget
	
	In order for this to work properly, anything you want as an accordion 
	widget should be structured thusly:
	
	<div class="accordion">
		<div class="accordion-container">
			<[whatever tag you want]>Header 1<[/whatever tag you want]>
			<[whatever tag you want]>
				content
			<[/whatever tag you want]>
		</div>
		...
		<div class="accordion-container">
			<[whatever tag you want]>Header N<[/whatever tag you want]>
			<[whatever tag you want]>
				content
			<[/whatever tag you want]>
		</div>
	</div>
	
	You can also add a second class to the accordion-container DIVs called
	accordion-highlight to create a subtle highlight behind the open element.
*/
if( $$('.accordion').length ) { $$('.accordion').each( function( container ) {
	
	$(container).getChildren('.accordion-container' ).each( function( el ) {
		var p = el.getLast();
		p.setStyles({
			'padding': 0,
			'margin': 0,
			'margin-bottom': '.5em'
		});
		var slider = new Fx.Slide( p, {
			wrapper: p.parentNode,
			link: 'cancel',
			duration: 'short'
		}).hide();
		var fader = new Fx.Tween( el, 'background-color', {
			link: 'cancel',
			duration: 'short'
		});
		
		el.addEvent( 'mouseover', function(e) {
			slider.slideIn();
			if( this.hasClass( 'accordion-highlight' ) ) {
				fader.start( '#f1f1f1' );
			}
		});
		el.addEvent( 'mouseout', function(e) {
			slider.slideOut();
			if( this.hasClass( 'accordion-highlight' ) ) {
				fader.start( '#fff' );
			}
		});

	});

} ); }


if( $('mail-form') ) { $('mail-form').addEvent( 'submit', function(e) {
	var to = $('mail-to').value.toString();
	var from = $('mail-from').value.toString();

	e.stop();

	var img = new Element( 'img', {
		'src': TSN.path()+'style/images/throbber-blue.gif'
	} );

	$('mail-submit').disabled = true;
	img.injectAfter( $('mail-submit') );
	
	var url = TSN.path()+'index.php/mail';
	
	new Request( {
		url: url,
		data: this.toQueryString(),
		evalScripts: true,
		method: 'post'
	} ).send();
	
	var form = this;
	
	window.xmain = function( data ) {
		var reset = false;
		if( $('mail-status-message' ) ) {
			var div = $('mail-status-message');
			var reset = true;
		} else {
			var div = new Element( 'div', {'id':'mail-status-message'} );
		}
		if( !data.isError ) {
			div.setText( 'Your message was sent!' );
			div.addClass( 'success' );
			$('mail-to').value = '';
			$('mail-from').value = '';
		} else {
			div.setText( 'Oops! There was a problem. '+
				data.message );
			div.addClass( 'error' );
		}

		if( !reset ) {
			div.fade( 'hide' );
			div.injectTop( form );
			div.slide('hide' )
			div.set('slide', {duration: 'short'});
			div.slide( 'in' ).fade( 'in' );
		}
		
		$('mail-submit').disabled = false;
		img.remove();
	}
		
} ); }

if( $('article-mail-form' ) ) {
	$('article-mail-form').slide( 'hide' );
	// inject cancel link
	var link = new Element( 'a', {
		'href':		'#',
		'id':		'article-mail-cancel',
		'styles':	{
			'margin-left':	'1em'
		},
		'events':	{
			'click': function(e) {
				var div = $('article-mail-form');
		
				div.fade( 'out' ).slide( 'out' );
				e.stop();
			}
		}
	} ).setText( 'Cancel' );
	link.injectAfter( $('mail-submit') );

	$('article-tools-mail').addEvent( 'click', function( e ) {
		e.stop();
		var div = $('article-mail-form');

		div.fade( 'hide' );
		div.set('slide', {duration: 'short'});
		div.slide( 'in' ).fade( 'in' );
				
	} );
}

if( $$('.print-window').length ) { $$('.print-window').each( function( el ) {
	el.addEvent( 'click', function( e ) {
		e.stop();
		
		window.print();
	} );
} ); }

}); // end domready