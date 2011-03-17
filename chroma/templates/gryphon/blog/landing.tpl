{% extends "gryphon/base.tpl" %}


{% block title %} :: Blogs{% endblock %}
{% block active %}blogs{% endblock %}

{% block content %}
{% helper dswSync %}

<div class="grid_12">

	<h1>Recent Blog Posts</h1>
	
		{% fetch blogs from blog with [
				'limit': 3,
				'where': 'status = 1',
				'order': 'self:modified desc'
				] 
		%}	
	{% for blog in blogs %}
		{% set post = blog.mostRecent %}
		<div class="grid_4 alpha">
			<h2><a href="{{ post.url }}">{{ post.headline }}</a></h2>
			<div class="dark byline">
				<a href="{{ blog.url }}" style="text-decoration:none">{{ blog.name }}</a>
				<span class="modified">{{ blog.modified|date('M d, Y') }}</span>
				<a class="author">{{ post.authors.splat('name')|join(', ') }}</a>
			</div>	
			<p>
				{{ post.abstract_formatted }}<a href="{{ post.url }}" class="dark"><span>More</span></a>
			</p>
		</div>
	{% endfor %}
	<div class="clear"></div>

</div>

<div class="grid_12" id="secondary">
	<div class="grid_10 alpha">
		<h1>Recent Blogs</h1>

		{% fetch blogs from blog with [
				'where': 'status = 1',
				'order': 'self:modified desc'
				] 
		%}	
			
		{% for blog in blogs %}
			
		{% if i%2 == 0 %}
			<div class="grid_5 alpha">
		{% else %}
			<div class="grid_5 omega">
		{% endif %}

			
				<h2 id="blogname"><a href="{{ blog.url }}">{{ blog.name }}</a>:</h2>
				<br />

					{% set post = blog.mostRecent %}
					<h3><a href="{{ post.url }}">{{ post.headline|clip(50) }}</a></h3>
					<div class="dark byline">
						<a class="author">{{ post.authors.splat('name')|join(', ') }}</a>
						<span class="modified">{{ blog.modified|timeSince }}</span>	
					</div>
					<p>
						{{ post.abstract_formatted|clip(300) }}<a href="{{ post.url }}" class="dark"><span>More</span></a>
					</p>
		
			</div>
		
		{% if i%2 != 0 %}
			<div class="clear" /></div>
		{% endif %}
				
			{% endfor %}
			
	</div>
			
	
		
	<div class="grid_2 omega">
		<img src="{{ 'style_chroma/images/ads/skyscraper.png'|url }}" alt="advertisement" />
	</div>

		
		

</div>

{% endblock %}