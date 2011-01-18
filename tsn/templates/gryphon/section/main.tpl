   {% extends "gryphon/base.tpl" %}

{% block title %} :: {{ section.name }}{% endblock %}
{% block active %}news{% endblock %}
{% block subActive %}News{% endblock %}

{% block content %}


{% set topStory = articles.shift() %}
{% set featuredStories = articles.shift(3) %}
{% import "macros/article.tpl" as articleRender %}

<div class="grid_8">

	<div class="grid_3 alpha">
	
		{{ section.sidebar_formatted }}
	
		<h5 class="bordered">
			{{ section.name }}
		</h5>
		{% for article in featuredStories %}
			{{ articleRender.abstract3Col(article) }}
		{% endfor %}
	</div>
	<div class="grid_5 omega">

		{{ articleRender.abstract5Col(topStory) }}		
		
	</div>
	

	<hr class="spacer" />
	
	<div class="alpha grid_6">
		<h5 class="bordered">
			MORE:
		</h5>
		

		{% for article in articles %}
			{{ articleRender.abstract3Col(article) }}
		{% endfor %}


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