{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ article.headline }}{% endblock %}
{% block description %}{{ article.abstract_formatted|striptags }}{% endblock %}
{% block links %}
	<link rev="canonical" type="text/html" href="{{ article.url }}" />
	<link rel="alternate shorter" type="text/html" href="{{ shortUrl }}" />
{% endblock %}


{% block content %}
{% helper dswSync %}
{% import 'macros/tools.tpl' as tools %}

{# we grab these ahead because they're all 'images' #}

{% set infoGraphs = article.media.grab('meta', 'info graphic', true) %}
{% set mugShots = article.media.grab('meta', 'mugshot', true) %}
{% set galleries = article.media.grab('meta', 'gallery', true) %}
{% set interactives = article.media.grab('meta', 'interactive', true) %}

{% set pdfs = article.media.grab('type', 'pdf', true) %}

{% set images = article.media.grab('type', 'image', true) %}
{% set videos = article.media.grab('type', 'video', true) %}				
{% set sounds = article.media.grab('type', 'audio', true) %}
{% set slides = article.media.grab('type', 'soundSlide', true) %}

{% set sections = article.sections %}

{% set domPhoto = images.shift() %}

<div class="grid_8">
	
	{#<form method="post" action="{{ mailUrl }}">
		<input type="hidden" name="mailkey" value="{{ mailKey }}" />
		<input type="hidden" name="mailitem" value="gryphon:article" />
		<input type="hidden" name="mailid" value="{{ article.uid }}" />
		to:
		<input type="text" name="mailto" /><br />
		name: <input type="text" name="mailname" />
		email: <input type="text" name="mailfrom" /><br />
		msg: <input type="text" name="mailmessage" />
		
		<input type="submit" />
	</form>#}
	
	<div id="article">
		{% if message %}
			<div class="box gray">
				<h5>{{ message.value }}</h5>
			</div>
			<hr class="spacer" />
		{% endif %}
	
		<h1>{{ article.headline }}</h1>
		{% if article.subhead %}
			<h2 style="padding:.5em 0;">{{ article.subhead }}</h2>
		{% endif %}

		<div class="grid_3 alpha">
			{% if article.authors.length %}
				{% set author = article.authors.shift() %}
				By <span class="credit"><a href="{{ author.url }}">{{ author.name }}</a>
				
				{% for author in article.authors %}
					and <a href="{{ author.url }}">{{ author.name }}</a>
				{% endfor %}
				</span>
			{% endif %}
		</div>
		<div class="grid_5 omega text-right small">
			<ul id="tools">
				<li>{{ tools.facebook(article) }}</li>
				<li>{{ tools.twitter(article) }}</li>
				<li>{{ tools.digg(article) }}</li>
				<li>{{ tools.delicious(article) }}</li>
				<li>{{ tools.blogger(article) }}</li>
				<li>{{ tools.feed(article) }}</li>
				<li>{{ tools.print(article) }}</li>
			</ul>

		</div>
		<hr class="spacer" />
		
		
		{% if domPhoto %}
			<div class="grid_8 alpha omega"><div class="box gray small">
				{{ render.media(domPhoto, 'image_8col') }}
				{{ domPhoto.caption_formatted }}


			</div></div>
			<hr class="spacer" />
		{% endif %}

		<div class="small">
			<b>Originally Published:</b> {{ article.created|timeSince }}
			{% if article.created != article.modified %}
				| <b>Modified:</b> {{ article.modified|timeSince }}
			{% endif %}
			
		</div>
		<hr />
		
		{% if article.infobox or pdfs.length %}
		<div class="sidebar-item">
			{% if article.infobox %}
				<h5>More information:</h5>
				{{ article.infobox_formatted }}
				<hr />
			{% endif %}
			{% if pdfs.length %}
				<h5>Related Documents:</h5>
				<ul class="media_pdf">	
				{% for pdf in pdfs %}
					<li><a href="{{ pdf.urlOriginal }}">{{ pdf.title }}</a> - PDF</li>
				{% endfor %}
				</ul>
				<hr />
			{% endif %}
		</div>
		{% endif %}
		
		
		{% if mugShots.length %}
			{% for mug in mugShots %}
			<div class="mugshots">
				<img src="{{ mug.url }}" alt="{{ mug.caption }}" />
				<strong>{{ mug.caption_formatted }}</strong>
			</div>
			{% endfor %}
		{% endif %}

		{{ article.copy_formatted|extract(5) }}
		
		{% for image in images %}
			<div class="photo sidebar-item expandable">
				<a href="{{ image.urlDefault }}"><img src="{{ image.urlPreview }}" alt="{{ image.base_name }}" class="preview" /></a>
				<span>Photo: {{ image.caption|clip(15) }}</span>
			</div>
		{% endfor %}

		{% for gallery in galleries %}
			<div class="gallery sidebar-item expandable">
				<a href="{{ gallery.urlDefault }}"><img src="{{ gallery.urlPreview }}" alt="{{ gallery.base_name }}" class="preview" /></a>
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

		{{ article.copy_formatted|extract(null, 5) }}
		
		<hr class="spacer">
		<div class="small">
			<strong>Short URL:</strong> <a href="{{ shortUrl }}">{{ shortUrl }}</a>
		</div>
		<hr />
		
		<div class="grid_4 alpha">
			
			<h5>Possibly related:</h5>
			<ul id="article-related">
				{% for item in article.getRelated() %}
					<li><a href="{{ item.url }}">{{ item.headline }}</a></li>
				{% endfor %}
			</ul>
		</div>
		<div class="grid_4 omega">
			{% if sections.length %}
				<h5>More in {{ sections[0].name }}:</h5>
				{% fetch more from gryphon:article with [
					'where': 'status = 1',
					'limit': 5,
					'order': 'weight desc, created desc',
					'withTags': sections[0].tags.splat('name')
				] %}
				<ul>
				{% for item in more %}
					<li><a href="{{ item.url }}">{{ item.headline }}</a></li>
				{% endfor %}
				</ul>
			{% endif %}
		</div>
			
	</div>

</div>

<div class="grid_4 standard-sidebar">
	{% include 'gryphon/main/sidebar-article.tpl' %}
</div>

<div class="clear"></div>

<div class="grid_8">

	<hr />

	{% import 'macros/comment.tpl' as comment %}
	
	<div class="pagination"><span>
		{{ comment.pagers(article) }}
	</span></div>
	
	<div class="comments">
		{{ comment.list(article) }}
	</div>

	<div class="pagination"><span>
		{{ comment.pagers(article) }}
	</span></div>

	{% if article.shouldAllowComments %}

		{% set commentItem = article %}
		{% include 'gryphon/comment/form.tpl' %}

	{% endif %}

</div>
<div class="grid_4">
	{% include 'gryphon/main/sidebar-lower.tpl' %}
</div>

<hr class="spacer" />

{% endblock %}