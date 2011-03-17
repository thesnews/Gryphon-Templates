{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ section.name }}{% endblock %}
{% block active %}opinion{% endblock %}
{% block subActive %}Columns{% endblock %}

{% block content %}

{% set topStory = articles.shift() %}
{% set featuredStories = articles.shift(2) %}
{% import "macros/articleopinion.tpl" as articleRender %}

	<div class="grid_3 alpha">
	{% set topPost = articles.shift() %}
			<h2><a href="{{ topPost.url }}">{{ topPost.headline }}</a></h2>
			<div class="dark byline">
				{% if topPost.authors.length %}
					<a class="author">{{ topPost.authors.splat('name')|join(', ') }}</a>

				{% endif %}
				
				<span class="date">{{ topPost.created|date('M d, Y') }}</span>

			</div>
			<p>{{ topPost.abstract_formatted|clip(250) }}<a href="{{ topPost.url }}" class="dark"><span>More</span></a></p>


				
			{% set topPost = articles.shift() %}
			<h2><a href="{{ topPost.url }}">{{ topPost.headline }}</a></h2>
			<div class="dark byline">
				{% if topPost.authors.length %}
					<a class="author">{{ topPost.authors.splat('name')|join(', ') }}</a>

				{% endif %}
				
				<span class="date">{{ topPost.created|date('M d, Y') }}</span>

			</div>
			<p>{{ topPost.abstract_formatted|clip(250) }}<a href="{{ topPost.url }}" class="dark"><span>More</span></a></p>

{% set topPost = articles.shift() %}
			<h2><a href="{{ topPost.url }}">{{ topPost.headline }}</a></h2>
			<div class="dark byline">
				{% if topPost.authors.length %}
					<a class="author">{{ topPost.authors.splat('name')|join(', ') }}</a>

				{% endif %}
				
				<span class="date">{{ topPost.created|date('M d, Y') }}</span>

			</div>
			<p>{{ topPost.abstract_formatted|clip(250) }}<a href="{{ topPost.url }}" class="dark"><span>More</span></a></p>


	</div>



	<div class="grid_5">
		{{ articleRender.abstract6Col(topStory) }}		
			{% set topPost = articles.shift() %}
			<h2><a href="{{ topPost.url }}">{{ topPost.headline }}</a></h2>
			<div class="dark byline">
				{% if topPost.authors.length %}
					<a class="author">{{ topPost.authors.splat('name')|join(', ') }}</a>

				{% endif %}
				
				<span class="date">{{ topPost.created|date('M d, Y') }}</span>

			</div>
			<p>{{ topPost.abstract_formatted|clip(250) }}<a href="{{ topPost.url }}" class="dark"><span>More</span></a></p>


	{% set topPost = articles.shift() %}
			<h2><a href="{{ topPost.url }}">{{ topPost.headline }}</a></h2>
			<div class="dark byline">
				{% if topPost.authors.length %}
					<a class="author">{{ topPost.authors.splat('name')|join(', ') }}</a>

				{% endif %}
				
				<span class="date">{{ topPost.created|date('M d, Y') }}</span>

			</div>
			<p>{{ topPost.abstract_formatted|clip(250) }}<a href="{{ topPost.url }}" class="dark"><span>More</span></a></p>

	</div>

	
<div class="grid_4 omega">
			<ul>
			<li><h3>
			More from Columns:</h3></li>
				{% for article in articles %}
					<li><h4><a href="{{ article.url }}">{{ article.headline }}</a></h4> </li>
				{% endfor %}
			</ul>
		
			<img src="{{ 'style_chroma/images/ads/button.png'|url }}" alt="advertisement" />
			<img src="{{ 'style_chroma/images/ads/button.png'|url }}" alt="advertisement" />

</div>

{% endblock content %}