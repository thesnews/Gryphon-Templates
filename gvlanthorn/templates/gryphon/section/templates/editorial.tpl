{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ section.name }}{% endblock %}
{% block active %}editorial{% endblock %}
{% block subActive %}Editorials{% endblock %}

{% block content %}

{% set topStory = articles.shift() %}
{% set featuredStories = articles.shift(2) %}
{% import "macros/article.tpl" as articleRender %}

<div class="grid_8">


	<div class="grid_5 alpha">


		{% fetch cartoon from media with [
			'limit': 1,
			'order': 'self:weight desc, self:created desc',
			'withTags': ['cartoon']
		] %}

			{% for media in cartoon %}
					<div class="image">
					<img src="{{ media.url }}" alt="{{ media.title }}" />
					</div>
					<div class="caption aside mb">Editorial cartoon</div>
			{% endfor %}


		{{ articleRender.abstract5Col(topStory) }}		
	
	</div>

	<div class="grid_3 omega">
	{% fetch secondaryStories from article with [
		'limit': 2,
		'order': 'weight desc, created desc',
		'where': 'status = 1',
		'withTags': ['lakerlife']
		]
		%}

	
		{% for article in secondaryStories %}
			{{ articleRender.abstract3Col(article) }}
		{% endfor %}			
				
	</div>
	<div class="clear">&nbsp;</div>
	
	<hr class="grid_8 thick mb alpha omega" />
		{% fetch lakerlife from article with [
			'limit': 6,
			'where': 'status = 1',
			'order': 'self:modified desc',
			'withTags': ['lakerlife']
			] 
		%}	
			
		{% for i in 0..(lakerlife.length-1) %}
		{% set article = lakerlife[i] %}

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