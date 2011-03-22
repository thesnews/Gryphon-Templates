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
{% set flash = article.media.grab('type', 'flash', true) %}

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

		<div class="gray box small">
			{% if article.authors.length %}
				{% set author = article.authors.shift() %}
				By <span class="credit"><a href="{{ author.url }}">{{ author.name }}</a>
				<span class="byline_divider">|</span>
				{% for author in article.authors %}
					and <a href="{{ author.url }}">{{ author.name }}</a>
				{% endfor %}
				</span>
			{% endif %}
			
			<b>Originally Published:</b> {{ article.created|timeSince }}
			{% if article.created != article.modified %}
				<span class="byline_divider">|</span><b>Modified:</b> {{ article.modified|timeSince }}
			{% endif %}
			<span class="byline_divider">|</span>
			<a href="#comments">{{ article.commentTotal|int2noun('comment') }}</a>
		
		</div>

		<hr class="spacer" />
		
		
		
		
		{% if domPhoto %}
			<div style="text-align: center;">
				<a href="{{ domPhoto.urlDefault }}"><img src="{{ domPhoto.url }}" alt="{{ domPhoto.base_name }}" /></a>

				<div class="small box gray" style="text-align: left; width: 500px; margin: 10px auto 0 auto;">
				{{ domPhoto.authors.splat('name')|join(', ') }} <span class="byline_divider">|</span> {{ domPhoto.source }}

		{% if dswSync.buyURL(media) %}
			<a href="{{ dswSync.buyURL(media) }}" style="float: right;"><img style="border: none;" class="reprint_icon" src="{{ 'style/gryphon/images/reprint.png'|url }}" alt="Reprints" /></a>
		{% endif %}
				
				{{ domPhoto.caption_formatted }}
				</div>
			</div>
			<br />

		{% endif %}
		
			<a href="http://twitter.com/share" class="twitter-share-button" data-count="horizontal" data-via="thesnews">Tweet</a><script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>		

			<iframe src="http://www.facebook.com/plugins/like.php?href={{ article.urlShort }}%2Fpage%2Fto%2Flike&amp;layout=button_count&amp;show_faces=false&amp;width=200&amp;action=recommend&amp;font=arial&amp;colorscheme=light&amp;height=21" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:200px; height:21px;" allowTransparency="true"></iframe>
		
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

		{% for item in flash %}
			{% if item.meta['flashembed'] %}
				<div class="flash sidebar-item expandable">
					<a href="{{ item.urlDefault }}"><img src="{{ item.urlPreview }}" alt="{{ item.base_name }}" class="preview" /></a>
					<span>Interactive: {{ item.title|clip(15) }}</span>
				</div>
			{% endif %}
		{% endfor %}
		
		{% for sound in sounds %}
			<div class="sound sidebar-item">
				<h5>Audio: {{ sound.title }}</h5>
				{{ render.media(sound, 'audio_article') }}
			</div>
		{% endfor %}
		
			{{ article.copy_formatted|extract(null, 5) }}
			
			<hr />
			
			<div class="grid_4 alpha">
			<h5>Article Tools:</h5>
			<ul id="tools">
				<li>{{ tools.facebook(article) }}</li>
				<li>{{ tools.twitter(article) }}</li>
				<li>{{ tools.digg(article) }}</li>
				<li>{{ tools.delicious(article) }}</li>
				<li>{{ tools.blogger(article) }}</li>
				<li>{{ tools.feed(article) }}</li>
				<li>{{ tools.print(article) }}</li>
			</ul>
			<h5>Short URL:</h5>
			<a class="small" href="{{ shortUrl }}">{{ shortUrl }}</a>
			</div>
				
			<div class="grid_4 omega">
			<h5>Possibly related:</h5>
			<ul id="article-related">
				{% for item in article.getRelated() %}
					<li><a href="{{ item.url }}">{{ item.headline }}</a></li>
				{% endfor %}
			</ul>
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
			
			<br />
			
			
	</div>
	
	

</div>


<div class="grid_4 standard-sidebar">
	{% include 'gryphon/main/sidebar-article.tpl' %}
</div>

<div class="clear"></div>

<div class="grid_8">

	<hr />
	<a id="comments"></a>

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