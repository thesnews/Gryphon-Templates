{% extends "gryphon/base.tpl" %}

{% block title %} :: Multimedia{% endblock %}
{% block active %}multimedia{% endblock %}
{% block subActive%}{{ subActive }}{% endblock %}

{% block content %}

{% import 'macros/render.tpl' as mediaRender %}

{% set topMedia = media.shift() %}

<div class="grid_8">
	<h1>{{ topMedia.fileType|capitalize }}: {{ topMedia.title }}</h1>
	
	{{ mediaRender.media(topMedia) }}

	{{ topMedia.caption_formatted }}
		
	<h4>Related:</h4>
	<ul>
		{% for item in topMedia.articles %}
			<li><a href="{{ item.url }}">{{ item.headline }}</a></li>
		{% endfor %}
	</ul>

	<hr />
	{% include 'gryphon/ads/video.tpl' %}
	
	<hr />
	
	<hr class="spacer" />

	<div class="pagination">
		<h5>MULTIMEDIA</h5>
		<span>
		{% for page in pagination %}
			<a href="{{ page.url }}">{{ page.label }}</a>
		{% endfor %}
		</span>
	</div>

	
	{% for i in 0..(media.length-1) %}
		{% set item = media[i] %}
		
		{% if i%2 == 0 %}
			<div class="grid_4 alpha">
		{% else %}
			<div class="grid_4 omega">
		{% endif %}
			<a href="{{ item.urlDefault }}"><img src="{{ item.urlThumbnail }}" class="thumbnail" style="max-width:100px;" /></a>

			<span class="small"><a href="{{ ('gryphon:multimedia/'~item.type)|url }}">{{ item.fileType|capitalize }}</a>:</span>
			
			<h4><a href="{{ item.urlDefault }}">{{ item.title }}</a></h4>
			<span class="small">Posted: {{ item.created|timeSince }}</span>
			{{ item.description|clip(100) }}
			
			<hr class="spacer" />
		</div>

		{% if i%2 != 0 %}
			<hr class="clear-fix" />
		{% endif %}
		
	{% endfor %}
	<hr class="spacer" />
	<div class="pagination">
		<span>
		{% for page in pagination %}
			<a href="{{ page.url }}">{{ page.label }}</a>
		{% endfor %}
		</span>
	</div>
	
</div>

<div class="grid_4">

	{% include 'gryphon/main/sidebar-standard.tpl' %}
	
</div>



{% endblock content %}
