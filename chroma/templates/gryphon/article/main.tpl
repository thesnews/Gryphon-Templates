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

{# we grab these ahead because theyre all 'images' #}

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

	<div class="grid_8 alpha">
		<h1>{{ article.headline }}</h1>
		
		<div class="dark byline">
			<span class="date">{{ article.created|date('M d, Y') }}</span>
			{% if article.created != article.modified %}
			<span class="modified">Modified {{ article.modified|date('M d, Y') }}</span>
			{% endif %}	
			{% if article.authors.length %}
			{% set author = article.authors.shift() %}
			<a href="{{ author.url }}" class="author">{{ author.name }}</a>
			{% for author in article.authors %}
			and <a href="{{ author.url }}" class="author">{{ author.name }}</a>
			{% endfor %}
			{% endif %}
			<a class="comment" href="#secondary">{{ article.commentTotal|int2noun('comment') }}</a>
		</div>
										
		<div id="article_body">
										
				{% if article.infobox or pdfs.length %}
		<div class="sidebar-item">
			{% if article.infobox %}
				{{ article.infobox_formatted }}

			{% endif %}
			
			{% if pdfs.length %}
				<ul class="media_pdf">	
				{% for pdf in pdfs %}
					<li><h3>Related Documents:</h3></li>
					<li><a href="{{ pdf.urlOriginal }}">{{ pdf.title }}</a> (PDF)</li>
				{% endfor %}
				</ul>
			{% endif %}
			
			<br />
			
		</div>
		{% endif %}
		
		
		{% if mugShots.length %}
			{% for mug in mugShots %}
			<div class="mugshots">
				<img src="{{ mug.url }}" alt="{{ mug.caption }}" />
				<h3>{{ mug.caption_formatted }}</h3>
			</div>
			{% endfor %}
		{% endif %}

		{{ article.copy_formatted|extract(5) }}
		
		
	<div class="sidebar" style="text-align:center">
		<div>
		{% for image in images %}
			<div class="dark">
				<a href="{{ image.urlDefault }}"><img src="{{ image.urlPreview }}" alt="{{ image.base_name }}" class="preview" /></a>
				<span>Photo: {{ image.caption|clip(30) }}</span>
			</div>
			<br />
		{% endfor %}
		</div>
		{% for gallery in galleries %}
			<div class="dark">
				<a href="{{ gallery.urlDefault }}"><img src="{{ gallery.urlPreview }}" alt="{{ gallery.base_name }}" class="preview" /></a>
				<span>Gallery: {{ gallery.galleries[0].title|clip(30) }}</span>
			</div>
			<br />
		{% endfor %}

		{% for video in videos %}
			<div class="dark">
				<a href="{{ video.urlDefault }}"><img src="{{ video.urlPreview }}" alt="{{ video.base_name }}" class="preview" /></a>
				<span>Video: {{ video.title|clip(30) }}</span>
			</div>
			<br />
		{% endfor %}

		{% for slide in slides %}
			<div class="dark">
				<a href="{{ slide.urlDefault }}"><img src="{{ slide.urlPreview }}" alt="{{ slide.base_name }}" class="preview" /></a>
				<span>Slideshow: {{ slide.title|clip(30) }}</span>
			</div>
			<br />
		{% endfor %}

		{% for sound in sounds %}
			<div class="dark sound sidebar-item">
				{{ render.media(sound, 'audio_article') }}
				<h5>Audio: {{ sound.title }}</h5>
			</div>
			<br />
		{% endfor %}
		</div>
	</div>			
		{{ article.copy_formatted|extract(null, 5) }}
		<br />
</div>
<div class="grid_4 omega">
		<img src="{{ 'style_chroma/images/ads/square.png'|url }}" alt="advertisement" />
		<ul class="more_stories">
			<li><h3>Possibly Related:</h3></li>
			<li>{% for item in article.getRelated() %}
			<li><a href="{{ item.url }}">{{ item.headline }}</a></li>
			{% endfor %}
		</ul>
</div>

<div class="grid_12" id="secondary">
	<div class="grid_6 alpha">
		<h1>{{ article.commentTotal|int2noun('comment') }}</h1>
					
					
		{% import 'macros/comment.tpl' as comment %}
	
		<div class="pagination">
			<ul class="page_numbers">
				<li>
				{{ comment.pagers(article) }}
				</li>
			</ul>
		</div>
	
		<div class="comments">
			{{ comment.list(article) }}
		</div>

		<div class="pagination">
			<ul class="page_numbers">
				<li>
					{{ comment.pagers(article) }}
				</li>
			</ul>
		</div>

	
			<div id="join_convo"><a href="#secondary">Join the Conversation!</a></div>
	</div>			
	<div class="grid_4">
		<h2>Have Something to Say?</h2>
		<form id="comments" action="#" method="post">
			<fieldset id="comment-userinfo">
				<input type="text" name="name" id="comment_name" value="Your Name" class="clearMeFocus" />
				<input type="text" name="email" id="comment_email" value="Your Email (Won't be published)" />
			</fieldset>
			<fieldset>
				<textarea name="comment" id="comment_body">Your Comment</textarea>
				<input type="text" name="answer" id="comment_turing" size="40" value="Where does the President live?" class="clearme rounded" />		
			</fieldset>
			<input type="submit" id="comment_submit" value="Add Comment" />			
		</form>
		<h3>You Should Know:</h3>
		<p>Detroit Softworks reserves the right to remove any comment deemed racially derogatory, inflammatory, or spammatory. Repeat offenders may have their IP address banned from posting future comments. Please be nice.</p>
		<ul id="format_options">
			<lh>Formatting Options:</lh>
			<li>Links: "my link":http://my.url.com</li>
		    <li>Bold: *something!"</li>
		    <li>Italic: _OMG!_</li>
		</ul>
		    
	</div>
	<div class="grid_2 omega">
		<img src="{{ 'style_chroma/images/ads/skyscraper.png'|url }}" alt="advertisement" />
	</div>
</div>




{% endblock %}