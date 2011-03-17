{% extends "gryphon/base.tpl" %}

{% block title %} :: Multimedia{% endblock %}
{% block active %}multimedia{% endblock %}
{% block subActive%}{{ subActive }}{% endblock %}

{% block content %}

{% import 'macros/render.tpl' as mediaRender %}

{% set topMedia = media.shift() %}

<div class="grid_12">
	<div class="grid_8 alpha">
	<h3>{{ topMedia.fileType }}:</h3><h2>{{ topMedia.title }}</h2>
		<br />
	{{ mediaRender.media(topMedia) }}
		<br />
	{{ topMedia.caption_formatted }}
	<br />
	<h3>Related:</h3>
	
		{% if topMedia.articles.length %}
	<ul>
		{% for item in topMedia.articles %}
			<li><a href="{{ item.url }}">{{ item.headline }}</a></li>
		{% endfor %}

	</ul>
	{% else %}	
	Sorry, no related articles or media. 
	{% endif %}
	
	
	</div>
	<div class="grid_4 omega">
		<br />

		<img src="{{ 'style_chroma/images/ads/button.png'|url }}" alt="advertisement"/>

	</div>
</div>

<div class="grid_12" id="secondary">
	<div class="grid_12 pagination">
		<ul class="page_numbers">
			{% for page in pagination %}
			
				{% if page.isCurrent %}
				<li class="act"><a href="{{ page.url }}">{{ page.label }}</a></li>
				{% else %}
				<li><a href="{{ page.url }}">{{ page.label }}</a></li>
				{% endif %}
				{% endfor %}
		</ul>
	</div>
			
	<div class="grid_10 alpha">

		{% for i in 0..(media.length-1) %}
		{% set item = media[i] %}

		{% if i%2 == 0 %}
			<div class="grid_5 alpha">
		{% else %}
			<div class="grid_5 omega">
		{% endif %}

						
				<h3><a href="{{ item.urlDefault }}">{{ item.title }}</a></h3>
				<div class="byline dark" style="width:100px;">
			
				<span class="date">{{ item.created|date('M d, Y') }}</span>
			
				</div>
				{{ item.description|clip(100) }}

		</div>
		{% if i%2 != 0 %}
			<div class="clear" /></div>
		{% endif %}
					
	{% endfor %}

	</div>

	<div class="grid_2 omega">
	<img src="{{ 'style_chroma/images/ads/skyscraper.png'|url }}" alt="advertisement" />
	</div>

	<div class="grid_12 pagination">
		<ul class="page_numbers">
			{% for page in pagination %}
			
				{% if page.isCurrent %}
				<li class="act"><a href="{{ page.url }}">{{ page.label }}</a></li>
				{% else %}
				<li><a href="{{ page.url }}">{{ page.label }}</a></li>
				{% endif %}
				{% endfor %}
		</ul>
	</div>

</div>

{% endblock content %}
