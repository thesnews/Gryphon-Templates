{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ section.name }}{% endblock %}
{% block active %}sports{% endblock %}
{% block subActive %}Sports{% endblock %}

{% block content %}

{% set topStory = articles.shift() %}
{% set secondaryStories = articles.shift(3) %}
{% import "macros/articlesports.tpl" as articleRender %}

<div class="grid_12">

	<div class="grid_4 alpha">
		{{ articleRender.abstract4Col(topStory) }}	
		<br />
		<img src="{{ 'style_chroma/images/ads/button.png'|url }}" alt="advertisement" style="float: left" />
		<img src="{{ 'style_chroma/images/ads/button.png'|url }}" alt="advertisement" style="float: right" />
	</div>

	<div class="grid_3">

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
	
	<div class="grid_3">
		{% for article in secondaryStories %}
		{{ articleRender.abstract3Col(article) }}
		{% endfor %}
	
	</div>

	<div class="grid_2 omega">
		<img src="{{ 'style_chroma/images/ads/skyscraper.png'|url }}" alt="advertisement" />
	</div>
	
</div>
<div class="clear"></div>

<div class="grid_12" id="secondary">
	
		<div class="grid_4 alpha">
			{% set topPost = articles.shift() %}
			<h3><a href="{{ topPost.url }}">{{ topPost.headline }}</a></h3>
			<div class="dark byline">
				{% if topPost.authors.length %}
					<a class="author">{{ topPost.authors.splat('name')|join(', ') }}</a>

				{% endif %}
				
				<span class="date">{{ topPost.created|date('M d, Y') }}</span>

			</div>
			<p>{{ topPost.abstract_formatted }}<a href="{{ topPost.url }}" class="dark"><span>More</span></a></p>

<br />
	
		<ul class="more_fromlarger">
				<li><h3>Other Articles from Sports:</h3></li>
			{% for item in articles %}
				<li><h3><a href="{{ item.url }}">{{ item.headline }}</a></h3></li>
			{% endfor %}
			
			</ul>
</div>

		{% fetch blogs from blog with [
			'limit': 5,
			'where': 'status = 1',
			'order': 'self:modified desc',
			'withTags' : ['sports']
		] %}
		
		
		
		<div class="grid_4 alpha">
		<h3>Recent Blog Posts:</h3>
			{% set topPost = blogs.shift().mostRecent %}
			<h3><a href="{{ topPost.url }}">{{ topPost.headline }}</a></h3>
			<div class="dark byline">
				{% if topPost.authors.length %}
					<a class="author">{{ topPost.authors.splat('name')|join(', ') }}</a>
				{% endif %}
				
				<span class="date">{{ topPost.created|date('M d, Y') }}</span>

			</div>
			<p>{{ topPost.abstract_formatted }}<a href="{{ topPost.url }}" class="dark"><span>More</span></a></p>
	<br />

			{% set topPost = blogs.shift().mostRecent %}
			<h3><a href="{{ topPost.url }}">{{ topPost.headline }}</a></h3>
			<div class="dark byline">
				{% if topPost.authors.length %}
					<a class="author">{{ topPost.authors.splat('name')|join(', ') }}</a>
				{% endif %}
				
			<span class="date">{{ topPost.created|date('M d, Y') }}</span>

			</div>
			<p>{{ topPost.abstract_formatted }}<a href="{{ topPost.url }}" class="dark"><span>More</span></a></p>

			<div>
			<ul class="more_fromlarger">
				<li><h3>More from <a href="{{ 'blog'|url }}">Blogs:</a></h3></li>
				{% for blog in blogs %}
					{% set topPost = blog.mostRecent %}
					<li>{{ blog.name }}</li>
					<li><h3><a href="{{ topPost.url }}">{{ topPost.headline }}</a></h3>
					</li>
					{% endfor %}

			</ul>
			</div>
	</div>

	<div class="grid_4 omega">
		
		<h3>Sports:</h3>
		<ul class="grid_2 alpha">
			<li><h3><a href="{{ 'section/baseball'|url }}">Baseball</a></h3></li>
			<li><h3><a href="{{ 'section/basketball'|url }}">Basketball</a></h3></li>
			<li><h3><a href="{{ 'section/crosscountry'|url }}">Cross Country</a></h3></li>
			<li><h3><a href="{{ 'section/fooball'|url }}">Football</a></h3></li>
			<li><h3><a href="{{ 'section/golf'|url }}">Golf</a></h3></li>
			<li><h3><a href="{{ 'section/gymnastics'|url }}">Gymnastics</a></h3></li>
			<li><h3><a href="{{ 'section/fieldhockey'|url }}">Field Hockey</a></h3></li>
			<li><h3><a href="{{ 'section/icehockey'|url }}">Ice Hockey</a></h3></li>
		</ul>
		<ul class="grid_2 omega">
			<li><h3><a href="{{ 'section/rowing'|url }}">Rowing</a></h3></li>
			<li><h3><a href="{{ 'section/soccer'|url }}">Soccer</a></h3></li>
			<li><h3><a href="{{ 'section/softball'|url }}">Softball</a></h3></li>
			<li><h3><a href="{{ 'section/swimming'|url }}">Swimming &amp; Diving</a></h3></li>

			<li><h3><a href="{{ 'section/track'|url }}">Track &amp; Field</a></h3></li>
			<li><h3><a href="{{ 'section/volleyball'|url }}">Volleyball</a></h3></li>
			<li><h3><a href="{{ 'section/wrestling'|url }}">Wrestling</a></h3></li>
		</ul>
		
		<img src="{{ 'style_chroma/images/ads/square.png'|url }}" alt="advertisement" />

<!-- Insert add gid_4 here-->

	</div>
	
{% endblock content %}
