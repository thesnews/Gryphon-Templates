{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ section.name }}{% endblock %}
{% block active %}opinion{% endblock %}
{% block subActive %}Letters{% endblock %}

{% block content %}

{% set topStory = articles.shift() %}
{% set featuredStories = articles.shift(2) %}
{% import "macros/article.tpl" as articleRender %}

<div class="grid_8">
	<div class="grid_3 alpha">
		<h5 class="bordered">
			LETTERS:
		</h5>
		{% for article in featuredStories %}
			{{ articleRender.abstract3Col(article) }}
		{% endfor %}
	</div>
	<div class="grid_5 omega">
		{{ articleRender.abstract5Col(topStory) }}		
		
		<hr class="spacer" />

		
	</div>
	

	<hr class="spacer" />
	
	<div class="alpha grid_6">
		<h5 class="bordered">
			MORE LETTERS:
			
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

<div class="grid_4">
	{% include "gryphon/main/sidebar-standard.tpl" %}
</div>

<hr class="spacer" />

{% endblock content %}