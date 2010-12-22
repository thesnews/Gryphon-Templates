{% import "macros/render.tpl" as render %}
<div>
	<h3 class="grid_6 alpha">Multimedia: {{ media.title }}</h3>	
	<div class="text-right">
		<a href="#" class="light"><img src="{{ 'style/gryphon/images/expandable_lights.png'|url }}" /></a>
		<a href="#" class="close"><img src="{{ 'style/gryphon/images/expandable_close.png'|url }}" /></a>
	</div>
	<div class="clear-fix"></div>
</div>

<div>
	{{ render.media(media) }}
</div>

<div>
	{{ media.caption_formatted }}

	<div class="small box">
		{% if media.authors.length %}
			<span>By: {{ media.authors.splat('name')|join(', ') }}</span>
		{% endif %}
		
		<span>Posted: {{ media.created|timeSince }}</span>
		
		<span><a href="{{ media.urlDefault }}">Permalink</a></span>
		
		<span><a href="{{ 'gryphon:multimedia' }}">More Multimedia &#187;</a></span>
	</div>
</div>
