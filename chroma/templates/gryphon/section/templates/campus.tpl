{% extends "gryphon/base.tpl" %}

{% block title %}The State News :: Campus{{ section.name }}{% endblock %}
{% block active %}news{% endblock %}
{% block subActive %}Campus{% endblock %}

{% block content %}

{% set topStory = articles.shift() %}
{% set featuredStories = articles.shift(2) %}
{% import "macros/articlecampus.tpl" as articleRender %}

<div class="grid_12">

	<div class="grid_5 alpha">
		{{ articleRender.abstract5Col(topStory) }}		
		

			<ul class="more_fromlarger">
			<li>
			<h3>
			More from Campus:
			</h3>
			</li>
				{% for article in articles %}
					<li><h4><a href="{{ article.url }}">{{ article.headline }}</a></h4> </li>
				{% endfor %}
			</ul>
		
	</div>
	<div class="grid_3">

		{% for article in featuredStories %}
			{{ articleRender.abstract3Col(article) }}
		{% endfor %}
	</div>
	

	<div class="grid_4 omega">
		<img src="{{ 'style_chroma/images/ads/square.png'|url }}" alt="advertisement" />
	</div>

</div>


{% endblock content %}