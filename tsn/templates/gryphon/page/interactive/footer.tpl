	<hr />
	<h5 class="bordered">MORE RECENT MULTIMEDIA:</h5>
	
	{% fetch media from gryphon:media with [
		'limit': 10,
		'order': 'weight desc, created desc',
		'withTags': ['multimedia box']
	] %}
	
	{% for i in 0..(media.length-1) %}
		{% set item = media[i] %}
		
		{% if i%2 == 0 %}
			<div class="grid_4 alpha">
		{% else %}
			<div class="grid_4 omega">
		{% endif %}
			<a href="{{ item.urlDefault }}"><img src="{{ item.urlThumbnail }}" class="thumbnail" /></a>

			<span class="small"><a href="{{ ('gryphon:multimedia/'~item.type)|url }}">{{ item.fileType|capitalize }}</a>:</span>
			
			<h4><a href="{{ item.urlDefault }}">{{ item.title }}</a></h4>
			<span class="small">Posted: {{ item.created|timeSince }}</span>
			{{ item.description|clip(100) }}
			
			<hr class="spacer" />
		</div>

		{% if i%2 != 0 %}
			<hr class="clear-fix" />
		{% endif %}
		
	{% endfor %}
	<hr class="spacer" />
