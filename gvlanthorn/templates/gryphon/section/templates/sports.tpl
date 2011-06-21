{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ section.name }}{% endblock %}
{% block active %}sports{% endblock %}
{% block subActive %}Sports{% endblock %}

{% block content %}

{% set topStory = articles.shift() %}
{% set secondaryStories = articles.shift(3) %}
{% import "macros/article.tpl" as articleRender %}


<div class="grid_8">
	
	<div class="grid_5 alpha">

		{{ articleRender.abstract5Col(topStory) }}		
	
	</div>

	<div class="grid_3 omega">
	{% fetch secondaryStories from article with [
		'limit': 2,
		'order': 'weight desc, created desc',
		'where': 'status = 1',
		'withTags': ['sports']
		]
		%}

	
		{% for article in secondaryStories %}
			{{ articleRender.abstract3Col(article) }}
		{% endfor %}			
				
	</div>
	<div class="clear">&nbsp;</div>
	
	<hr class="grid_8 thick mb alpha omega" />
		{% fetch sports from article with [
			'limit': 8,
			'where': 'status = 1',
			'order': 'self:modified desc',
			'withTags': ['sports']
			] 
		%}	
			
		{% for i in 0..(sports.length-1) %}
		{% set article = sports[i] %}

		{% if i%2 == 1 %}
			<div class="grid_4 omega">
		{% else %}
			<div class="grid_4 alpha">
		{% endif %}


		<ul class="mb">
			<li>
			
				<h3><a href="{{ article.url }}">{{ article.headline }}</a></h3>
				
				<div class="byline aside mmb">
					<span class="dateline">{% if article.authors.length %}By {{ article.authors.splat('name')|join(', ') }}{% endif %} | {{ article.created|date('M d') }}</span>
				</div>
		
					
				<div class="thumb">
						<a href="{{ article.url }}"><img src="{{ article.media[0].urlThumbnail }}" alt="{{ article.media[0].title }}" /></a>
				</div>
		
		
				<div class="abstract mb">
					{{ article.abstract_formatted|clip(200) }}
				</div>
			
			</li>
		</ul>

		</div>

		{% if i%2 == 1 %}
		<div class="clear"></div>
		{% endif %}

		{% endfor %}
	
</div>

<div class="grid_4">
	{% include 'gryphon/main/side_bar.tpl' %}
</div>

<div class="clear">&nbsp;</div>




{% endblock content %}