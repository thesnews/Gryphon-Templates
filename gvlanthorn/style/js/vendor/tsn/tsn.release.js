/*
Script: Base.js
	Rosewood

License:
	New BSD license.

Copyright:
	copyright (c) 2007-2008 The State News
	
Authors:
	- Mike Joseph <josephm5@msu.edu>
*/

var TSN = {
	version: '1.3',
	
	
	/*
	Method: path
	
	Returns:
		(string) base web path sans front controller (PHP/Foundry specific)
	*/
	path: function() {
		var loc = window.location.toString();
		if( loc.indexOf( 'index.php' ) != -1 ) {
			loc = loc.substr( 0, loc.indexOf( 'index.php' ) );
		}
		
		return loc;
	}
};

var TSNBlank = function() {};
/*
Script: Element.js
	Contains prototypes element extended methods

License:
	New BSD license.
*/

$E = function( el ) {
	return new Element( el, arguments[1] );
};

/*
Class: Element
	Extends Mootools base Element class.
*/
Element.implement({

	/*
	Method: innerDimensions
		Get the inner width and height and the top and left offsets with
		padding and margin modifiers removed

	Returns:
		an object containing the height, width, top, and left offsets

	*/
	innerDimensions: function() {

	
		var size = this.getSize();
		var pos = this.getPosition();
		
		var styles = this.getStyles( 'margin', 'padding' );

		var base = {
			height:		(size.y - styles.padding.toInt() * 2),
			width:		(size.x - styles.padding.toInt() * 2),
			top:		(pos.y - styles.margin.toInt()),
			left:		(pos.x - styles.margin.toInt())
		};
		
		return base;
			
	},
	
	/*
	Method: makePositioned
		Makes element absolutely positioned.
	See:
		Element.makeStatic();
	*/
	makePositioned: function() {
		var placeHolder = new Element( 'div' );
		var size = this.getSize();
		var margin = this.getStyle( 'margin' ).toInt();
		placeHolder.setStyles({
			'width': size.x + (margin*2),
			'height': size.y + (margin*2)
		});
		
		placeHolder.wraps( this );
		this.setStyle( 'position', 'absolute' );

		
	},
	
	/*
	Method: makeStatic
		Makes element position static.
	See:
		Element.makePositioned();
	*/
	makeStatic: function() {
		this.setStyle( 'position', 'static' );
		
		var parent = this.parentNode;
		this.injectAfter( parent );
		parent.dispose();
	},
	
	/*
	Method: hide
		Hide element. Preferable to 'display:none;'
	See:
		Element.show();
	*/
	hide: function() {
		var container = new Element( 'div' ).store( 'hide-container', true );
		
		container.setStyle( 'overflow', 'hidden' );
		container.setStyle( 'height', 0 );
		container.setStyle( 'position', 'absolute' );
		
		container.injectBefore( this );
		container.adopt( this );
		
		return container;
	},
	
	/*
	Method: show
		Show a hidden element
		
	See:
		Element.hide();
	*/
	show: function() {
		var temp = this.parentNode.getChildren();
		var oldParent = this.parentNode;
		
		temp[0].injectBefore( this.parentNode );
		oldParent.dispose();
	},
	
	/*
	Method: toggle
		Toggle element's visibility.

	See:
		Element.hide();
		Element.show();
	*/
	toggle: function() {
		if( this.parentNode.retrieve( 'hide-container' ) ) {
			this.show();
		} else {
			this.hide();
		}
	},

	fadeAndRemove: function() {
		var el = this;
		new Fx.Tween( this, { duration:200, property: 'opacity',
				onComplete: function() {
					el.dispose();
				} 
		} ).start( 0 );
	}


});
if( !TSN.UI ) { TSN.UI = {} }

/*
Script: SlideBox.js
	Contains prototype for SlideBox UI widget

License:
	New BSD license.
*/

/*
Class: TSN.UI.HudBox
	SlideBoxes allow you to create manual or automatic scrolling boxes
	with any children elements you want. They can scroll horizontally or
	vertically

Arguments:
	element - (object,string) the slidebox container
	can be the object's ID or a DOM element
	options - optional, see below
	
Options:
	duration - (int) the duration for the slide transition. Default 300.
	delay - (int) this timer delay before moving to the next slide, if using 
	auto-scrolling. Default 6000.
	repeat - (bool) if true and and you're using auto-scrolling, scroll will
	restart once it reaches the last child. Default true.
	auto - (bool) if true box will automatically scroll to the next slide
	every number of microseconds, as defined by "delay". Default false.
	orientation - (string) the scroll direction. Default 'horizontal'.
	slideModifier - (int) the number of slide elements to skip for every 
	iteration. Default 1.
	size - (object) you can override the scrollbox's default size by setting
	this object's 'x' and 'y' values.

Events:
	onStart - called when slider starts in auto-scrolling mode.
	onSlide - called when slidebox moves to the next slide position.

	
Example:
	(begin code)
	<!-- A horizontally scrolling video box, will appropriate controls -->
		<h4>
			Multimedia
			<span>
				<img id="mmbox-prev" src="images/resultset_previous.png" />
				<img class="mmbox-frame" src="images/bullet_blue.png" />
				<img class="mmbox-frame" src="images/bullet_black.png" />
				<img class="mmbox-frame" src="images/bullet_black.png" />
				<img id="mmbox-next" src="images/resultset_next.png" />
			</span>
		</h4>
		<div id="multimedia-box">
			<a href="path/to/mm"><img src="/path/to/prevew" /> Title 1</a>
			<a href="path/to/mm"><img src="/path/to/prevew" /> Title 2</a>
			<a href="path/to/mm"><img src="/path/to/prevew" /> Title 3</a>
			<a href="path/to/mm"><img src="/path/to/prevew" /> Title 4</a>
			<a href="path/to/mm"><img src="/path/to/prevew" /> Title 5</a>
			<a href="path/to/mm"><img src="/path/to/prevew" /> Title 6</a>
		</div>
		
		var bullets = $('multimedia-box-controls').getChildren( '.mmbox-frame' );
		
		bullets.each( function( el, index ) {
			el.addEvent( 'click', function( e ) {
				mmbox.to( this.retrieve( 'index' ) );
			} );
			// we want the bullets to move forward 3 items at a time
			el.store( 'index', index * 3 );
		} );
			
		var mmbox = new TSN.UI.SlideBox( $('multimedia-box'), {
			slideModifier: 3,
			onSlide: function( el, index ) {
				var index = Math.floor( index / 3 );
				bullets.each( function(blt) {
					blt.setProperty( 'src', 'images/bullet_black.png' );
				});
				bullets[index].src = 'images/bullet_blue.png';
		
			}
		});
		
		$('mmbox-next').addEvent( 'click', function(e) {
			mmbox.next();
		});
		$('mmbox-prev').addEvent( 'click', function(e) {
			mmbox.previous();
		});
		
	<!-- Create a vertically scrolling billboard -->
	<div id="billboard">
		<a href="#"><img src="images/featured-1.png" /></a>
		<a href="#"><img src="images/featured-2.png" /></a>
		<a href="#"><img src="images/featured-3.png" /></a>
	</div>

	var bb = new TSN.UI.SlideBox( $('billboard'), {
		auto: true,
		orientation: 'vertical',
		size: { y: 120 },
		delay: 6000
	} );
	
	(end)
*/
TSN.UI.SlideBox = new Class({

	options: {
		'onLoad': TSNBlank,
		'onLoadComplete': TSNBlank,
		'onStart': TSNBlank,
		'onSlide': TSNBlank,
		'duration': 300,
		'delay': 6000,
		'repeat': true,
		'auto': false,
		'orientation': 'horizontal',
		'slideModifier': 1,
		'size': {
			x: false,
			y: false
		}
	},
	
	scroller: false,
	timer: false,
	outerContainer: false,
	innerContainer: false,
	
	children: false,
	
	index: 0,
	
	running: false,
	
	totalChildren: 0,
	totalLoaded: 0,
	
	loadTimer: false,
	
	initialize: function( el ) {
		if( arguments[1] ) {
			this.options = $H( arguments[1] ).combine( this.options );
		}

		var obj = this;

		this.outerContainer = $(el);
		
		this.children = this.outerContainer.getChildren();

		this.totalChildren = this.children.length;
		this.totalLoaded = 0;
		
		this.loadTimer = this.checkLoad.periodical( 500, this );
		
		this.children.each( function(el) {
			var img = el;
			if( !img.get( 'src' ) ) {
				var img = el.getFirst();
			}
			if( !img.get( 'src' ) ) {
				obj.totalLoaded++;
				return;
			}
			
			new Asset.image( img.get( 'src' ) );
			obj.totalLoaded++;
			
		});
	},
	
	load: function() {
		var dimensions = this.outerContainer.getSize();
		if( !this.options.size.x ) {
			this.options.size.x = dimensions.x;
		}
		if( !this.options.size.y ) {
			this.options.size.y = dimensions.y;
		}
		
		this.innerContainer = new Element( 'div' );
		switch( this.options.orientation ) {
			case 'vertical':
				this.innerContainer.setStyle( 'height', '10000px' );
				this.outerContainer.setStyles({
					'overflow':		'hidden',
					'height':		this.options.size.y
				});
				break;
			case 'horizontal':
			default:
				this.outerContainer.setStyles({
					'overflow':		'hidden',
					'width':		this.options.size.x,
					'z-index':		10
				});
				this.innerContainer.setStyle( 'width', '10000px' );
				this.innerContainer.setStyle( 'z-index', 1 );
		};

		this.scroller = new Fx.Scroll( this.outerContainer, {
			transition: Fx.Transitions.Quad.easeInOut,
			duration: this.options.duration
		});
		
		this.outerContainer.grab( this.innerContainer );
		this.innerContainer.adopt( this.children );
		
		if( this.options.auto ) {
			this.index = 1;
			this.start();
		}

	},
	
	checkLoad: function() {
		if( this.totalLoaded >= this.totalChildren ) {
			$clear( this.loadTimer );
			this.load();
		}
	},
	
	/*
	Method: start
		Start the automatic scrolling. Will be called automatically if the
		'auto' option is set to true.
	*/
	start: function() {
		this.running = true;
		this.options.onStart();
		var periodicScroll = function() {
			if( this.index >= this.children.length && 
				this.children.length > 0 ) {
				
				if( !this.options.repeat ) {
					return this.stop();
				}
				this.index = -1;
//				console.log( 'repeat' );
			}
		
			this.scroll( this.index );
			this.index+=this.options.slideModifier;
		};
		
		this.timer = periodicScroll.periodical( this.options.delay, this );
	
	},
	
	/*
	Method: stop
		Stop the automatic scrolling. Will be preserve the current index so
		you can call 'start' to start again from the same slide.
	*/
	stop: function() {
		this.running = false;
		if( !this.timer ) {
			return false;
		}
	 	$clear( this.timer );
	
	},
	
	/*
	Method: next
		Manually move to the next slide.
	*/
	next: function() {
		this.scroll( this.index + this.options.slideModifier );
	},
	
	/*
	Method: previous
		Manually move to the previous side
	*/
	previous: function() {
		this.scroll( this.index - this.options.slideModifier );
	},
	
	/*
	Method: to
		Manually move to a particular slide index.
	
	Arguments:
		index - (int) the slide index
	*/
	to: function( index ) {
		this.scroll( index );
	},
	
	scroll: function( index ) {
		if( index >= this.children.length ) {
			index = this.children.length - 1;
		}
		if( index < 0 ) {
			index = 0;
		}
		
		if( this.children[index] ) {
			this.scroller.toElement( this.children[index] );
			this.index = index;
			
			this.options.onSlide( this.children[index], index );
			
			return true;
		}
		
		return false;
	}


});if( !TSN.UI ) { TSN.UI = {} }

