{% import "macros/render.tpl" as render %}
{% helper dswSync %}
<img src="{{ 'style/gryphon/images/expandable_close.png'|url }}" class="close" />

<div class="image">
	<a href="{{ media.urlDefault }}"><img src="{{ media.urlOriginal }}" class="photo shadow-item" alt="{{ media.title }}" /></a>

	<div class="info small">
		<span>{{ media.authors.splat('name')|join(', ') }}
		&middot; {{ media.source }}</span>
		
		<span>Posted: {{ media.created|timeSince }}</span>

		{% if dswSync.buyURL(media) %}
			<a href="{{ dswSync.buyURL(media) }}" class="reprint"><img style="border: none;" class="reprint_icon" src="{{ 'style/gryphon/images/reprint.png'|url }}" alt="Reprints" /></a>
		{% endif %}
	</div>

	<div class="caption small">
		{{ media.caption_formatted }}
	</div>

</div>

<hr />