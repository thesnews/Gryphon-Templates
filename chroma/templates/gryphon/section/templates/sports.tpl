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
	</div>

	<div class="grid_4">
	

		{% for article in secondaryStories %}
		{{ articleRender.abstract3Col(article) }}
		{% endfor %}

	</div>
	
	<div class="grid_4 omega">
	{% include 'gryphon/ads/skyscraper.tpl' %}
	</div>
	
</div>
<div class="clear"></div>

<div class="grid_12" id="secondary">
	
		<div class="grid_4 alpha">
		<h3>More Sports:</h3>
			{% set topPost = articles.shift() %}
			<h3><a href="{{ topPost.url }}">{{ topPost.headline }}</a></h3>
			<div class="dark byline">
				{% if topPost.authors.length %}
					By {{ topPost.authors.splat('name')|join(', ') }}

				{% endif %}
				
				<span class="date">{{ topPost.created|date('M d, Y') }}</span>

			</div>
			<p>{{ topPost.abstract_formatted }}</p>

<br />
		<h3>Other Articles:</h3>
		<ul>
				
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
		
		<h3>Recent Blog Posts:</h3>
		
		<div class="grid_4 alpha">
			{% set topPost = blogs.shift().mostRecent %}
			<h3><a href="{{ topPost.url }}">{{ topPost.headline }}</a></h3>
			<div class="dark byline">
				{% if topPost.authors.length %}
					<a class="author"></a>{{ topPost.authors.splat('name')|join(', ') }}</a>
				{% endif %}
				
				<span class="date">{{ topPost.created|date('M d, Y') }}</span>

			</div>
			<p>{{ topPost.abstract_formatted }}</p>
<br />

			{% set topPost = blogs.shift().mostRecent %}
			<h3><a href="{{ topPost.url }}">{{ topPost.headline }}</a></h3>
			<div class="dark byline">
				{% if topPost.authors.length %}
					<a class="author"></a>{{ topPost.authors.splat('name')|join(', ') }}</a>
				{% endif %}
				
			<span class="date">{{ topPost.created|date('M d, Y') }}</span>

			</div>
			<p>{{ topPost.abstract_formatted }}</p>
		<br />
			<h3>Other Blogs:</h3>
			<div id="sportsblogs">
			<ul>
				{% for blog in blogs %}
					{% set topPost = blog.mostRecent %}
					<li><h3><a href="{{ topPost.url }}">{{ topPost.headline }}</a></h3>
					From: {{ blog.name }}</li>
				{% endfor %}
			</ul>
			</div>
	</div>

		<div class="grid_4 omega">
		
		<h3>Sports:</h3>
		<ul class="grid_2 alpha">
			<li><h3><a href="/index.php/section/baseball">Baseball</a></h3></li>
			<li><h3><a href="/index.php/section/basketball">Basketball</a></h3></li>
			<li><h3><a href="/index.php/section/crosscountry">Cross Country</a></h3></li>
			<li><h3><a href="/index.php/section/football">Football</a></h3></li>
			<li><h3><a href="/index.php/section/Golf">Golf</a></h3></li>
			<li><h3><a href="/index.php/section/gymnastics">Gymnastics</a></h3></li>
			<li><h3><a href="/index.php/section/fieldhockey">Field Hockey</a></h3></li>
			<li><h3><a href="/index.php/section/hockey">Ice Hockey</a></h3></li>
		</ul>
		<ul class="grid_2 omega">
			<li><h3><a href="/index.php/section/rowing">Rowing</a></h3></li>
			<li><h3><a href="/index.php/section/soccer">Soccer</a></h3></li>
			<li><h3><a href="/index.php/section/softball">Softball</a></h3></li>
			<li><h3><a href="/index.php/section/swimmingdiving">Swimming &amp; Diving</a></h3></li>

			<li><h3><a href="/index.php/section/trackfield">Track &amp; Field</a></h3></li>
			<li><h3><a href="/index.php/section/volleyball">Volleyball</a></h3></li>
			<li><h3><a href="/index.php/section/wrestling">Wrestling</a></h3></li>
		</ul>
		
<!-- Insert add gid_4 here-->

	</div>
	
{% endblock content %}
