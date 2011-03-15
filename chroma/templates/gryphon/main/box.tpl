	<div class="mutimedia_box dark">
			<h3>Featured Multimedia</h3>
			{% fetch multimedia from media with [
				'limit': 10,
				'order': 'self:weight desc, self:created desc',
				'withTags': ['Multimedia Box']
			] %}

			<ul id="container_multimediaBox">
			{% for media in multimedia %}
				<li>
					<div class="image">
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
