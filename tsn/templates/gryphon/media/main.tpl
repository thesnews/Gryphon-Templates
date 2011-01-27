<img src="{{ 'style/gryphon/images/expandable_close.png'|url }}" class="close" />
{% import "macros/render.tpl" as render %}

<div>
	{{ render.media(media) }}

	<div class="caption small">
		{{ media.caption_formatted }}
	</div>

	<div class="small box">
		{% if media.authors.length %}
			<span>By: {{ media.authors.splat('name')|join(', ') }}</span>
		{% endif %}
		
		<span>Posted: {{ media.created|timeSince }}</span>
		
		<span><a href="{{ media.urlDefault }}">Permalink</a></span>
		
		<span><a href="{{ 'gryphon:multimedia' }}">More Multimedia &#187;</a></span>
	</div>
</div>
