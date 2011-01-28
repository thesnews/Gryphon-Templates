{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ section.name }}{% endblock %}
{% block active %}features{% endblock %}
{% block subActive %}Features{% endblock %}

{% block content %}

{% set topStory = articles.shift() %}
{% set secondaryStories = articles.shift(3) %}
{% import "macros/articlefeatures.tpl" as articleRender %}

<div class="grid_12">

	<div class="grid_12 alpha">
		{{ articleRender.abstract5Col(topStory) }}	

	</div>
	
		<div class="grid_12 alpha">
		</div>
	<div class="grid_3">
		<h3>Featured Multimedia</h3>	
		{% fetch multimedia from media with [
			'limit': 7,
			'order': 'self:weight desc, self:created desc',
			'withTags': ['Multimedia Box']
		] %}	
		<ul class="more_from">
			<li><h3>More from <a href="#">News</a>:</h3></li>
			{% for article in articles %}
			<li><h4><a href="{{ article.url }}">{{ article.headline }}</a></h4>({{ article.created|date('M d') }})</li>
			{% endfor %}
		</ul><br />
		<span><h3><a href="{{ 'multimedia'|url }}">More multimedia &#187;</a></h3></span>
	</div>

	<div class="grid_3 omega">
	&nbsp	
	</div>
	
	
	
	<div class="clear"></div>	
	
	
	
			<div class="grid_3 alpha">
			<h5>MORE FEATURES</h5>
			<ul>
				{% for article in articles %}
					<li>
					<h4>
					<a href="{{ article.url }}">
					{{ article.headline }}
					</a>
					</h4> 
					<span class="small">(updated {{ article.modified|timeSince }})</span></li>
				{% endfor %}
			</ul>
	
			</div>
			<div class="grid_3">
				<h5>
					Blogs:
					<span><a href="{{ 'blog'|url }}">More blogs &#187;</a></span>
				</h5>
				{% fetch blogs from blog with [
					'limit': 8,
					'where': 'status = 1',
					'order': 'self:modified desc'
				] %}
				<ul>
					{% for blog in blogs %}
						<li>
						<div class="small">
							{{ blog.name }}
						</div>
						{% set topPost = blog.mostRecent %}
						<h4><a href="{{ topPost.url }}">{{ topPost.headline }}</a></h4>
						</li>
					{% endfor %}
				</ul>
			</div>		
			
			<div class="grid_2 omega">
				<img src="{{ 'style_chroma/images/ads/skyscraper.png'|url }}" />
			</div>
			
			<div class="grid_4 omega">
			</div>





{% endblock content %}
