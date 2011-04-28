{% helper dswSync %}
<div>
	<div>
		<img src="{{ media.url }}" />
	</div>
	<div>
		<h2>{{ media.title }}</h2>
	
		<div class="dark byline">
			{{ media.fileType|capitalize }}:
			{% if media.authors.length %}
			<a class="author">{{ media.authors.splat('name')|join(', ') }}</a>
			{% endif %}
			<span class="date">{{ media.created|date('M d, Y') }}</span>
		</div>
		{{ media.caption_formatted }}
		
	</div>
	
</div>
