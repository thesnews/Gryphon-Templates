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
	
		<div class="grid_10 alpha omega">
	
			{% for post in posts %}
			
				<h1><a href="{{ post.url }}">{{ post.headline }}</a></h1>
				
				<div class="dark byline">
				{% if post.authors.length %}
				<a class="author">{{ post.authors.splat('name')|join(', ') }}</a>
				{% endif %}
				<span class="date">{{ post.created|timeSince }}</span>
				<span class="modified">{{ post.modified|timeSince }}</span>
				<a href="{{ post.url }}#comments" class="comment">{{ post.commentTotal|int2noun('comment') }}</a>
				</div>		
				
				<p>
				{{ post.copy_formatted|clip(1000) }}{{ post.abstract_formatted }}<a href="{{ post.url }}" class="dark"><span>More</span></a>
				<br /><br />	
				</p>
			
			{% endfor %}
			

		</div>
	</div>	
	<div class="grid_2 omega">
	<img src="{{ 'style_chroma/images/ads/skyscraper.png'|url }}" alt="advertisement" />
	</div>
</div>

{% endblock %}