/*
Script: HudBox.js
	Contains prototypes for MacOS X style HUD window boxes

License:
	New BSD license.
*/

/*
Class: TSN.UI.HudBox
	HUD boxes work by layering an appropriately sized transparent box *behind*
	the text box, thereby allowing the box to be transparent, but the text
	retains full opacity. Since the background box is not in the same element
	as the text, if you add or remove elemnts from the text box via the DOM,
	you must call reload() to resize the background box.

Arguments:
	element - (object,string) the text box element to turn into a HUD box
	can be the object's ID or a DOM element
	options - optional, see below
	
Options:
	boxClass - (string) default class for the background box. If omitted the
	default box style is used
	dragHandle - (object,string) the element, when click+dragged will move
	the HUD box around. If you don't have a dragHandle, you won't be able
	to drag the HUD box around.
	closer - (object,string) the element, when clicked, will cause the box
	to fade out and close. Can be an ID or DOM element
	positionOnCursor - (bool) if true, HUD box will always open under the
	mouse cursor. default true
	
Example:
	(begin code)
		hud = new TSN.UI.HudBox( 'hud', {
			closer: $('closer')
		});

		<div id="hud">
			<div class="header">Header <img src="./delete.png" id="closer" /></div>
			<div class="text">
				<h2>Testing</h2>
				
				<p>
					Testing this HUD box.
				</p>
				
				<hr />
				<select>
					<option>I'm a control</option>
				</select>
				<p>
					The quick brown fox jumped over the lazy dogs!
				</p>
			</div>
		</div>
	(end)
*/
TSN.UI.HudBox = new Class({

	options: {
		boxStyle: {
			'background-color': '#333',
			'opacity':			.75
		},
		textStyle: {
		
		},
		boxClass: false,
		closer: false,
		dragHandle: false,
		positionOnCursor: true
	},

	textContainer: false,
	
	onMouseDown: false,

	boxDrag: false,

	initialize: function( element ) {
		this.textContainer = $(element);
		$extend( this.textContainer, TSN.UI.HudBoxText );
	
		if( arguments[1] ) {
			this.options = $H( arguments[1] ).combine( this.options );
		}
		
		this.textContainer.options = this.options;
		this.textContainer.reload();
		
		this.onMouseDown = this.mouseDown.bind( this );
		this.onMouseUp = this.mouseUp.bind( this );
		
		if( this.options.dragHandle ) {
			$(this.options.dragHandle).addEvent(
				'mousedown', this.onMouseDown );
			$(this.options.dragHandle).addEvent(
				'mouseup', this.onMouseUp );
			$(this.options.dragHandle).setStyle( 'cursor', 'move' );
		}
		
		if( this.options.closer ) {
			var obj = this;
			$(this.options.closer).addEvent( 'click', function(e) {
				obj.fade();
			});
		}
		
	},
	
	mouseDown: function(e) {
		this.boxDrag = new Drag( this.textContainer,{
			onDrag: this.textContainer.onHUDDrag
		});
	},
	
	mouseUp: function(e) {
		this.boxDrag.detach();
	},
	
	/*
	Method: hide
		Immediately hide the HUD box and background.
		
	Arguments:
		event - (event) the optional event called
	
	Returns:
		HUD Box object
	
	Example:
		>$('box').hide()
		>hud = new TSN.UI.HudBox( 'hud' ).hide();
	*/
	hide: function() {
		this.textContainer.hudHide(arguments[0]);
		return this;
	},
	
	/*
	Method: show
		Immediately show the HUD box and background.
		
	Arguments:
		event - (event) the optional event called
	
	Returns:
		HUD Box object
	
	Example:
		>$('box').show()
		>hud = new TSN.UI.HudBox( 'hud' ).show();
	*/
	show: function(e) {
		this.textContainer.hudShow(arguments[0]);	
		return this;
	},
	
	/*
	Method: appear
		Fade the HUD box and background in.
		
	Arguments:
		event - (event) the optional event called
	
	Returns:
		HUD Box object
	
	Example:
		>$('box').appear()
		>hud = new TSN.UI.HudBox( 'hud' ).hide().appear();
	*/
	appear: function(e) {
		this.textContainer.hudAppear(arguments[0]);
		return this;
	},
	
	/*
	Method: fade
		Fade the HUD box and background out.
		
	Arguments:
		event - (event) the optional event called
	
	Returns:
		HUD Box object
	
	Example:
		>$('box').fade()
		>hud = new TSN.UI.HudBox( 'hud' ).fade();
	*/
	fade: function(e) {
		this.textContainer.hudFade(arguments[0]);
		return this;
	},

	/*
	Method: reload
		Resize HUD background to the text box's current size and position.
		Because the HUD box uses to elements positioned one over the other,
		reload should be called when a element is added or removed from the
		HUD box via the DOM in order to keep the background in proportion with
		the text box.
		
	Example:
		(begin code)
			hud = new TSN.UI.HudBox( 'hud' );
			hud.adopt( new Element( 'p' ).set( 'text', 'Hello World!' ) );
			hud.reload();
		(end)
	*/
	reload: function() {
		this.textContainer.reload();
	}

});

/*
Class: TSN.UI.HudBoxText
	Extensions for DOM elements assigned as HUD text boxes
	The TSN.UI.HudBox will automatically assign and extend elements.

*/
TSN.UI.HudBoxText = {

	options: {},

	hudBox: false,
	onHUDDrag: false,
	
	boxOpacity: .5,
	
	hudTweener: false,
	textTweener: false,
	
	reload: function() {
		this.onHUDDrag = this.hudDrag.bind( this );

		if( this.hudBox ) {
			this.hudBox.dispose();
		}
		
		this.hudBox = new Element( 'div' );
		if( this.options.boxClass !== false ) {
			this.hudBox.addClass( this.options.boxClass );
		} else {
			this.hudBox.setStyles( this.options.boxStyle );
		}
		
		var textSize = this.getSize();
		var textPos = this.getPosition();
		
		this.hudBox.setStyles({
			'position':		'absolute',
			'top':			textPos.y,
			'left':			textPos.x,
			'width':		textSize.x,
			'height':		textSize.y
		});
		
		this.hudBox.injectBefore( this );
		
		this.hudTweener = new Fx.Tween( this.hudBox, { property: 'opacity',
			duration:250,transition:Fx.Transitions.Cubic.easeInOut
		});
		this.textTweener = new Fx.Tween( this, { property: 'opacity',
			duration:250,transition:Fx.Transitions.Cubic.easeInOut
		});
	
		this.setStyle( 'z-index', 10 );
		this.hudBox.setStyle( 'z-index', 9 );
	},
	
	hudDrag: function( e ) {
		var textPos = this.getPosition();
		
		this.hudBox.setStyles({
			'top':			textPos.y,
			'left':			textPos.x
		});
	},

	hudHide: function( e ) {
		this.setStyle( 'opacity', 0 );
		this.boxOpacity = this.hudBox.getStyle( 'opacity' );
		this.hudBox.setStyle( 'opacity', 0 );
	},
	
	hudShow: function( e ) {
		this.setStyle( 'opacity', 1 );
		this.hudBox.setStyle( 'opacity', this.boxOpacity );
	},
	
	hudAppear: function( e ) {
		this.hudTweener.start( this.boxOpacity );
		this.textTweener.start( 1 );
		if( e && this.options.positionOnCursor ) {
			var e = new Event(e);
			
			this.setStyles({
				'top':			e.page.y,
				'left':			e.page.x
			});
			this.hudDrag();
		}

	},
	
	hudFade: function( e ) {
		this.boxOpacity = this.hudBox.getStyle( 'opacity' );

		this.hudTweener.start( 0 );
		this.textTweener.start( 0 );
	}


};if( !TSN.UI ) { TSN.UI = {} }
/*
Script: Token.js
	Contains prototypes token widget

License:
	New BSD license.
*/

