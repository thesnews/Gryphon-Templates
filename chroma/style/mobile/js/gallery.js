window.addEvent('domready', function() {
	if( !$('mobile_gallery') ) {
		return;
	}
	
	var windowCoords = window.getCoordinates();
	var imageCache = $H({});
	
	var touch = new Touch($$('#photo_container .photo').pop());
	$('photo_container').setStyle('position', 'relative');

	touch.addEvent('move', function(dx, dy) {
		$('photo_container').setStyle('left', dx);
	});
	
	touch.addEvent('end', function() {
		var delta = $('photo_container').getStyle('left').toInt();
		var offset = windowCoords.width.toInt()/4;
		
		if( Math.abs(delta) > offset ) {
			if( delta < 0 ) {
				return loadNext();
			} else {
				return loadPrevious();
			}
		}
		
		$('photo_container').tween('left', 0);
	});
	
	var loadNext = function() {
		var uri = $$('#mobile_gallery .next').pop().get('href').toURI();
		uri.set('file', uri.get('file')+'.json');

		loadPhoto('next', uri);
	};
	
	var loadPrevious = function() {
		var uri = $$('#mobile_gallery .previous').pop().get('href').toURI();
		uri.set('file', uri.get('file')+'.json');

		loadPhoto('previous', uri);
	};

	var loadPhoto = function(dir, uri) {
		$('photo_container').tween('opacity', 0);

		var loader = function(data) {
			$$('#photo_container .photo').set('src',
				data[0].image.url.unencode());
			
			$$('#photo_container .photo').setStyle('opacity', 1);
			
			var base = data[0].gallery.urlDefault.unencode();
			
			$$('#mobile_gallery .next').pop().set('href',
				base+'/'+data[0].nextImage.uid);
			$$('#mobile_gallery .previous').pop().set('href',
				base+'/'+data[0].previousImage.uid);

			var authorNames = [];
			$H(data[0].image.authors).each(function(a) {
				authorNames.push(a.name.unencode());
			});
			
			$$('#photo_container .info').set('html',
				authorNames.join(', ')+' &middot '+
				data[0].image.source.unencode());
				
			$$('#photo_container p').set('html',
				data[0].image.caption_formatted.unencode());

		};
		
		
		setTimeout(function() {
			var pos = 1000;
			if( dir == 'previous' ) {
				pos = -1000;
			}
			
			$('photo_container').setStyles({
				'left': pos,
			});
			
			$('photo_container').morph({
				'opacity': 1,
				'left': 0
			});

			$$('#photo_container .photo').setStyle('opacity', 0);
			$$('#photo_container .info').set('html', '');
				
			$$('#photo_container p').set('html','');

			var id = uri.get('file').toInt();
			if( imageCache.has(id) ) {
				loader(imageCache.get(id));
				return;
			}

			new Request.JSON({
				url: uri.toString(),
				onComplete: function(data) {
					imageCache.set(id, data);
				
					var tmp = new Image;
					tmp.onload = function() {
						loader(data);
					};
					tmp.src = data[0].image.url.unencode();
				}
			}).send();

		}, 500);
	
	}
	
});