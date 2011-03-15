document.addEvent('domready', function() {

	new Rose.ui.inlineGallery('gallery_{{ gallery.uid }}', {
		pagerSelector: '.inline_gallery .pagination a',
		imageSelector: '.gallery_image > img',
		captionSelector: '.gallery_image .info p',
		
		onSelect: function() {
			var current = this.container.getElements(
				this.options.imageSelector).pop();
				
			var coords = current.getCoordinates();
			var mask = new Element('div', {
				'class': 'inline_gallery_mask',
				styles: {
					position: 'absolute',
					top: coords.top + (coords.height/2 - 20),
					left: coords.left + (coords.width/2 - 20),
					opacity: 0.9,
					height: 40,
					width: 40
				}
			});

			$(document.body).adopt(mask);
			this.options.mask = mask;
		},
		
		onChange: function(data) {
			this.options.mask.destroy();
			
			var current = data.image;
			var authorNames = [];
			$H(current.authors).each(function(a) {
				authorNames.push(a.name.unencode());
			});
			
			var meta = this.container.getElements('.info').pop();
	
			meta.getFirst().set('html', authorNames.join(', '));
			
			var date = new Date(current.modified*1000);
			
			meta.getFirst().getNext().set('html', 'Posted: '+
				date.format('%m/%d/%y %I:%M%p'));
				
			var reprint = this.container.getElements('.reprint');
			if( reprint.length ) {
				reprint = reprint.pop();
			}
			
			if( reprint.length ) {
				var uri = reprint[0].get('href').toURI();
				uri.setData({
					'object_name': current.uid
				}, true);
				
				reprint[0].set('href', uri);
			}
			
			var base = data.gallery.urlDefault.unencode();
			
			var p = this.container.getElements('.pagination').pop();
			p.getFirst().set('href', base+'/'+data.previousImage.uid);
			p.getLast().set('href', base+'/'+data.nextImage.uid);
			
			var permalink = this.container.getElements('.permalink');
			if( permalink.length ) {
				permalink = permalink.pop();
			}
			
			if( permalink ) {
				var uri = permalink.get('href').toURI();
				uri.set('file', current.uid);
				
				permalink.set('href', uri);
			}
			
			var link = $('gallery_item_'+current.uid);
			link.getSiblings().removeClass('selected');
			link.addClass('selected');
			
			new Fx.Scroll(link.getParent().getParent(), {
				offset: {
					x: -200
				}
			}).toElement(link);
			
			
		}
	});
});