/*
Class: TSN.UI.Token
	Create and manage Mac OS X-like token strings.
	
Arguments:
	container - (object,string) the container element for all the token strings.
	can be id or DOM object
	tokenInput - (object,string) the form element used to create new token
	strings. can be id or DOM object.
	
Options:
	tokenClass - (string) default class name for new tokens. default 'token'
	selectedClass - (string) default class name for selected tokens. default
	'selected'
	
Events:
	onBeforeCreate - accepts new token value as an argument. Can return bool
	false to cancel creation or a new value for the token
	onBeforeRemove - accepts token object, can return bool false to cancel
	token removal
	onRemove - accepts token object as argument, fired right before token object
	is removed from the DOM tree
	onCreate - accepts new token object as argument, fired after new token has
	been created
	onSelect - accepts new token object as argument, fired after token has been
	clicked
	
Example:
	(begin code)
		new TSN.UI.Token( 'container', 'new-token' );

		<div id="container">
			<div class="token"><a href="#">Token</a></div>
			<input type="text" id="new-token" />
			<br style="clear:left;" />
		</div>
		
		// use XHR to create new token value on server and inject it
		tokener = new TSN.UI.Token( 'container', 'new-token', {
			onBeforeCreate: function( val ) {
				new Ajax(url,{data:'val='+val,evalScripts:true}).request();
				return false;
			}
		}
		
		myReturnFunc( val ) {
			tokener.newToken( val );
		}
	(end)
*/
TSN.UI.Token = new Class({

	container: false,
	tokenInput: false,
	
	tokenStack: false,
	
	options: {
		tokenClass: 'token',
		selectedClass: 'selected',
		onBeforeCreate: TSNBlank,
		onCreate: TSNBlank,
		onBeforeRemove: TSNBlank,
		onRemove: TSNBlank,
		onSelect: TSNBlank
	},

	
	initialize: function( container, tokenInput ) {
		if( arguments[2] ) {
			this.options = $H( arguments[2] ).combine( this.options );
		}

		this.container = $(container);
		this.tokenInput = $(tokenInput);

		this.tokenStack = $$('.token');
		var obj = this;
		this.tokenStack.each( function( element ) {
			element.addEvent( 'click', function(e) {
				obj.onClick( element );
				e.stop();
			});
		});

		window.addEvents({
			'keypress': function(e) {
				var e = new Event(e);
				if( e.key == 'backspace' || e.key == 'delete' ) {
					obj.tokenStack.each( function( element ) {
						if( element.hasClass( obj.options.selectedClass ) &&
							obj.options.onBeforeRemove( element ) !== false ) {
							e.stop();
							obj.options.onRemove( element );							element.dispose();
						}
					});
				}
			},
			'mousedown': function(e) {
				obj.tokenStack.removeClass( obj.options.selectedClass );
			}
		});

		this.container.addEvent( 'click', function(e) {
			obj.tokenInput.focus();
		});

		this.tokenInput.addEvent( 'keypress', function(e) {
			var e = new Event(e);
			if( e.key == 'enter' ) {
				var element = e.target;
				var value = element.value;
				var newVal = false;
				if( ( newVal = obj.options.onBeforeCreate( value ) ) ===
					false ) {
					return false;	
				}
				
				if( newVal ) {
					value = newVal;
				}

				obj.newToken(value);
				e.stop();
			}
		});
	},
	
	onClick: function( element ) {
		this.tokenStack.removeClass( this.options.selectedClass );
		element.addClass( this.options.selectedClass );
		this.options.onSelect( element );
	},
	
	/*
	Method: newToken
		creates and returns a new token object. note that this method bypasses
		the onBeforeCreate event.
		
	Arguments:
		value - (string) new token value
	*/
	newToken: function( value ) {
		var obj = this;
		var div = new Element( 'div', { 'class': this.options.tokenClass }
		).adopt(
			new Element( 'a', {'href':'#'} ).set( 'text',  value )
		).addEvent( 'click', function(e) {
			obj.onClick( div );
			e.stop();
		});
		div.injectBefore( this.tokenInput );
		this.tokenInput.value = '';
		
		this.tokenStack.push( div );
		
		this.options.onCreate( div );
		
		return div;
	}

});
if( !TSN.UI ) { TSN.UI = {} }

/*
Script: StatusIndicator.js
	Contains prototypes barber-pole status indicators

License:
	New BSD license.
*/

/*
Class: TSN.UI.StatusIndicator
	Create and manage barber-pole status indicators

Arguments:
	element - container element for status indicator, not the indicator itself
	options - optional, see below

Options:
	indeterminate - (string,object) the image for the indeterminate mode
	determinateFull - (string,object) the image for the 100% full determinate
	mode
	determinateEmpty - (string,object) the image for the 0% full determinate
	mode
	
Events:
	onReady - fired when all images are loaded and
	statusIndicator is ready
	onFull - fired when statusIndicator is in determinate
	mode and full
	onEmpty - fired when statusIndicator is in determinate
	mode and empty

Example:
	(begin code)
		indicator = new TSN.UI.StatusIndicator( 'indicator-container', {
			indeterminate: './status/barber_pole_ind.gif',
			determinateFull: './status/barber_pole_det_full.gif',
			determinateEmpty: './status/barber_pole_det_empty.gif',
			onReady: function() {
				indicator.setValue( .5 );
			}
		});

		<div id="indicator-container">
		</div>
	(end)
*/
TSN.UI.StatusIndicator = new Class({

	container: false,
	
	fill: false,
	fillMorph: false,
	
	options: {
		indeterminate: false,
		determinateFull: false,
		determinateEmpty: false,
		onReady: TSNBlank,
		onFull: TSNBlank,
		onEmpty: TSNBlank
	},
	
	loaded: 0,
	
	ready: false,
	
	mode: false,
	value: 0,
	
	initialize: function( el ) {

		this.container = $(el);

		if( arguments[1] ) {
			this.options = $H( arguments[1] ).combine( this.options );
		}
	
		if( this.container.getStyle( 'position' ) == 'static' ) {
			this.container.setStyle( 'position', 'relative' );
		}
	
		var tmp = this;
	
		if( typeof this.options.indeterminate == 'string' ) {
			var ind = new Image;
			ind.onload = function() {
				tmp.loaded++;
				tmp.ready();
			};
			ind.src = this.options.indeterminate;
			this.options.indeterminate = ind;
		} else if( typeof this.options.indeterminate == 'object' ) {
			this.loaded++;
		}
		if( typeof this.options.determinateFull == 'string' ) {
			var ind = new Image;
			ind.onload = function() {
				tmp.loaded++;
				tmp.ready();
			};
			ind.src = this.options.determinateFull;
			this.options.determinateFull = ind;
		} else if( typeof this.options.determinateFull == 'object' ) {
			this.loaded++;
		}
		if( typeof this.options.determinateEmpty == 'string' ) {
			var ind = new Image;
			ind.onload = function() {
				tmp.loaded++;
				tmp.ready();
			};
			ind.src = this.options.determinateEmpty;
			this.options.determinateEmpty = ind;
		} else if( typeof this.options.determinateEmpty == 'object' ) {
			this.loaded++;
		}
		
	},
	
	ready: function() {
		if( this.loaded == 3 ) {
			this.ready = true;
			this.setMode();
			this.options.onReady();
		}
	},
	
	/*
	Method: setMode
		Switches between determinate and indeterminate mode.
		
	Arguments:
		mode - determinate or indeterminate
	*/
	setMode: function() {
		switch( arguments[0] ) {
			case 'determinate':
				this.container.setStyles({
					'height': this.options.determinateEmpty.height,
					'width': this.options.determinateEmpty.width,
					'background': 'url('+this.options.determinateEmpty.src+')'
				});
				if( !this.fill ) {
					this.setValue(0);
				}
				this.showFill();
				this.mode = 'determinate';
				break;
			case 'indeterminate':
			default:
				this.container.setStyles({
					'height': this.options.indeterminate.height,
					'width': this.options.indeterminate.width,
					'background': 'url('+this.options.indeterminate.src+')'
				});
				this.hideFill();
				this.mode = 'indeterminate';
				break;
		}
	},

	/*
	Method: getMode
		Returns the current mode
	
	Returns:
		(string) current mode
	*/
	getMode: function() {
		return this.mode;
	},

	/*
	Method: setValue
		In determinate mode, sets the value of the status indicator
		from 0 to 1
		
	Arguments:
		val - (int) value of the indicator. 0 = empty, 1 = full
	*/
	setValue: function( val ) {
		if( val < 0 || val > 1 ) {
			return;
		}
		
		if( !this.fill ) {
			this.fill = new Element( 'div' );
			var size = this.container.getSize();
			this.fill.setStyles({
				'height': size.y,
				'width': 0,
				'top': 0,
				'left': 0,
				'position': 'absolute',
				'overflow': 'hidden',
				'background': 'url('+this.options.determinateFull.src+')'
			});
			
			this.container.adopt( this.fill );
			
			this.fillMorph = new Fx.Morph( this.fill, {
				link: 'chain',
				duration: 100,
				transition: Fx.Transitions.Cubic.easeInOut
			});
		}

		if( !size ) {
			size = this.container.getSize();
		}

		this.value = val;
		
		width = Math.ceil( size.x * val );
		
//		this.fill.setStyle( 'width', width );
		this.fillMorph.start({'width':width});
		
		if( val == 0 ) {
			this.options.onEmpty();
		} else if( val == 1 ) {
			this.options.onFull();
		}
		
	},
	
	/*
	Method: getValue
		Get and return current value.
		
	Returns:
		(int) 0 = empty, 1 = full
	*/
	getValue: function() {
		return this.value;
	},
	
	hideFill: function() {
		if( this.fill ) {
			this.fillMorph.start({'opacity':0});
		}
	},
	
	showFill: function() {
		if( this.fill ) {
			this.fillMorph.start({'opacity':1});
		}
	}

});if( !TSN.UI ) { TSN.UI = {} }
/*
Script: DragSelect.js
	Contains prototypes for drag-n-drop/multiple select widgets

License:
	New BSD license.
*/

/*
Class: TSN.UI.DragSelect
	Creates rubberband multiple select boxes, then allows selections
	to be dragged and dropped on a container element.

Arguments:
	element - element to apply sizing effects to, can be either element ID
	or object
	options - optional, see below
	
Options:
	childClass - the class name for the selection items. default 'item'
	droppables - array of droppable targets

Events:
	onItemSelect - fired when individual item is selected
	buy rubberband selection box. accepts selected element as a parameter
	onItemUnelect - fired when individual item is de-selected
	buy rubberband selection box. accepts selected element as a parameter
	onDrop - fired when elements are dropped, accepts element and droppable
	onEnter - fired when dragbox enters droppable
	onLeafe - fired when dragbox leaves droppable

Example:
	(begin code)
		new TSN.UI.DragSelect( 'item-container', {
			droppables: [$('drop1'),$('drop2')]
		} );

		<div id="drop1" class="droppable">
			Drop on me!
		</div>
		<div id="drop2" class="droppable">
			Or on me!
		</div>
		
		<br style="clear:both" />
		
		<div id="item-container">
			
			<div class="item">
				Item One
			</div>
		
			<div class="item">
				Item Two
			</div>
		
			<div class="item">
				Item Three
			</div>
		
			<div class="item">
				Item Four
			</div>
		
			<div class="item">
				Item Five
			</div>
		
			<div class="item">
				Item Six
			</div>
		</div>
	(end)
*/

