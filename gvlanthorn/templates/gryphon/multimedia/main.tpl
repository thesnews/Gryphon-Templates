{% extends "gryphon/base.tpl" %}

{% block title %} :: Multimedia{% endblock %}
{% block active %}multimedia{% endblock %}
{% block subActive%}{{ subActive }}{% endblock %}

{% block content %}

{% import 'macros/render.tpl' as mediaRender %}

{% set topMedia = media.shift() %}

<div class="grid_8">
	
		
	<div class="mmb">{{ mediaRender.media(topMedia) }}</div>
	<div class="clear"></div>
	
	<div class="grid_6 alpha">
		<h3 class="mmb"><a href="<?php echo $top->url ?>">{{ topMedia.title }}</a></h3>
		
		<div class="aside mmb">{{ topMedia.byLine }}</div>
		<div class="abstract">
			<p>{{ topMedia.caption_formatted }}<span class="dateline aside">{{ article.authors.splat('name')|join(', ') }} | 
		
		<span {% if article.modified > (now - 86400) %}class="attn"{% endif %}>{{ article.created|date('M d') }}</span>
		
		</span></p>
		</div>
	</div>
	
	<div class="grid_2 omega">
		</div>

	
	<div class="clear mb">&nbsp;</div>

	
	
	
	
<!--
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
			<a href="{{ item.urlDefault }}"><img src="{{ item.urlThumbnail }}" class="thumbnail" /></a>

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

-->

</div>



<div class="grid_4">
	{% include 'gryphon/main/modules/gallery_box.tpl' %}
</div>

<div class="clear">&nbsp;</div>

{% endblock content %}
