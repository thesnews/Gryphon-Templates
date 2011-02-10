{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ section.name }}{% endblock %}
{% block active %}features{% endblock %}
{% block subActive %}Features{% endblock %}

{% block content %}

{% set topStory = articles.shift() %}
{% set secondaryStories = articles.shift(3) %}
{% import "macros/articlefeatures.tpl" as articleRender %}


<div class="grid_3 alpha">
	
		{% for article in secondaryStories %}
		{{ articleRender.abstract3Col(article) }}
		{% endfor %}
	
	
	<div>
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
</div>

<div class="grid_5">
	
	<div class="grid_5 alpha">
		{{ articleRender.abstract5Col(topStory) }}	
	</div>
	
	<div class="grid_5 alpha omega">
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


<div class="grid_4 omega">
	<div>
			<div class="dark featured_multimedia" id="featured_multimedia">
	
			<h3>Featured Multimedia</h3>
			
			<div id="featured_multimedia1">
				{% fetch multimedia from media with [
				'limit': 1,
				'order': 'self:weight desc, self:created desc',
				'withTags': ['Multimedia Box']
				] %}
				
				{% include "gryphon/main/box.tpl" %}
			</div>


			<ul>
		        <li><a href="#featured_multimedia1">1</a></li>

		    </ul>
		    
			</div>
		
	</div>
	<br />
	<img src="{{ 'style_chroma/images/ads/square.png'|url }}" />
	<img src="{{ 'style_chroma/images/ads/square.png'|url }}" />
	<br />
</div>



{% endblock content %}