TSN.UI.DragSelect = new Class({

	container: false,
	
	didDrag: false,
	inDrag: false,
	
	haltDrag: false,
	
	boundDragEvent: false,
	startDragEvent: false,
	endDragEvent: false,
	
	boundGroupDragEvent: false,
	startGroupDragEvent: false,
	endGroupDragEvent: false,
	
	dragBox: false,
	groupDragBox: false,
	
	children: false,
	
	currentCoords: false,
	
	metaDown: false,
	
	options: {
		childClass: 'item',
		droppables: [],
		onDrop: TSNBlank,
		onEnter: TSNBlank,
		onLeave: TSNBlank,
		onItemSelect: function( element ) {
			element.setStyle( 'background-color', '#ff6' );
		},
		onItemUnselect: function( element ) {
			element.setStyle( 'background-color', '#f1f1f1' );
		}
	},
	
	initialize: function( el ) {
		this.container = $(el);

		if( arguments[1] ) {
			this.options = $H( arguments[1] ).combine( this.options );
		}
		
		this.boundDragEvent = this.processDrag.bind( this );
		this.startDragEvent = this.startDrag.bind( this );
		this.endDragEvent = this.endDrag.bind( this );

		this.startGroupDragEvent = this.startGroupDrag.bind( this );
		this.endGroupDragEvent = this.endGroupDrag.bind( this );

		this.setSelectTriggers();
		
		this.registerPoints();
		
	},

	setSelectTriggers: function() {
		this.container.removeEvent( 'mousedown', this.startGroupDragEvent );
		document.removeEvent( 'mouseup', this.endGroupDragEvent );

		this.container.addEvent( 'mousedown', this.startDragEvent );
		document.addEvent( 'mouseup', this.endDragEvent );
	},

	setGroupTriggers: function() {
		this.container.removeEvent( 'mousedown', this.startDragEvent );
		document.removeEvent( 'mouseup', this.endDragEvent );

		this.container.addEvent( 'mousedown', this.startGroupDragEvent );
		document.addEvent( 'mouseup', this.endGroupDragEvent );
	},
	
	unsetAllTriggers: function() {
		this.container.removeEvent( 'mousedown', this.startDragEvent );
		document.removeEvent( 'mouseup', this.endDragEvent );
		this.container.removeEvent( 'mousedown', this.startGroupDragEvent );
		document.removeEvent( 'mouseup', this.endGroupDragEvent );
	},

	startDrag: function( e ) {
		var e = new Event(e);
		if( this.haltDrag == true ) {
			return;
		}
		this.container.addEvent( 'mousemove', this.boundDragEvent );
	},
	
	endDrag: function( e ) {
		var e = new Event(e);
		if( this.haltDrag == true ) {
			return;
		}
		this.metaDown = false;

		this.container.removeEvent( 'mousemove', this.boundDragEvent );

		if( this.didDrag === false && 
		    ( e.target == this.container || 
		    	e.target.retrieve( 'selected' ) == false ) ) {
			this.children.each( this.checkPosition, this );
		}

		if( this.inDrag == false ) {
			return;
		}
		
		if( this.dragBox ) {
			this.dragBox.dispose();
		}
		
		this.didDrag = false;
		this.inDrag = false;
		

	},
	
	processDrag: function( e ) {
		this.metaDown = false;

		if( !this.inDrag ) {
			if( this.dragBox.parentNode ) {
				this.dragBox.dispose();
			}
	
			this.dragBox = new Element( 'div', {
				'class':		'drag-box',
				'styles':		{
					'position':		'absolute',
					'top':			e.page.y,
					'left':			e.page.x,
					'opacity':		0.25,
					'height':		0,
					'width':		0
				}
			} );
			
			this.dragBox.store( 'startCoords', e.page );
			
			this.container.adopt( this.dragBox );
			
			this.inDrag = true;
		}
		
		var e = new Event(e);
		this.didDrag = true;
		
		var startCoords = this.dragBox.retrieve( 'startCoords' );
		var curCoords = e.page;
		
		var height = startCoords.y - curCoords.y;
		var width = startCoords.x - curCoords.x;

		if( width < 0 ) {
			this.dragBox.setStyle( 'width', Math.abs( width ) );
		} else {
			var oldWidth = this.dragBox.getStyle( 'width' ).toInt();
			this.dragBox.setStyle( 'width', Math.abs( width ) );
			this.dragBox.setStyle( 'left', 
				this.dragBox.getStyle( 'left' ).toInt() - ( width - oldWidth ) );
		}

		if( height < 0 ){
			this.dragBox.setStyle( 'height', Math.abs( height ) );
		} else {
			var oldHeight = this.dragBox.getStyle( 'height' ).toInt();
			this.dragBox.setStyle( 'height', Math.abs( height ) );
			this.dragBox.setStyle( 'top', 
				this.dragBox.getStyle( 'top' ).toInt() - ( height - oldHeight ) );
		}
		
		var pos = this.dragBox.getPosition();
		var size = this.dragBox.getSize();
		
		this.currentCoords = {
			xMin: pos.y,
			xMax: pos.y + size.y,
			yMin: pos.x,
			yMax: pos.x + size.x
		};

		if( e.meta == true ) {
			this.metaDown = true;
		}
		
		this.children.each( this.checkPosition, this );

	},
	
	checkPosition: function( el ) {
		var ePoints = el.retrieve( 'gridPoints' );
		var bPoints = this.currentCoords;

		// math/logic assist for this statement from:
		// http://pk69.com/mootools/rubberband/
		if( Math.min( bPoints.xMax, ePoints.xMax ) > 
			Math.max( bPoints.xMin, ePoints.xMin ) &&
			Math.min( bPoints.yMax, ePoints.yMax ) >
			Math.max( bPoints.yMin, ePoints.yMin ) &&
			this.didDrag == true ) {
			
			this.options.onItemSelect( el );
			el.store( 'selected', true );
		} else if( this.metaDown == false  ) {
			this.options.onItemUnselect( el );
			el.store( 'selected', false );
		}
			
	},
	
	registerPoints: function() {
		var obj = this;
		
		this.children = this.container.getChildren( 'div[class="'+
			this.options.childClass+'"]' );

		this.children.each( function( element, index ) { 
			var pos = element.getPosition();
			var size = element.getSize();
			
			var gridPoints = {
				xMin: pos.y,
				xMax: pos.y + size.y,
				yMin: pos.x,
				yMax: pos.x + size.x
			};
			element.addEvent( 'mousedown', 
				obj.itemClick.bind( obj ) );
			element.store( 'gridPoints', gridPoints );	
		} );
		
	},
	
	startGroupDrag: function( e ) {
		var e = new Event(e);

		if( this.groupDragBox ) {
			this.groupDragBox.dispose();
		}

		var marginOffset = this.children[0].getStyle( 'margin' ).toInt();

		this.groupDragBox = new Element( 'div' );
	
		document.body.adopt( this.groupDragBox );
		var fader = new Fx.Tween( this.groupDragBox, 
			{ property: 'opacity', duration:200} );
		this.groupDragBox.store( 'fader', fader );

		this.groupDragBox.setStyles({
			'position': 'absolute',
			'margin': 0,
			'width': this.container.getStyle( 'width' ),
			'top': e.page.y - marginOffset,
			'left': e.page.x - marginOffset,
			'opacity': 1
		});
		
		var coords = {
			xMin: 0,
			xMax: 0,
			yMin: 0
		};

		var marginModifier = 0;
		var obj = this;
		this.children.each( function( element ) {
			if( element.retrieve( 'selected' ) == true ) {
				var copy = element.clone();
				var pos = element.getPosition();
				var size = element.getSize();
				
				copy.store( 'original', element );
				obj.groupDragBox.adopt( copy );

				if( pos.x < coords.xMin || coords.xMin == 0 ) {
					coords.xMin = pos.x;
				}
				if( pos.y < coords.yMin || coords.yMin == 0 ) {
					coords.yMin = pos.y
				}
				if( pos.x+size.x > coords.xMax ) {
					coords.xMax = pos.x + size.x;
					marginModifier++;
				}
			};
		} );

		this.groupDragBox.setStyles( {
			'width':
				(coords.xMax - coords.xMin) + ( marginOffset * marginModifier ),
			'left': coords.xMin - marginOffset,
			'top': coords.yMin - marginOffset
		} );
		
		var dragger = new Drag.Move( this.groupDragBox, {
			droppables: this.options.droppables,
			onDrop: this.options.onDrop,
			onEnter: this.options.onEnter,
			onLeave: this.options.onLeave,
			onComplete: function() {
				obj.endGroupDrag();
				dragger = null;
			}
		});
		
		this.groupDragBox.fireEvent( 'mousedown', e );
	},

	endGroupDrag: function() {
		this.setSelectTriggers();

		this.groupDragBox.retrieve( 'fader' ).start(0);
	},
	
	itemClick: function( e ) {
		var e = new Event(e);
		
		if( !this.options.droppables.length ) {
			return;
		}
		
		if( this.inDrag == false && e.target.retrieve( 'selected' ) ) {
			this.setGroupTriggers();
		}
	
	}

});
if( !TSN.UI ) { TSN.UI = {} }

/*
Script: Notify.js
	Contains prototypes for Growl-like notifications system

License:
	New BSD license.
*/

/*
Class: TSN.UI.Notify
	Creates and manages Growl-like notifications system. TSN.UI.Notify will
	attempt to manage positioning on the page so one notification doesn't
	sit atop another.
	Notify is a factory/broker object.

Arguments:
	none
	
Example:
	(begin code)
		var notification = new TSN.UI.Notify.create({
		message:'Hello World!'});
		notification.notify();
	(end)
*/
TSN.UI.Notify = {

	activeItems: {
		'top-left': 0,
		'top-right': 0,
		'bottom-left': 0,
		'bottom-right': 0
	},

	/*
	Method: create
		Create and return a new notification object
	
	Arguments
		see TSN.UI.NotifyItem

	See: TSN.UI.NotifyItem
	
	Returns
		object TSN.UI.NotifyItem
	*/
	create: function() {
		var notifier = new TSN.UI.NotifyItem(arguments[0]);

		return notifier;
	},
	
	addItem: function( notifier ) {
		var offset = TSN.UI.Notify.activeItems[notifier.options.position];
	
		if( notifier.options.position.substr( 0, 1 ) == 't' ) {
			new Fx.Tween( notifier.element, {property:'top'} ).start( offset );
		} else {
			new Fx.Tween( notifier.element, {property:'bottom'}
				).start( offset );
		}
		
		var height = notifier.box.getSize().y + 10;
		TSN.UI.Notify.activeItems[notifier.options.position] += height;

		return;
	},
	
	removeItem: function( notifier ) {
		var height = notifier.box.getSize().y + 10;

		TSN.UI.Notify.activeItems[notifier.options.position] -= height;
		return;
	}

};

