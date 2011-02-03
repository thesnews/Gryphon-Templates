{% extends "gryphon/base.tpl" %}

{% block title %}The State News :: Campus{{ section.name }}{% endblock %}
{% block active %}news{% endblock %}
{% block subActive %}Campus{% endblock %}

{% block content %}

{% set topStory = articles.shift() %}
{% set featuredStories = articles.shift(2) %}
{% import "macros/articlecampus.tpl" as articleRender %}

<div class="grid_8">
	<div class="alpha grid_5">
		{{ articleRender.abstract5Col(topStory) }}		
		
	</div>
	<div class="omega grid_3">

		{% for article in featuredStories %}
			{{ articleRender.abstract3Col(article) }}
		{% endfor %}
	</div>
	
	<div class="alpha grid_6">
		<h3>
			More from Campus:
			
		</h5>
		
<ul>
				{% for article in articles %}
					<li><h4><a href="{{ article.url }}">{{ article.headline }}</a></h4> </li>
				{% endfor %}
			</ul>
		<div class="grid_6 alpha">
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
			

	</div>
	<div class="omega grid_2">
		{% include "gryphon/ads/skyscraper.tpl" %}
	</div>

</div>


{% endblock content %}