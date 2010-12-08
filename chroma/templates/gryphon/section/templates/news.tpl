   {% extends "gryphon/base.tpl" %}

{% block title %} :: {{ section.name }}{% endblock %}
{% block active %}news{% endblock %}
{% block subActive %}News{% endblock %}

{% block content %}


{% set topStory = articles.shift() %}
{% set featuredStories = articles.shift(2) %}
{% import "macros/article.tpl" as articleRender %}

<div class="grid_8">
	<div class="alpha grid_5">
		{{ articleRender.abstract5Col(topStory) }}		
		
		<hr class="spacer" />

		<h5 class="bordered">MORE News:</h5>

			<ul>
				{% for article in articles %}
					<li><h4><a href="{{ article.url }}">{{ article.headline }}</a></h4> <span class="small">(updated {{ article.updated|timeSince }})</span></li>
				{% endfor %}
			</ul>
		
	</div>
	<div class="omega grid_3">
		<h5 class="bordered">
			NEWS:
		</h5>
		{% for article in featuredStories %}
			{{ articleRender.abstract3Col(article) }}
		{% endfor %}
	</div>

	<hr class="spacer" />
	
	<div class="alpha grid_6">
		<h5 class="bordered">
			NATION &amp; WORLD:
			<span>powered by <a href="http://nytimes.com">The New York Times</a></span>
		</h5>
		

		{% fetch items from nyt:newswireItem with [
			'order': 'updated desc',
			'limit': 8
		] %}
		<div class="grid_3 alpha">
			<ul>
			{% for item in items.shift((items.length)/2) %}
				<li>
					<h4><a href="{{ item.url }}">{{ item.title }}</a></h4><br />
					<span class="small">{{ item.byline }}</span>
					
					<p>{{ item.abstract }}</p>
				</li>
			{% endfor %}
			</ul>
		</div>
		<div class="grid_3 omega">
			<ul>
			{% for item in items %}
				<li>
					<h4><a href="{{ item.url }}">{{ item.title }}</a></h4><br />
					<span class="small">{{ item.byline }}</span>
					
					<p>{{ item.abstract }}</p>
				</li>
			{% endfor %}
			</ul>
		</div>
			
		<hr />
		<a href="http://developer.nytimes.com/" style="border:none;"><img src="{{ 'images/poweredby_nytimes_150c.png'|url }}" border="0" style="border:none;"/></a>

	</div>
	<div class="omega grid_2">
		{% include "gryphon/ads/skyscraper.tpl" %}
	</div>

</div>

<div class="grid_4">
	{% include "gryphon/main/sidebar-standard.tpl" %}
</div>

<hr class="spacer" />

{% endblock content %}