/*
Class: TSN.UI.NotifyItem
	Individual notification object.

Arguments:
	options - optional, see below
	
Options:
	boxClass - class name for the notification box. default false
	textClass - class name for the text container. default false
	position - position on the page, can be 'top-right', 'top-left', 
	'bottom-right', or 'bottom-left'. default 'top-right'
	message - default notification message. default false
	delay - fadeout delay. default 6000
	sticky - sticky notifications stick around until clicked. default false
	automatic - automatically display notification on creation. default true
	container - container to place notification in. default document.body
	decayOnClick - start fadeout when clicked, only really useful for
	sticky notifications. default true
	
Example:
	(begin code)
		var notification = new TSN.UI.Notify.create({
			boxClass: 'notification',
			position: 'top-left',
			sticky: true,
			delay: 150,
			message:'Hello World!'
		});
	(end)
*/
TSN.UI.NotifyItem = new Class({

	options: {
		boxClass: false,
		textClass: false,
		position: 'top-right',
		message: false,
		delay: 6000,
		sticky: false,
		automatic: true,
		container: false,
		decayOnClick: true
	},
	
	box: false,
	text: false,
	element: false,
	
	faderIn: false,
	faderOut: false,
	
	initialize: function() {
		if( arguments[0] ) {
			this.options = $H( arguments[0] ).combine( this.options );
		}
		
		if( this.options.container == false ) {
			this.options.container = $(document.body);
		}
		
		if( this.options.sticky == false ) {
			this.options.decayOnClick = false;
		}
		
		var boxStyles = {};
		if( !this.options.boxClass ) {
			var boxStyles = {
				'background-color':		'#333',
				'opacity':				.75,
				'border':				'1px solid #000',
				'width':				'100%',
				'height':				'100%'
			};
		}
	
		if( !this.options.textClass ) {
			var textStyles = { 
				'position': 'absolute',
				'padding':	'10px',
				'color':	'#fff',
				'top':		0,
				'left':		0
			};
		} else {
			var textStyles = { 
				'position': 'absolute',
				'top':		0,
				'left':		0
			};
		}
	
		this.box = new Element( 'div', {
			'class': this.options.boxClass,
			'styles': boxStyles
		});
		
		this.text = new Element( 'div', {
			'class': this.options.textClass,
			'styles': textStyles
		});
		
		this.setText( this.options.message );
		
		this.element = new Element( 'div', {
			'styles': {
				'position': 'absolute',
				'width':	'150px',
				'margin':	'10px',
				'opacity':	0
			}
		});
		
		this.element.adopt( this.box );
		this.element.adopt( this.text );
		
		switch( this.options.position ) {
			case 'top-right':
				this.element.setStyles({
					'top':		0,
					'right':	0
				});
				break;
			case 'top-left':
				this.element.setStyles({
					'top':		0,
					'left':		0
				});
				break;
			case 'bottom-right':
				this.element.setStyles({
					'bottom':	0,
					'right':	0
				});
				break;
			case 'bottom-left':
				this.element.setStyles({
					'bottom':	0,
					'left':		0
				});
				break;
		}

		this.options.container.adopt( this.element );
		
		var obj = this;
		this.faderIn = new Fx.Tween( this.element, { property:'opacity',
			duration:250,transition:Fx.Transitions.Cubic.easeInOut,
			onComplete: function() {
				TSN.UI.Notify.addItem( obj );
				if( !obj.options.sticky ) {
					obj.decay();
				}
			}
		});
		this.faderOut = new Fx.Tween( this.element, { property: 'opacity',
			duration:this.options.delay,
			transition:Fx.Transitions.Cubic.easeInOut,
			onComplete: function() {
				TSN.UI.Notify.removeItem( obj );
				this.element.dispose();
			}
		});
		
		if( this.options.decayOnClick ) {
			this.element.addEvent( 'click', function() {
				obj.decay();
			});
		}
		
		if( this.options.automatic ) {
			this.notify();
		}

		var size = this.text.getSize();
		this.box.setStyles({
			'height':	size.y,
			'width':	size.x
		});
	},
	
	/*
	Method: setText
		Set the notification text
	
	Arguments:
		text - (string) notification text
	*/
	setText: function( text ) {
		if( typeof text == 'string' ) {
			this.text.set( 'text',  text );
		} else {
			this.text.adopt( text );
		}
	},
	
	/*
	Method: notify
		Cause the notification box to appear. Unless you set 'automatic' to
		false when created, this method is useless.
	*/
	notify: function() {
	
		this.faderIn.start( 1 );
	},
	
	/*
	Method: decay
		Cause the notification box to start fading out. Unless you set 'sticky'
		to true, this method is useless.
	*/
	decay: function() {
		
		this.faderOut.start( 0 );
	}
});
if( !TSN.UI ) { TSN.UI = {} }
/*
Script: DragResize.js
	Contains prototypes element side resizer widget

License:
	New BSD license.
*/

/*
Class: TSN.UI.DragResize
	Uses a slider widget to interactively resize element.

Arguments:
	element - element to apply sizing effects to, can be either element ID
	or object
	options - optional, see below
	
Options:
	showIndicator - (bool) display the current width above the slider widget.
	default true
	dragHandle - (string,object) the element to drag along the track. If omitted
	class will attempt to locate and use the first (element) child of the
	drag track
	indicatorClass - (string) class style for the indicator
	direction - (string) direction dragHandle moves to resize image (i.e.
	left-to-right or right-to-left', possible values are 'rtl' and
	'ltr'. default 'rtl'.

Events:
	onResize - fired image size is changed (careful with this
	one, similar to onDrag or onMouseMove callbacks)
	onComplete - fired when resize action has completed

Example:
	(begin code)
		dragger = new TSN.UI.DragResize( 'dragTrack',{
			onResize: function( el ) {
				$('newX').value = el.getSize().x;
				$('newY').value = el.getSize().y;
			}
		});

		<div id="dragTrack" rel="dragImage">
			<div class="dragHandle">&nbsp;</div>
		</div>
		X:<input type="text" size="3" id="newX" value="0" />
		Y:<input type="text" size="3" id="newY" value="0" />
		<img src="./test.jpg" id="dragImage" />
	(end)
*/
TSN.UI.DragResize = new Class({

	track: false,
	handle: false,
	element: false,
	
	indicator: false,
	
	options: {
		showIndicator: true,
		indicatorClass: 'resize-indicator',
		dragHandle: false,
		direction: 'rtl',
		onResize: TSNBlank,
		onComplete: TSNBlank
	},
	
	handleDrag: false,
	endDrag: false,
	
	stops: {
		left: 0,
		right: 0
	},
	
	startSize: false,
	
	didDrag: false,
	
	initialize: function( el ) {
		
		if( arguments[1] ) {
			this.options = $H( arguments[1] ).combine( this.options );
		}

		this.track = $(el);
		if( this.track.getAttribute( 'rel' ) ) {
			this.element = $(this.track.getAttribute( 'rel' ));
		}
		
		if( !this.options.dragHandle && this.track.getChildren().length == 1 ) {
			this.handle = this.track.getChildren()[0];
		} else {
			this.handle = $(this.options.dragHandle);
		}
	
		this.track.setStyle( 'position', 'relative' );
		this.handle.setStyle( 'position', 'absolute' );
	
		this.handleDrag = this.drag.bind( this );
		this.endDrag = this.end.bind( this );
		
		var start = this.start.bind( this );
		this.track.addEvent( 'mousedown', start );
		
		if( this.options.direction == 'rtl' ) {
			this.handle.setStyle( 'left', this.track.getSize().x -
				this.handle.getSize().x );
		}
	},
	
	start: function(e) {
		document.addEvent( 'mousemove', this.handleDrag );

		if( this.startSize == false ) {
			this.startSize = this.element.getSize().x;
		}

		this.element.makePositioned();
		
		this.didDrag = false;
		
		var size = this.track.getSize();
		var position = this.track.getPosition();
		
		var handleSize = this.handle.getSize();
		
		this.stops.left = 0;
		this.stops.right = size.x - handleSize.x;
		
		if( this.options.showIndicator ) {
			this.indicator = new Element( 'span', {
				'styles': {
					'position': 'absolute',
					'left':  e.client.x - (handleSize.x/2),
					'top': position.y - size.y
				},
				'text': this.element.getSize().x + 'px'
			} );
			
			if( this.options.indicatorClass ) {
				this.indicator.addClass( this.options.indicatorClass );
			}
		}
		
		document.addEvent( 'mouseup', this.endDrag );
	
	},
	
	end: function(e) {
		if( !this.didDrag ) {
			this.drag(e);
		}
		this.element.makeStatic();
		document.removeEvent( 'mousemove', this.handleDrag );	

		var end = this.end.bind( this );
		document.removeEvent( 'mouseup', this.endDrag );
		
		if( this.indicator ) {
			this.indicator.dispose();
		}
		
		this.indicator = false;
		
		this.options.onComplete( this.element );
	},
	
	drag: function(e) {
		var e = new Event(e);
		
		this.didDrag = true;

		var xPos = e.client.x - (this.handle.getSize().x/2) - this.track.getPosition().x;

					
		if( xPos < this.stops.left || xPos > this.stops.right ) {
			return;
		}

		this.handle.setStyle( 'left', xPos );
		
		var pct = Math.ceil( (xPos / this.track.getSize().x) * 100 );
		if( this.options.direction == 'ltr' ) {
			pct = 100 - pct;		
		}
	
		var newSize = pct * ( this.startSize / 100 );
		
		this.element.setProperty( 'width', newSize );

		if( this.indicator ) {
			var xPos = e.client.x - (this.handle.getSize().x/2);
	
			document.body.adopt( this.indicator );
			this.indicator.setStyle( 'left', xPos );
			this.indicator.set( 'text',  newSize + 'px' );
		}
		
		this.options.onResize( this.element );
	},
	
	/*
	Method: getSize
		Get current height and width of element

	Returns:
		object with x and y sizes
	
	Example:
		>console.log( dragger.getSize().x ) // 100
	*/
	getSize: function() {
		return this.element.getSize();
	},
	
	/*
	Method: setSize
		Resize element to requested size. Will also move slider widget
		to the appropriate place on the slider track.
		
	Arguments:
		size - (object) contains an x, y or both sizes. Will attempt to keep
		aspect ratio based on x size
		
	Example:
		>dragger.setSize( {x:100,y:100} );
		>dragger.setSize( {x:250} );
	*/
	setSize: function( size )
	{
		if( this.startSize == false ) {
			this.startSize = this.element.getSize().x;
		}

		var current = this.element.getSize();
		
		if( !size.x && !size.y ) {
			return;
		}
		
		if( !size.x ) {
			size.x = Math.ceil( size.y / ( current.y / current.x ) );
		}
		
		if( !size.y ) {
			size.y = Math.ceil( size.x / ( current.x / current.y ) );
		}
		
		if( size.x == current.x || size.x > this.startSize ||
			size.x < 1 ) {
			return;
		}
		
		if( size.x == this.startSize ) {
			var xPos = 0;
		} else {
			
			var pct = 100 - ( Math.ceil( (size.x / this.startSize) * 100 ) );
	
			var xPos = pct * ( this.track.getSize().x / 100 );
			xPos = xPos - (this.handle.getSize().x/2);
	
		}

		this.handle.setStyle( 'left', xPos );
		this.element.setProperty( 'width', size.x );
		
		this.options.onResize( this.element );

	},

	/*
	Method: reset
		Reset element to starting width and height
	*/
	reset: function() {
		if( !this.startSize ) {
			return;
		}
		
		this.setSize( {x:this.startSize} );
	}


});
if( !TSN.UI ) { TSN.UI = {} }
/*
Script: SplitView.js
	Contains prototypes split view widget

License:
	New BSD license.
*/

