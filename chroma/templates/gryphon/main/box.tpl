			

	{% for media in multimedia %}
		<a href="{{ media.urlDefault }}">
	    <img src="{{ media.url }}" alt="{{ media.title }}" />
	    </a>
		<div class="caption">
			<p>
				{{ media.type }}: {{ media.title }}
				<br />
				{{ media.caption|clip }}
	
			</p>
		</div>
	{% endfor %}	
