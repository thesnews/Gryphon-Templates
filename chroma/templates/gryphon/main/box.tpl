<ul class="multimedia-box">
{% for media in multimedia %}
	<li>
		<a href="{{ media.urlDefault }}"><img src="{{ media.url }}" alt="{{ media.title }}" /></a>
		<p>
			<strong>{{ media.type }}: {{ media.title }}</strong>
			<br />
			{{ media.caption|clip }}
		</p>
	</li>
{% endfor %}
</ul>