/*
Class: TSN.UI.SplitView
	Create and manage a two pane, resizable splitview.
	Please note that the parent element should contain only the 2 frames and
	grippy elements.
	
	If you want to create a nested SplitView, please make sure to put your
	second split view inside a seperate container:
	(begin code)
		<div id="split-view-1">
			<div id="frame-1">
				foo
			</div>
			<div id="grippy">Grippy!</div>
			<div id="frame-2">
				<div id="split-view-2">
					<div id="subFrame-1">
						bar
					</div>
					<div id="grippy-2">Also Grippy!</div>
					<div id="subFrame-2">
						baz
					</div>
				</div>
			</div>
		</div>
	(end)
	
Arguments:
	see options below
	
Options:
	frames - (array) an array of the frames. currently only accepts 2 frames.
	first frame will automatically expand, second will automatically collapse
	grippy - (string,object) the grippy element (i.e. the draggable element
	that will resize the two frames)
	orientation - (string) the orientation of the two frames. Can be
	'horizontal' or 'vertical'. Please note that if you choose 'vertical' your
	frames and grippy should have a 'float:left' style. default 'horizontal'
	sizeTo - element to size the frame container to (i.e. take the maxium space
	avaliable. set to 'false' to disable auto sizing. default 'window'.
	
Events:
	onStart - fired when drag event has started
	onComplete - fired when drag event has ended
	onDrag - fired when grippy element is dragged inside the parent container
	
Example:
	(begin code)
		splitview = new TSN.UI.SplitView({
			frames: [$('frame1'),$('frame2')],
			grippy: $('grippy')
		});

		<div id="split-view">
			<div id="frame1" class="frame">
				<h1>SplitView Test</h1>
				<img src="test.jpg" id="test-image" />
			</div>
			<div id="grippy">Grippy!</div>
			<div id="frame2" class="frame">
				<img src="test2.jpg" />
			</div>
		</div>

	(end)
*/
TSN.UI.SplitView = new Class({

	options: {
		frames: false,
		grippy: false,
		orientation: 'horizontal',
		sizeTo: window,
		onStart: TSNBlank,
		onComplete: TSNBlank,
		onDrag: TSNBlank
	},

	grippy: false,
	frames: false,
	container: false,
	
	grippyTween: false,
	
	handleDrag: false,
	handleStart: false,
	handleEnd: false,
	
	stops: {
		xMin: 0,
		xMax: 0,
		yMin: 0,
		yMax: 0
	},
	
	containerSize: 0,
	containerPos: 0,
	grippySize: 0,
	
	initialize: function() {
		
		if( arguments[0] ) {
			this.options = $H( arguments[0] ).combine( this.options );
		}
		
		this.frames = this.options.frames;
		this.grippy = this.options.grippy;
		
		if( this.frames.length < 1 || this.frames.length > 2 ) {
			console.log( 'SplitView only supports two frames at this time.' );
			return;
		}
		
		this.container = this.frames[0].parentNode;
		
		if( this.options.sizeTo && this.container.get('tag') != 'body' ) {
			var size = this.options.sizeTo.getSize();
			this.container.setStyle( 'height', size.y );
			if( this.options.orientation == 'vertical' ) {
				this.container.setStyle( 'width', size.x );
			}

		}

		var obj = this;
		window.addEvent( 'resize', function(e) {
			if( obj.options.orientation == 'vertical' ) {
				obj.container.setStyle( 'width', window.getSize().x );
				obj.container.setStyle( 'height', window.getSize().y );
			} else {
				obj.container.setStyle( 'height', window.getSize().y );
			}
			obj.sizeFrames();
		});


		this.sizeFrames();

		this.handleDrag = this.grippyDrag.bind( this );
		this.handleStart = this.grippyDragStart.bind( this );
		this.handleEnd = this.grippyDragEnd.bind( this );
		
		this.grippy.addEvent( 'mousedown', this.handleStart );
		
		var prop = 'top';
		if( this.options.orientation == 'vertical' ) {
			prop = 'left';
		}
		
		var obj = this;
		this.grippyTween = new Fx.Tween( this.grippy, {
			property: prop,
			transition:Fx.Transitions.Quart.easeOut, onComplete: function(){
				obj.options.onDrag( obj );
			}
		});
	},
	
	/*
	Method: sizeFrames
		Call sizeFrames to resize the 2 splitview frames and fix the grippy
		position.
		Useful to call on the window.onResize event
	*/
	sizeFrames: function() {
		this.containerSize = this.container.getSize();
		this.containerPos = this.container.getPosition();
		this.grippySize = this.grippy.getSize();

		var obj = this;
		var prop = 'height';
		if( this.options.orientation == 'vertical' ) {
			prop = 'width';
		}

		var i = 0;
		this.frames.each( function( frame ) {
			if( !frame.fullHeight ) {
				$extend( frame, TSN.UI.SplitViewFrame );
			}
			if( obj.options.orientation == 'vertical' ) {
				frame.fullHeight = obj.containerSize.x - obj.grippySize.x;
				frame.setStyle( 'height', '100%' );
			} else {
				frame.fullHeight = obj.containerSize.y - obj.grippySize.y;
			}
			if( !frame.id ) {
				frame.id = 'frame'+i;
			}
			frame.prop = prop;
			frame.setStyle( 'overflow', 'auto' );
			frame.tweener = new Fx.Tween( frame, {
				property: prop,
				transition:Fx.Transitions.Quart.easeOut
			} );
			i++;
		} );

		if( this.options.orientation == 'vertical' ) {
			this.frames[1].setStyle( 'padding-left', this.grippySize.x );
			this.grippy.setStyles({
				'position':		'absolute',
				'left':			this.containerSize.x - this.grippySize.x,
				'height':		this.containerSize.y
			});
	
			this.stops.xMax = this.containerSize.x - this.grippySize.x;
		} else {
			this.frames[1].setStyle( 'padding-top', this.grippySize.y );
			this.grippy.setStyles({
				'position':		'absolute',
				'top':			this.containerSize.y - this.grippySize.y,
				'width':		this.containerSize.x
			});
	
			this.stops.yMax = this.containerSize.y - this.grippySize.y;
		}
		
		this.frames[0].expand();
		this.frames[1].collapse();	

		this.container.setStyles({
			'position': 'relative',
			'overflow': 'hidden'
		});
		
	},
	
	grippyDragStart: function( e ) {
		$(document).addEvent( 'mousemove', this.handleDrag );

		// ...
	
		$(document).addEvent( 'mouseup', this.handleEnd );

	},
	
	grippyDragEnd: function( e ) {
		$(document).removeEvent( 'mousemove', this.handleDrag );	
	},
	
	grippyDrag: function( e ) {

		containerSize = this.container.getSize();
		containerPos = this.container.getPosition();
		grippySize = this.grippy.getSize();

		if( this.options.orientation == 'vertical' ) {
			var xPos = e.page.x - this.grippy.getSize().x/2 - containerPos.x;
			if( xPos < this.stops.xMin || xPos > this.stops.xMax ) {
				return
			}

			this.grippy.setStyle( 'left', xPos );
			this.frames[0].setSize( xPos );
			this.frames[1].setSize( Math.floor( containerSize.x - xPos - grippySize.x ) );
		} else {
			var yPos = e.page.y - this.grippy.getSize().y/2 - containerPos.y;
			if( yPos < this.stops.yMin || yPos > this.stops.yMax ) {
				return
			}
	
			this.grippy.setStyle( 'top', yPos );
			this.frames[0].setSize( yPos );
			this.frames[1].setSize( containerSize.y - yPos - grippySize.y);
		}
		
		this.options.onDrag( this );
	},
	
	/*
	Method: toggle
		Opens one frame to full height, collapses another to 0
	*/
	toggle: function() {
		if( this.frames[0].getStyle( this.frames[0].prop ).toInt() == 0 ) {
			this.frames[1].tweener.start( 0 );
			this.frames[0].tweener.start( this.frames[0].fullHeight );
			if( this.options.orientation == 'vertical' ) {
				this.grippyTween.start(
					this.containerSize.x - this.grippySize.x );
			} else {
				this.grippyTween.start(
					this.containerSize.y - this.grippySize.y );
			}
		} else {
			this.frames[0].tweener.start( 0 );
			this.frames[1].tweener.start( this.frames[1].fullHeight );
			this.grippyTween.start( 0 );
		}
	},
	
	/*
	Method: sizeFrameTo
		Sizes one frame to the requested height/width
		
	Arguments:
		useFrame - (int,string,object) the frame to apply the sizing to. Can be
		the frame's index (0 or 1), id name or DOM element
		setSize - (int) the size, in pixels, to set it to

	Example:
		(begin code)
			splitView.sizeFrameTo( 0, 100 );
			splitView.sizeFrameTo( 'frame1', 100 );
			splitView.sizeFrameTo( $('frame1'), 100 );
		(end)
	*/
	sizeFrameTo: function( useFrame, setSize ) {
		var frame = false;
		switch( typeof useFrame ) {
			case 'number':
				frame = this.frames[useFrame];
				break;
			case 'string':
				frame = $(useFrame);
				break;
			case 'object':
				frame = useFrame;
				break;
		}
		
		if( !frame ) {
			return false;
		}
		
		var remainder = frame.fullHeight - setSize;
		if( remainder < 0 ) {
			return false;
		}
		
		frame.tweener.start( setSize );
		if( frame.id == this.frames[0].id ) {
			this.frames[1].tweener.start( remainder );
			this.grippyTween.start( setSize );
		} else {
			this.frames[0].tweener.start( remainder );
			this.grippyTween.start( remainder );
		}
	}
	
});

