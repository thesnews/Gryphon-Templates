<div id="featured_stories">
	<ul class="tab-box">
	
		{% fetch articles from article with [
			'limit': 3,
			'withTags': ['featuredSlider']
			] 
		%}

		{% for article in articles %}
		
		{% set images = article.media.grab('type', 'image', true) %}

	
		
	
		
		<li>
			<div>
				{% for image in images %}
				<a href="#" class="tab-header">
					<img src="{{ image.url }}"  alt="{{ article.headline }}" />
				</a>
				{% endfor %}
			</div>
			<div class="bullet">
				{% for image in images %}
				<a href="{{ article.url }}">
					<img src="{{ image.url }}"  alt="{{ article.headline }}" />
				</a>
				{% endfor %}
				<div class="caption">
					<h3><a href="{{ article.url }}">{{ article.headline }}</a></h3>
					<p>{{ article.abstract_formatted|clip(300) }}</p>
				</div>
			</div>
		</li>
		
		{% endfor %}
	</ul>
</div>
