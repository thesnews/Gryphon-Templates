	<div class="mutimedia_box dark">
			<h3>Featured Multimedia</h3>

			<ul id="container_multimediaBox">
			{% for media in multimedia %}
				<li>
					<div class="image">
						<a href="{{ media.urlDefault }}">
							<img src="{{ media.url }}" alt="{{ media.title }}" />
						</a>
						<div class="caption">
							<h3></h3>
							<p>{{ media.caption|clip(100) }}</p>
						</div>
					</div>
				</li>
			{% endfor %}
			</ul>
		</div>