/*
Class: TSN.UI.SplitViewFrame
	Extensions for DOM elements identified as splitview frames.
*/
TSN.UI.SplitViewFrame = {
	
	fullHeight: false,
	tweener: false,
	prop: false,
	
	/*
	Method: collapse
		Collapse the frame to 0 height
	*/
	collapse: function() {
		// for some reason, the property isn't properly set if it's passed
		// in a variable...
		if( this.prop == 'height' ) {
			this.setStyles({
				'height': 0,
				'overflow': 'hidden'
			});
		} else {
			this.setStyles({
				'width': 0,
				'overflow': 'hidden'
			});
		}
	},
	
	/*
	Method: expand
		Expand frame to full height
	*/
	expand: function() {
		if( this.prop == 'height' ) {
			this.setStyles({
				'height': this.fullHeight,
				'overflow': 'auto'
			});
		} else {
			this.setStyles({
				'width': this.fullHeight,
				'overflow': 'auto'
			});
		}
	},
	
	/*
	Method: setSize
		Set frame size
	
	Arguments:
		val - (int) size in pixels for frame height/width, depending on
		alignment
	*/
	setSize: function( val ) {
		if( this.prop == 'height' ) {
			this.setStyles({
				'height': val,
				'overflow': 'auto'
			});
		} else {
			this.setStyles({
				'width': val,
				'overflow': 'auto'
			});
		}
	}
	
};
/*
Script: Effects.js
	Base script for the other effects classes. This really doesn't do much
	on it's own.

License:
	New BSD license.
*/

/*
Class: TSN.Effects
	Base class for the other advanced effects. You shouldn't ever need to 
	instantiate this class on it's own.

Arguments:
	none
*/
TSN.Effects = new Class({

	/*
	Method: baseOptions
		Empty container for base options
	*/
	baseOptions: new Hash({
		onComplete: function(){}
	}),

	/*
	Method: getOptions
		Returns an argument hash merged with the base options

	Arguments:
		args - an array, object or hash of options

	Example:
		>this.options = this.getOptions( arguments[1] );
	*/
	getOptions: function( args ) {
		var options = this.baseOptions;
		
		if( args ) {
			var options = new Hash( args ).combine( this.baseOptions );
		}
	
		return options;
	}

});
/*
Script: Morph.js
	Contains prototypes box morph effects

License:
	New BSD license.
*/

/*
Class: TSN.Effects.Morph
	Grow, shrink and rubberband morphing effects.

Arguments:
	element - element to apply morphing effects to, can be either element ID
	or object
	options - optional, see below
	
Options:
	transition - the Fx.Transitions to apply to the morphing animation. default Cubit.easeInOut
	duration - the length of the animation. default 500

Example:
	(begin code)
		gMorph = new TSN.Effects.Morph( 'growbox' );
		$('growbox').addEvent( 'click', function(e) {
			gMorph.grow(20, {transition:Fx.Transitions.Bounce.easeOut})
		});

		rMorph = new TSN.Effects.Morph( 'rubberbox' );
		$('rubberbox').addEvent( 'click', function(e) {
			rMorph.rubberBand(20, {duration:150})		
		});
	(end)
*/
TSN.Effects.Morph = new Class({
	Extends: TSN.Effects,
	element: false,

	baseOptions: new Hash({
		transition: Fx.Transitions.Cubic.easeInOut,
		duration: 500,
		styles: false
	}),
	
	initialize: function( el ) {
		this.element = $(el);
	},

	/*
	Method: grow
		Grows (or shrinks) the box by pixels

	Arguments:
		toWidth - (int) size, in pixels, to grow the box. size is relative to 
		the current size (i.e. passing 20 will grow the box by 20 pixels).
	*/
	grow: function( toWidth ) {
		
		var options = this.getOptions( arguments[1] );
		
		var coords = this.element.innerDimensions();

		// safari correction
		var styles = {
			top: coords.top,
			left: coords.left
		};
		
		this.element.setStyles( styles );

		var half = Math.ceil( toWidth / 2 );

		var morphStyles = {
			height: coords.height + toWidth,
			width: coords.width + toWidth,
			top: coords.top - half,
			left: coords.left - half
		};
		
		var morph = new Fx.Morph( this.element, {
			transition: options.transition,
			duration: options.duration,
			onComplete: options.onComplete
		} );
		
		morph.start( morphStyles );

	},
	
	/*
	Method: rubberBand
		Causes the box to quickly grow then contract back to original size.

	Arguments:
		toWidth - (int) size, in pixels, to grow the box. size is relative to 
		the current size (i.e. passing 20 will grow the box by 20 pixels).
	*/
	rubberBand: function( toWidth ) {
		var options = this.getOptions( arguments[1] );

		var coords = this.element.innerDimensions();

		// safari correction
		var styles = {
			top: coords.top,
			left: coords.left
		};
		
		this.element.setStyles( styles );

		var half = Math.ceil( toWidth / 2 );

		var morphStyles = {
			height: coords.height + toWidth,
			width: coords.width + toWidth,
			top: coords.top - half,
			left: coords.left - half
		};

		var morphStylesReturn = {
			height: coords.height,
			width: coords.width,
			top: coords.top,
			left: coords.left,
			onComplete: options.onComplete
		};
		
		if( options.styles ) {
			var styles = new Hash( options.styles );
			styles.each( function( value, key ) {
				morphStyles[key] = value;
			} );
		}
		
		var morph = new Fx.Morph( this.element,	{
			transition: options.transition,
			duration: options.duration,
			link:'chain'
		} );
		
		morph.start( morphStyles ).start( morphStylesReturn );

	
	}

});
/*
Script: ImageZoom.js
	Contains prototypes for the ImageZoom class.

License:
	New BSD license.
*/

/*
Class: TSN.Effects.ImageZoom
	A lightbox-like image zoom effect.

Arguments:
	className - the class name for the image thumbnails
	options - optional, see below
	
Options:
	none
	
Events:
	onComplete - callback function called when the fullsize image is closed
	onLoadComplete - callback function called when the fullsize image fully 
	loads
	onLoad - callback function called when fullsize image begins to load

Example:
	(begin code)
		new TSN.Effects.ImageZoom( 'image', {
			onLoad: function( preview ) {
				var container = new Element( 'div', {
					'id': 'loader',
					'class': 'loader',
					styles: {
						opacity: .6,
						width: preview.getSize().x,
						height: preview.getSize().y,
						top: preview.getPosition().y,
						left: preview.getPosition().x
					}
				});
				
			 	container.injectAfter( preview );
			},
			onLoadComplete: function() {
				$('loader').setStyle( 'background', '#fff' );
			},
			onComplete: function() {
				$('loader').dispose();
			}
		});
	(end)
*/
TSN.Effects.ImageZoom = new Class({

	options: {
		onComplete: TSNBlank,
		onLoadComplete: TSNBlank,
		onLoad: TSNBlank
	},
	
	images: false,
	
	click: false,
	close: false,
	
	loader: false,
	preview: false,
	
	isOpen: false,
	
	initialize: function( className ) {

		if( arguments[1] ) {
			this.options = $H( arguments[1] ).combine( this.options );
		}

		this.images = $$('img.'+className);

		this.click = this.onClick.bind( this );
		this.close = this.onClose.bind( this );
		
		var obj = this;
		this.images.each( function( el ) {
			el.addEvent( 'click', obj.click );
		});


	},
	
	onClick: function( e ) {
		var e = new Event(e);
		var el = e.target;
		e.stop();

		if( this.isOpen ) {
			return;
		}
		
		var newPath = el.getAttribute( 'rel' );
		if( !newPath ) {
			return;
		}
		this.loader = new Image;
		
		this.options.onLoad( e.target, this.loader );
		
		this.preview = e.target;
		this.loader.onload = this.onLoad.bind( this );
		this.loader.src = newPath;
	},
	
	onClose: function(e) {
		var startStyles = $('imagezoom-fullsize').retrieve( 'startStyles' );
		
		new Fx.Morph( $('imagezoom-fullsize'), 
			{transition:Fx.Transitions.Cubic.easeOut,onComplete:function(){
					$('imagezoom-fullsize').dispose();
			}} ).start( startStyles );

		$(document.body).removeEvent( 'click', this.close );
		
		this.isOpen = false;

		this.options.onComplete( this.preview, this.loader );

	},
	
	onLoad: function() {
		
		this.isOpen = true;
		
		var img = new Element( 'img', {
			src: this.loader.src,
			id: 'imagezoom-fullsize'
		});
		
		var startPos = this.preview.getPosition();
		var startSize = this.preview.getSize();
		
		var endSize = {
			x: this.loader.width.toInt(),
			y: this.loader.height.toInt()
		};
		
		var win = window.getSize();
		
		var endPos = {
			x: Math.ceil( win.x/2 - endSize.x/2),
			y: Math.ceil( win.y/2 - endSize.y/2)
		};
		
		var startStyles = {
			position: 'absolute',
			top: startPos.y,
			left: startPos.x,
			height: startSize.y,
			width: startSize.x,
			opacity: 0
		};
		
		img.store( 'startStyles', startStyles );
		
		img.setStyles( startStyles );
		
		document.body.appendChild( img );
		
		var morphStyles = {
			top: endPos.y,
			left: endPos.x,
			height: endSize.y,
			width: endSize.x,
			opacity: 1
		};
		
		new Fx.Morph( img, 
			{transition:Fx.Transitions.Cubic.easeOut} ).start( morphStyles );
			
		$(document.body).addEvent( 'click', this.close );
		
		this.options.onLoadComplete( img, this.preview, this.loader );
	}

});/*
Script: RubberSwitch.js
	Contains prototypes for the RubberSwitch effect

License:
	New BSD license.
*/

