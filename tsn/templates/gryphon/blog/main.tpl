{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ blog.headline }}{% endblock %}
{% block active %}blogs{% endblock %}
{% block subActive %}{{ blog.slug }}{% endblock %}

{% block content %}
{% helper dswSync %}

{% import 'macros/comment.tpl' as comment %}
{% import 'macros/tools.tpl' as tools %}

{% set mugShots = post.media.grab('meta', 'mugshot', true) %}
{% set galleries = post.media.grab('meta', 'gallery', true) %}

{% set images = post.media.grab('type', 'image', true) %}
{% set videos = post.media.grab('type', 'video', true) %}				
{% set sounds = post.media.grab('type', 'audio', true) %}
{% set slides = post.media.grab('type', 'soundSlide', true) %}

<div class="grid_8">
	<h1>{{ post.headline }}</h1>

	<div class="small gray box blogsize" id="toolsblogs">
		By {{ post.authors.splat('name')|join(', ') }}
		<br /><br />
		<strong>Created:</strong><br />{{ post.created|timeSince }}
		<br /><br />
		<strong>Last updated:</strong> <br />{{ post.modified|timeSince }}
		<br /><br />
		<a href="#comments">{{ post.commentTotal|int2noun('comment') }}</a>
		
	</div>	
	

	{% if mugShots.length %}
		{% for mug in mugShots %}
		<div class="mugshots">
			<img src="{{ mug.url }}" alt="{{ mug.caption }}" />
			<strong>{{ mug.caption_formatted }}</strong>
		</div>
		{% endfor %}
	{% endif %}

	{{ post.copy_formatted|extract(5) }}

	{% for image in images %}
		<div class="photo sidebar-item expandable">
			<a href="{{ image.urlDefault }}"><img src="{{ image.urlPreview }}" alt="{{ image.base_name }}" class="preview" /></a>
			<span>Photo: {{ image.caption|clip(15) }}</span>
		</div>
	{% endfor %}

	{% for gallery in galleries %}
		<div class="gallery sidebar-item expandable">
			<a href="{{ gallery.galleries[0].urlDefault }}"><img src="{{ gallery.urlPreview }}" alt="{{ gallery.base_name }}" class="preview" /></a>
			<span>Gallery: {{ gallery.galleries[0].title|clip(15) }}</span>
		</div>
	{% endfor %}
	
	{% for video in videos %}
		<div class="video sidebar-item expandable">
			<a href="{{ video.urlDefault }}"><img src="{{ video.urlPreview }}" alt="{{ video.base_name }}" class="preview" /></a>
			<span>Video: {{ video.title|clip(15) }}</span>
		</div>
	{% endfor %}

	{% for slide in slides %}
		<div class="slide sidebar-item expandable">
			<a href="{{ slide.urlDefault }}"><img src="{{ slide.urlPreview }}" alt="{{ slide.base_name }}" class="preview" /></a>
			<span>Slideshow: {{ slide.title|clip(15) }}</span>
		</div>
	{% endfor %}
	
	{% for sound in sounds %}
		<div class="sound sidebar-item">
			<h5>Audio: {{ sound.title }}</h5>
			{{ render.media(sound, 'audio_article') }}
		</div>
	{% endfor %}	
	{{ post.copy_formatted|extract(null, 5) }}
	
	<hr />

	<div class="pagination"><span>
		{{ comment.pagers(post) }}
	</span></div>
	
	<div class="comments">
	<a id="comments"></a>
		{{ comment.list(post) }}
	</div>

	<div class="pagination"><span>
		{{ comment.pagers(post) }}
	</span></div>

	{% if post.shouldAllowComments %}

		{% set commentItem = post %}
		{% include 'gryphon/comment/form.tpl' %}

	{% endif %}

</div>

<div class="grid_4 standard-sidebar">
	<div class="box gray">
		<h5>About {{ blog.name }}</h5>
		
		<p>{{ blog.description_formatted }}</p>
		
		<a href="{{ blog.url }}.xml" class="feed_link">Follow this blog in your feed reader</a>
	</div>
	
	<hr class="spacer" />

	{% include 'gryphon/main/sidebar-standard.tpl' %}
</div>

<hr class="spacer" />

{% endblock %}