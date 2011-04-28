{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ blog.name }}{% endblock %}
{% block active %}blogs{% endblock %}
{% block subActive %}{{ blog.slug }}{% endblock %}


{% block content %}

<div class="grid_8 alpha">
	<div>
		<h1>{{ blog.name }}</h1>
		<p><br />{{ blog.description_formatted }}<br /></p>
	</div>
</div>
		
<div class="grid_4 omega">
	<img src="{{ 'style_chroma/images/ads/button.png'|url }}" alt="advertisement" />
	<img src="{{ 'style_chroma/images/ads/button.png'|url }}" alt="advertisement" />
	<br />
	<br />
</div>
		
<div class="grid_12" id="secondary">	

	<div class="grid_10 alpha">
		<div class="grid_10">
			<ul class="page_numbers">
				{% for page in pagination %}
				
					{% if page.isCurrent %}
					<li class="act"><a href="{{ page.url }}">{{ page.label }}</a></li>
					{% else %}
					<li><a href="{{ page.url }}">{{ page.label }}</a></li>
					{% endif %}
					{% endfor %}
			</ul>
			<br />
		</div>
	
		
		{% for i in 0..(posts.length-1) %}
		{% set post = posts[i] %}
			
		{% if i%2 == 0 %}
			<div class="grid_5 alpha">
		{% else %}
			<div class="grid_5 omega">
		{% endif %}

			<h2><a href="{{ post.url }}">{{ post.headline }}</a></h2>
			<div class="dark byline">
				{% if post.authors.length %}
				<a class="author">{{ post.authors.splat('name')|join(', ') }}</a>
				{% endif %}
				<span class="date">{{ post.created|timeSince }}</span>
				<span class="modified">{{ post.modified|timeSince }}</span>
			</div>		
			<p>
				{{ post.copy_formatted|clip(500) }}
			
				<a href="{{ post.url }}" class="dark"><span>More</span></a>
				<br /><br />	
			</p>
			</div>
			
			{% if i%2 == 0 %}
			{% else %}
			<div class="clear"></div>
			{% endif %}			
			
			
			{% endfor %}

	</div>	
	<div class="grid_2 omega">
	<img src="{{ 'style_chroma/images/ads/skyscraper.png'|url }}" alt="advertisement" />
	</div>
</div>

{% endblock %}