/*
Class: TSN.Effects.RubberSwitch
	Uses rubberband effect to switch between to child DIV elements

Arguments:
	element - element to apply morphing effects to, can be either element ID
	or object
	options - optional, see below
	
Options:
	frontClass - class name for the "front" element. default 'front'
	backClass - class name for the "back" element. default 'back'

Example:
	(begin code)
		switcher = new TSN.Effects.RubberSwitch( 'rubberSwitcher' );

		<div id="rubberSwitcher" class="front">
			<div>
			This is the front side. <a href="#" onclick="switcher.swap()">Flip</a>
			</div>
			<div>
				<input value="Back side" /> <a href="#" onclick="switcher.swap()">Flop</a>
			</div>
		</div>

	(end)
*/
TSN.Effects.RubberSwitch = new Class({
	Extends: TSN.Effects,
	element: false,
	kids: false,
	
	baseOptions: {
		'frontClass': 'front',
		'backClass': 'back'
	},
	
	placeHolder: false,
	
	morph: false,
	
	frontStyles: false,
	backStyles: false,
	
	initialize: function( el ) {
		this.options = this.getOptions( arguments[1] );
	
		this.element = $(el);
		
		this.kids = this.element.getElements( 'div' );
		
		this.kids[1].setStyle( 'display', 'none' );

		this.placeHolder = this.element.makePositioned();
		
		var css = new Fx.CSS;
		
		this.frontStyles = css.search( '.'+this.options.frontClass );
		this.backStyles = css.search( '.'+this.options.backClass );
	},
	
	/*
	Method: swap
		Swap visable DIV elements
	*/
	swap: function() {

		if( this.kids[0].getStyle( 'display' ) != 'none' ) {
			var styles = this.backStyles;
		} else {
			var styles = this.frontStyles;
		}

		if( !this.morph ) {
			morph = new TSN.Effects.Morph( this.element );
		}

		morph.rubberBand( 20, {
			duration: 250,
			styles: styles,
			onComplete:this.toggleClasses()
		} );

		if( this.kids[0].getStyle( 'display' ) != 'none' ) {
			this.kids[0].setStyle( 'display', 'none' );
			this.kids[1].setStyle( 'display', '' );
		} else {
			this.kids[1].setStyle( 'display', 'none' );
			this.kids[0].setStyle( 'display', '' );
		}
		
	},
	
	toggleClasses: function() {
		this.element.toggleClass( this.options.frontClass );
		this.element.toggleClass( this.options.backClass );
	},
	
	finishSwap: function() {
		this.placeHolder.dispose();
		this.element.setStyle( 'position', 'relative' );
	}
	
});
/*
Script: Slide.js
	Contains prototypes for the Slide/Fade effect

License:
	New BSD license.
*/

/*
Class: TSN.Effects.Slide
	Slide is sort of inappropriately named. Slide actually causes elements
	around the named element to slide out of the way while the named element
	fades in.

Arguments:
	element - element to apply morphing effects to, can be either element ID
	or object
	
Options:
	none

Example:
	(begin code)
		slider = new TSN.Effects.Slide( 'slideOut' );

		<a onclick="slider.slide();">Slide</a>
		
		<div id="slideOut">
			Slide out!
		</div>
	(end)
*/
TSN.Effects.Slide = new Class({
	Extends: TSN.Effects,
	element: false,
		
	slider: false,
		
	initialize: function( el ) {
		this.element = $(el);
				
		var container = new Element( 'div' ).store( 'hide-container', true );
		
		container.injectBefore( this.element );
		container.adopt( this.element );
		
		if( arguments[1] == true ) {
			this.hide();
		}
		
		this.slider = new Fx.Morph( this.element.parentNode,
			{link:'chain',duration:250,transition:Fx.Transitions.Quad.easeOut} );
		
	},

	/*
	Method: hide
		Hide the box sans transition

	Arguments:
		none
	*/
	hide: function() {
		this.element.parentNode.setStyle( 'overflow', 'hidden' );
		this.element.parentNode.setStyle( 'height', 0 );
		
		this.element.parentNode.setStyle( 'opacity', 0 );
		
		return this;
	},

	/*
	Method: rubberBand
		Start the side/fade in effect

	Arguments:
		none
	*/
	slide: function() {
		
		if( this.element.parentNode.getStyle( 'opacity' ) == 1 ) {
			var opacity = {
				'opacity': 0
			};
			var height = {
				'height': 0,
				'overflow': 'hidden'			
			};
			
			this.slider.start( opacity ).start( height );
			
		} else {
			var opacity = {
				'opacity': 1
			};
			var height = {
				'height': this.element.getSize().y,
				'overflow': ''
			};

			this.slider.start( height ).start( opacity );
		}
		
	}

});
if( !TSN ) {
	var TSN = new Class({});
}

/*
Script: InlineEditor.js
	Contains static object for InlineEditor

License:
	New BSD license.
*/

/*
Class: TSN.InlineEditor
	Creates editor bar for textareas. Default mode is Textile but you can 
	create custom insertions and wraps useing the insertAtSelection and
	wrapSelection methods.

	Technically the class of "editor" is only required for Internet
	Explorer 6/7, so if you aren't targeting those platforms, it's not necessary.

Example:
	(begin code)
		<a onclick="TSN.InlineEditor.bold('foo')">Bold</a>
		<a onclick="TSN.InlineEditor.link('foo')">Link</a>
		
		<textarea id="foo" class="editor">Test text</textarea>
	(end)
*/
TSN.InlineEditor = {

	/*
	Method: insertAtSelection
		Insert text at the cursor.

	Arguments:
		container - the textarea, can be element ID or object
		text - text to insert
	*/
	insertAtSelection: function( container, text ) {
		if( window.ie ) {
			$(container).getAttribute( 'carat' ).text = text;
			return;
		}

		var start = $(container).selectionStart;
		
		var value = $(container).value;
		var oldTop = $(container).scrollTop;
		
		$(container).value = value.substring( 0, start )+
			text+
			value.substring( start, value.length );

		$(container).scrollTop = oldTop;

	},
	
	/*
	Method: wrapSelection
		Wrap selected text with pre and post text.

	Arguments:
		container - textbox, can be either element ID or object
		pre - text to insert before selection
		post - text to insert after selection
	*/
	wrapSelection: function( container, pre, post ) {
		if( window.ie ) {
			var text = $(container).getAttribute( 'carat' ).text;
			if( text.substring( text.length - 1 ) == ' ' ) {
				text = text.substring( 0, text.length - 1 );
				
				post += ' ';
			}

			$(container).getAttribute( 'carat' ).text = pre + text + post;

			return;
		}
		var start = $(container).selectionStart;
		var end = $(container).selectionEnd;
		
		var oldTop = $(container).scrollTop;
		
		var value = $(container).value;
		var selection = value.substr( start, (end-start) );
		
		$(container).value = value.substring( 0, start )+
			pre+selection+post+
			value.substring( end, value.length );
			
		$(container).scrollTop = oldTop;
	},
	
	ieStoreCarat: function( el ) {
		el.setAttribute( 'carat',
			document.selection.createRange().duplicate() );
	},
	
	/// convenience style function callbacks
	
	/*
	Method: bold
		Convenience for Textile bold

	Arguments:
		element - textarea, can be either element ID or object
	*/
	bold: function( el ) {
		this.wrapSelection( el, '*', '*' );
	},
	
	/*
	Method: italic
		Convenience for Textile italic

	Arguments:
		element - textarea, can be either element ID or object
	*/	
	italic: function( el ) {
		this.wrapSelection( el, '_', '_' );
	},
	
	/*
	Method: blockquote
		Convenience for Textile blockquote

	Arguments:
		element - textarea, can be either element ID or object
	*/
	blockquote: function( el ) {
		this.insertAtSelection( el, "\n> \n> \n" );
	},
	
	/*
	Method: bullets
		Convenience for Textile unordered list

	Arguments:
		element - textarea, can be either element ID or object
	*/
	bullets: function( el ) {
		this.insertAtSelection( el,
			"\n* Item One\n* Item Two\n* Item Three\n\n" );
	},
	
	/*
	Method: ordered
		Convenience for Textile ordered list

	Arguments:
		element - textarea, can be either element ID or object
	*/
	ordered: function( el ) {
		this.insertAtSelection( el,
			"\n# Item One\n# Item Two\n# Item Three\n\n" );
	},
	
	/*
	Method: link
		Convenience for Textile links

	Arguments:
		element - textarea, can be either element ID or object
	*/	
	link: function( el ) {
		var link = prompt( "Please enter the site's URL:" ) || 'http://';
		this.wrapSelection( el, '"', '":'+link );
	},
	
	/*
	Method: heading1
		Convenience for Textile H1

	Arguments:
		element - textarea, can be either element ID or object
	*/
	heading1: function( el ) {
		this.wrapSelection( el, "\nh1. ", "\n\n" );
	},
	
	/*
	Method: heading2
		Convenience for Textile H2

	Arguments:
		element - textarea, can be either element ID or object
	*/
	heading2: function( el ) {
		this.wrapSelection( el, "\nh2. ", "\n\n" );
	},
	
	/*
	Method: heading3
		Convenience for Textile H3

	Arguments:
		element - textarea, can be either element ID or object
	*/
	heading3: function( el ) {
		this.wrapSelection( el, "\nh3. ", "\n\n" );
	}
	
};

window.addEvent( 'domready', function(e) {
	// collect all the textarea with "editor" class only for IE 6/7

	if( window.ie ) {
		var areas = $$('textarea.editor');
		if( areas.length ) { areas.each( function( element,index ) {
			element.addEvents( {
				'keyup': function(e) {
					TSN.InlineEditor.ieStoreCarat( element );
				},
				'mouseup': function(e) {
					TSN.InlineEditor.ieStoreCarat( element );
				}
			});
		}) }
	}
});