{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ section.name }}{% endblock %}
{% block active %}features{% endblock %}
{% block subActive %}Features{% endblock %}

{% block content %}

{% set topStory = articles.shift() %}
{% set secondaryStories = articles.shift(3) %}
{% import "macros/articlefeatures.tpl" as articleRender %}

<div class="grid_12">

<div class="grid_3 alpha">
	
		{% for article in secondaryStories %}
		{{ articleRender.abstract3Col(article) }}
		{% endfor %}

</div>

<div class="grid_5">

		{{ articleRender.abstract5Col(topStory) }}	
	
	<ul class="more_fromlarger">
			<li><h3>More from Features:</h3></li>
				{% for article in articles %}
					<li>
					<h4>
					<a href="{{ article.url }}">
					{{ article.headline }}
					</a>
					</h4> 
					</li>
				{% endfor %}
		</ul>

</div>

<div class="grid_4 omega">

		{% include 'gryphon/main/box.tpl' %}	
		
	<br />
	<h3>Featured Blogs</h3>
			<ul class="more_from">
					
				{% fetch blogs from blog with [
					'limit': 7,
					'where': 'status = 1',
					'order': 'self:modified desc'
				] %}
			
					{% for blog in blogs %}
						<li>
						<div class="small">
							<h3>{{ blog.name }}</h3>
						</div>
						{% set topPost = blog.mostRecent %}
						<h4><a href="{{ topPost.url }}">{{ topPost.headline }}</a></h4>
						</li>
					{% endfor %}
				<li><h3>More from <a href="{{ 'blog'|url }}">Blogs</a></h3></li>
				</ul>

</div>

</div>


{% endblock content %}
