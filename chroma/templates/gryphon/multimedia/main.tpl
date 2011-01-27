{% extends "gryphon/base.tpl" %}

{% block title %} :: Multimedia{% endblock %}
{% block active %}multimedia{% endblock %}
{% block subActive%}{{ subActive }}{% endblock %}

{% block content %}

{% import 'macros/render.tpl' as mediaRender %}

{% set topMedia = media.shift() %}

<div class="grid_12">

	<div class="gir_12 alpha omega pagination dark byline">
		<span>
		{% for page in pagination %}
			<a href="{{ page.url }}">{{ page.label }}</a>
		{% endfor %}
		</span>
	</div>
	
	<div class="grid_8 alpha">
	<h1>{{ topMedia.fileType|capitalize }}: {{ topMedia.title }}</h1>
	
	{{ mediaRender.media(topMedia) }}

	{{ topMedia.caption_formatted }}
	<br />
	<h4>Related:</h4>
	<ul>
		{% for item in topMedia.articles %}
			<li><a href="{{ item.url }}">{{ item.headline }}</a></li>
		{% endfor %}
	</ul>
	</div>
	
	<div  class="grid_12 alpha omega">
	</div>
	
	<div  class="">
	{% for i in 0..(media.length-1) %}
		{% set item = media[i] %}
		
		{% if i%2 == 0 %}
			<div class="grid_4 alpha">
		{% else %}
			<div class="grid_4 omega">
		{% endif %}
			<a href="{{ item.urlDefault }}"><img src="{{ item.urlThumbnail }}" class="thumbnail" /></a>

			<span class="small"><a href="{{ ('gryphon:multimedia/'~item.type)|url }}">{{ item.fileType|capitalize }}</a>:</span>
			
			<h4><a href="{{ item.urlDefault }}">{{ item.title }}</a></h4>
			<span class="small">Posted: {{ item.created|timeSince }}</span>
			{{ item.description|clip(100) }}
	</div>		

</div>

	{% endfor %}
	
</div>


{% endblock content %}
