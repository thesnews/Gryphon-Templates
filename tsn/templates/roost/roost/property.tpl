{% extends 'gryphon/base.tpl' %}

{% block title %} :: {{ property.name }}{% endblock %}
{% block active %}{% endblock %}
{% block subActive %}Housing Guide{% endblock %}

{% block scripts %}
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
	<script type="text/javascript" src="{{ 'roost/frontend/javascript/master.js'|url }}"></script>
	<script type="text/javascript" src="{{ 'javascript/inlineGallery.js'|url }}"></script>
{% endblock %}

{% block styles %}
	<link rel="stylesheet" type="text/css" media="screen" href="{{ 'roost/frontend/style/screen/master.css'|url }}" />
{% endblock %}

{% block content %}
	{% helper adpilotHelper as ads %}
	{% helper config %}

	{#
	  This fetches related properties by owner. If the owner doesn't have any
	  other properties, this fectches other properties with the same rent level.
	#}
	{% set related = property.getRelated(3) %}
	{% set relatedLabel = 'Related Properties' %}
	
	{% if related.length == 0 %}
		{% set related = property.getSimilar('rent', property.rent, '3') %}
		{% set relatedLabel = 'Similar Properties' %}
	{% endif %}
	
	{% set images = property.propertyAssets.grab('type', 'image') %}
	{% set docs = property.propertyAssets.grab('type', 'document') %}
	{% set videos = property.propertyAssets.grab('type', 'video') %}
	
	{% set amenitiesMap = config.get('roost:amenitiesMap') %}
	
	<div class="grid_8">
		<div id="housing_finder_header">
			<a href="{{ 'roost:roost'|url }}""><img src="{{ 'roost/frontend/style/images/housing-header.gif'|url }}" alt="SN Housing Guide" style="border:0;" border="0" /></a>
			<div id="housing_sponsor">{{ ads.display('housingsponsor') }}</div>
		</div>
		
		<div id="listing_header" class="gray">
			<h2>{{ property.name }}</h2>
			{{ property.address }}
			| <span class="phone">{{ property.phone }}</span>
			{% if property.email %}
				| <a href="{{ ('roost:roost/contact/'~property.uid)|url }}" class="email">Contact via email</a>
			{% endif %}
			{% if property.url %}
				| <a class="website" href="{{ property.url }}">Visit website</a>
			{% endif %}
		</div>
		
		{% if success %}
			<div id="message" class="box success">
				<h4>Message sent</h4>
				
				Your message was successfully sent.
			</div>
			<hr class="spacer" />
		{% elseif errors %}
			<div id="message" class="box error">
				<h3>Oops</h3>
				
				{% for id, label in errors %}
					{{ label }}<br />
				{% endfor %}
			</div>
			<hr class="spacer" />
		{% endif %}
		
		<div class="grid_5 alpha">
			<h5 class="bordered">Summary:</h5>
			
			<p>
				<strong>Type:</strong> {{ property.type }}<br />
				<strong>Lease Duration:</strong> {{ property.leaseLabel }}
				
				{% if property.licensed_for %}
					<br /><strong>Licensed For:</strong> {{ property.licensed_for }}
				{% endif %}
				<hr />
	
				<strong>Bedrooms:</strong> {{ property.bedrooms }}<br />
				<strong>Bathrooms:</strong> {{ property.bathrooms }}
				
				<hr />
			</p>
			
			<div class="price">{{ property.rentLabel }}<br /><span>per {{ property.rent_modifier }}</div>		
			{{ property.description_formatted }}
			
			<hr class="spacer" />
			
			<h5 class="bordered">Photos:</h5>
			{% if images.length %}
				{% set previous = images.peekBack() %}
				{% set next = images[1] %}
				<div class="inline_gallery" id="gallery_1" style="width:350px;">
					<div class="pagination">
						<a href="{{ previous.urlDefault }}" class="previous">&#171;</a>
						<div class="overflow_wrapper"><div>
							{% for item in images %}
								<a href="{{ item.urlDefault }}"{% if loop.index0 == 0 %} class="selected"{% endif %} id="gallery_item_{{ item.uid }}">{{ loop.index }}</a>
							{% endfor %}
						</div></div>
						<a href="{{ next.urlDefault }}" class="next">&#187;</a>
					</div>
					
					<div class="gallery_image image">
						{% set image = images.pop() %}
						<img src="{{ image.url }}" class="photo shadow-item" style="width:300px;" />
						<div class="info">
							{{ image.caption_formatted }}
						</div>
					</div>
										
				</div>
								
			{% else %}
				
				<p>
					Sorry, we don't have any images for this property.
				</p>
				
			{% endif %}
	
			<hr class="spacer" />
			
			<h5 class="bordered">Documents:</h5>
			{% if docs.length %}
				
				<ul id="listing_documents">
				{% for doc in docs %}
					<li>
						{{ doc.caption_formatted }}
						<a href="{{ doc.urlOriginal }}">Download PDF</a>
					</li>
				{% endfor %}
				</ul>
				
			{% else %}
				
				<p>
					Sorry, we don't have any PDF documents for this property.
				</p>
				
			{% endif %}
	
			<hr class="spacer" />
			
			<h5 class="bordered">Videos:</h5>
			{% if videos.length %}
				{% import 'macros/render.tpl' as mediaRender %}
								
				<div id="listing_videos">
				{% for video in videos %}
					<object width="350" height="196" type="application/x-shockwave-flash"
					  data="{{ 'flash/jwplayer/player-viral.swf'|url }}" class="shadow-item">
					  <param name="movie" value="{{ video.urlOriginal }}" />
					  <param name="allowfullscreen" value="true" />
					  <param name="flashvars" value='file={{ video.urlOriginal }}&image={{ video.url }}&viral.callout=always&viral.onpause=false&viral.link={{ video.urlDefault }}' />
					  <!-- Image Fallback. Typically the same as the poster image. -->
					  <img src="{{ video.url }}" width="350" height="196" alt="Poster Image"
						title="No video playback capabilities." />
					</object>
				{% endfor %}
				</div>
				
			{% else %}
				
				<p>
					Sorry, we don't have any videos for this property.
				</p>
				
			{% endif %}
			
			<hr />
			
			<p class="small">
				Continued use of this service implies acceptance of the <a href="{{ 'roost:roost/tos'|url }}">Terms of Service</a>.
			</p>
			
		</div>
		<div class="grid_3 omega">
		
			<h5 class="bordered">Amenities:</h5>

			{% set half = amenitiesMap|length//2 %}
			<ul class="listing_features" id="left">
			{% for amenity, label in amenitiesMap %}
				{% if loop.index0 == half %}
					</ul>
					<ul class="listing_features" id="right">
				{% endif %}
				<li{% if property[amenity] %} class="pos"{% endif %}>{{ label }}</li>				
			{% endfor %}
			</ul>
			<div class="clear"></div>
	
			<h5 class="bordered">Map:</h5>
	
			<a href="{{ property.urlMap }}"><img id="listing_map" src="{{ property.urlStaticMapBig }}" alt="{{ property.urlStaticMapBig }}" /></a>
			<a href="{{ property.urlMap }}" class="button">Get Driving Directions &#187;</a>
	
			<hr class="spacer" />
	
			<div class="box gray" id="mailform">
				<strong>Email listing:</strong>
				<form method="post" action="{{ ('roost:roost/send/'~property.uid )|url }}">
				
				<label for="input_mailName">Your name:</label>
				<input type="text" name="sender_name" id="input_mailName" value="" /><br />
				
				<label for="input_mailSender">Your email:</label>
				<input type="text" name="sender" id="input_mailSender" value="" /><br />
				
				<label for="input_mailReceiver">To email:</label>
				<input type="text" name="receiver" id="input_mailReceiver" value="" /><br />
	
				<input type="hidden" name="mailKey" value="{{ mailKey }}" />
				
				<br />
				<input type="submit" value="Send" />
				
				</form>
				
			</div>
	
		</div>
	
		<hr class="spacer" />
	
		<hr />
		
		<a href="{{ 'roost/mobile'|url }}"><img src="{{ 'roost/frontend/style/images/mobile-banner.png'|url }}" alt="The Housing Guide mobile version" /></a>
		
		<hr class="spacer" />
		
		<div class="grid_8 alpha omega">
			{% if related.length %}
			
				<h5 class="bordered">{{ relatedLabel }}</h5>
				<div id="search_results">
					<ul>
					{% for prop in related %}
						<li>
							{% if prop.name == prop.street %}
								{% set useName = prop.street %}
							{% else %}
								{% set useName = prop.name~', '~prop.street %}
							{% endif %}

							<h4><a href="{{ prop.listingUrl }}">{{ useName }} {{ prop.city }}</a></h4>
							<div class="info_wrap">
								<div class="price">{{ prop.rentLabel }}<br /><span>per {{ prop.rent_modifier }}</div>		
								<div class="description">
									{{ prop.summary_formatted }}
								</div>
							</div>
							<a href="{{ prop.urlMap }}"><img src="{{ prop.urlStaticMap }}" /></a>
							<div class="contact_info">
								<span class="phone">{{ prop.phone }}</span>
								{% if prop.email %}
									<a class="email" href="{{ ('roost/contact/'~prop.uid)|url }}" class="email">Contact via email</a>
								{% endif %}
								{% if prop.url %}
									<a class="website" href="{{ prop.url }}">Visit website</a>
								{% endif %}
								<a class="listing_link" href="{{ prop.listingUrl }}">View Full Listing &rarr;</a>
							</div>
		
						</li>
					{% endfor %}
					</ul>
				</div>
			{% endif %}	
		</div>
	
	</div>
	<div class="grid_4">
		{% include 'gryphon/main/sidebar-standard.tpl' %}
	</div>
	<hr class="spacer" />
	<script type="text/javascript">
	document.addEvent('domready', function() {
		if( !$('gallery_1') ) { return; }
		
		new Rose.ui.inlineGallery('gallery_1', {
			pagerSelector: '.inline_gallery .pagination a',
			imageSelector: '.gallery_image > img',
			captionSelector: '.gallery_image .info p',
			
			onChange: function(data) {
				var current = data.image;
				var authorNames = [];
				$H(current.authors).each(function(a) {
					authorNames.push(a.name.unencode());
				});
				
				var meta = this.container.getElements('.info').pop();
				if( meta ) {
					meta.set('html', current.caption_formatted.unencode());
				}
				
				var link = $('gallery_item_'+current.uid);
				link.getSiblings().removeClass('selected');
				link.addClass('selected');
				
				var next = link.getNext();
				if( !next ) {
					next = link.getParent().getFirst();
				}
				
				var prev = link.getPrevious();
				if( !prev ) {
					prev = link.getParent().getLast();
				}

				this.container.getElements('.next').set('href',
					next.get('href'));
				this.container.getElements('.previous').set('href',
					prev.get('href'));
				
				new Fx.Scroll(link.getParent().getParent(), {
					offset: {
						x: -200
					}
				}).toElement(link);
				
				
			}
		});
	});
	</script>
{% endblock %}