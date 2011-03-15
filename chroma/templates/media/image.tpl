{% helper dswSync %}
<div class="image">
	<div style="text-align: center;">
	<a href="{{ media.urlDefault }}"><img src="{{ media.url }}" /></a>
	</div>
	<div class="info">
		{{ media.authors.splat('name')|join(', ') }}
		&middot; {{ media.source }}

		{% if dswSync.buyURL(media) %}
			<a href="{{ dswSync.buyURL(media) }}" class="reprint"><img style="border: none;" class="reprint_icon" src="{{ 'style/gryphon/images/reprint.png'|url }}" alt="Reprints" /></a>
		{% endif %}
		
	</div>
</div>