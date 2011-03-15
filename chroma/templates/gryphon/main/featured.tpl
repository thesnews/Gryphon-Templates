<div id="featured_stories">
	<ul class="tab-box">
	{% fetch article from articles with [
		'limit': 3,
		'order': 'self:weight desc, self:created desc',
		'withTags': ['Multimedia']
	] %}
	{% for media in multimedia %}
		<li>
			<div class="img_button_1">
				<a href="#" class="tab-header">
					<img src="{{ media.url }}" alt="{{ media.title }}" />
				</a>
			</div>
			<div class="bullet">
			<a href="{{ media.urlDefault }}">
				<img src="{{ media.url }}" alt="{{ media.title }}" />
			</a>
				<div class="caption">
					<h3>{{ media.title }} | {{ media.type }}</h3>
					<p>{{ media.caption|clip(100) }}</p>
				</div>
			</div>
		</li>
	{% endfor %}
	</ul>
</div>
