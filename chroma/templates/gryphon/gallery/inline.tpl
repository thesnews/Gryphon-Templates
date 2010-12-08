{% helper dswSync %}
<img src="{{ 'style/gryphon/images/expandable_close.png'|url }}" class="close" />
<div class="inline_gallery" id="gallery_{{ gallery.uid }}">

	{% set i = 1 %}

	<div class="pagination">
		<a href="{{ gallery.urlDefault~'/'~previousImage.uid }}" class="previous">&#171;</a>
		<div class="overflow_wrapper"><div>
			{% for item in gallery.mediaOrdered %}
				<a href="{{ [gallery.urlDefault, item.uid]|join('/') }}" id="gallery_item_{{ item.uid }}"{% if item.uid == image.uid %} class="selected"{% endif %}>{{ i }}</a>
				{% set i = i+1 %}
			{% endfor %}
		</div></div>
		<a href="{{ gallery.urlDefault~'/'~nextImage.uid }}" class="next">&#187;</a>
	</div>

	<div class="gallery_image image">

		<img src="{{ image.url }}" class="photo shadow-item" />

		<div class="info small">
			<span>{{ image.authors.splat('name')|join(', ') }}
			&middot; {{ image.source }}</span>
			
			<span>Posted: {{ image.created|timeSince }}</span>
	
			<span><a href="{{ gallery.urlDefault~'/'~image.uid }}" class="permalink">Link to this</a></span>
			
			<span><a href="{{ 'gryphon:gallery'|url }}">More galleries</a></span>

			{% if dswSync.buyURL(image) %}
				<a href="{{ dswSync.buyURL(image) }}" class="reprint"><img style="border: none;" class="reprint_icon" src="{{ 'style/gryphon/images/reprint.png'|url }}" alt="Reprints" /></a>
			{% endif %}

			{{ image.caption_formatted }}

		</div>
	</div>
</div>

<script type="text/javascript">
	setTimeout(function() {
	{% include 'gryphon/gallery/inline.js' %}
	}, 500);	
</script>

<hr />
