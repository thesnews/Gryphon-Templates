{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ article.headline }}{% endblock %}
{% block description %}{{ article.abstract_formatted|striptags }}{% endblock %}
{% block links %}
	<link rev="canonical" type="text/html" href="{{ article.url }}" />
	<link rel="alternate shorter" type="text/html" href="{{ shortUrl }}" />
{% endblock %}


{% block content %}
{% helper dswSync %}


<div class="grid_8">
	{# we grab these ahead because they're all 'images' #}
	
	{% set domPhoto = article.media.grab('meta', 'dominant photo', true) %}
	{% set infoGraphs = article.media.grab('meta', 'info graphic', true) %}
	{% set mugShots = article.media.grab('meta', 'mugshot', true) %}
	{% set galleries = article.media.grab('meta', 'gallery', true) %}
	{% set interactives = article.media.grab('meta', 'interactive', true) %}

	{% if domPhoto.length %}
		<div class="grid_8 alpha omega"><div class="box gray small">
			{{ render.media(domPhoto[0], 'col8') }}
			
			{{ domPhoto[0].caption_formatted }}
		</div></div>
		<hr class="spacer" />
	{% endif %}

	<div class="grid_3 alpha">
	
	<div class="box gray" id="sidebar">
		
		{% set images = article.media.grab('type', 'image', true) %}
		{% for image in images %}
			<div class="image">
				<a href="{{ image.urlDefault }}"><img src="{{ image.urlPreview }}" alt="{{ image.base_name }}" class="photo" /></a>
				<div class="info">
					{% if image.authors.length %}
						<span class="credit"><a href="http://statenews.com/search.php?q=%22{{ image.authors.splat('name')|join(', ') }}%22">{{ image.authors.splat('name')|join(', ') }}</a><br />{{ image.source }}</span>
					{% endif %}
					{% if dswSync.buyUrl(image) %}
						<a class="reprint" href="{{ dswSync.buyUrl(image) }}"><img src="{{ 'style/gryphon/images/reprint.png'|url }}" alt="Reprints" /></a>
					{% endif %}
				</div>
			<div class="caption">{{ image.caption_formatted }}</div>
			</div>
		{% endfor %}

		{% for graphic in infoGraphs %}
			<div class="image">
				<a href="{{ graphic.urlDefault }}"><img src="{{ graphic.previewUrl }}" alt="{{ graphic.base_name }}" class="photo" /></a>
				<div class="info">
					{% if graphic.authors.length %}
						<span class="credit"><a href="http://statenews.com/search.php?q=%22{{ graphic.authors.splat('name')|join(', ') }}%22">{{ graphic.authors.splat('name')|join(', ') }}</a><br />{{ graphic.source }}</span>
					{% endif %}
				</div>
			<div class="caption">{{ graphic.caption_formatted }}</div>
			</div>
			<br />
		{% endfor %}

		{% set video = article.media.grab('type', 'video', true) %}				
		{% if video.length %}
			<h4 class="media_video">Watch:</h4>
			<ul class="media_video">
			{% for vid in video %}
				<li>
					<a href="{{ vid.urlDefault }}"><img src="{{ vid.urlPreview }}" alt="#" class="photo" /></a>
					<div class="meta">
					Video: <a href="{{ vid.urlDefault }}">{{ vid.title }}</a>
					<span class="date">({{ vid.created|timeSince }})</span>
					</div>
				</li>
			{% endfor %}
			</ul>
			<br />
		{% endif %}
				
		{% set pdfs = article.media.grab('type', 'pdf', true) %}
		{% if pdfs.length %}
			<h4 class="media_pdf">Documents:</h4>
			<ul class="media_pdf">	
			{% for pdf in pdfs %}
				<li><a href="{{ pdf.urlOriginal }}">{{ pdf.title }}</a> - PDF</li>
			{% endfor %}
			</ul>
			<br />
		{% endif %}

		{% set sounds = article.media.grab('type', 'audio', true) %}
		{% if sounds.length %}
			<h4 class="media_sound">Listen:</h4>
			<ul class="media_sound">
			{% for sound in sounds %}
				<li>{{ render.audio(sound) }}</li>
			{% endfor %}
			</ul>
			<br />
		{% endif %}

		{% set slides = article.media.grab('type', 'soundSlide', true) %}
		{% if slides.length %}
			<h4 class="media_slide">Audio Slideshows:</h4>
			<ul class="media_slide">
			{% for slide in slides %}
				<li>
					<a href="{{ slide.urlDefault }}"><img src="{{ slide.urlPreview }}" alt="#" class="photo" /></a>
					<div class="meta">
					Slideshow: <a href="{{ slide.urlDefault }}">{{ slide.title }}</a>
					<span class="date">({{ slide.created|timeSince }})</span>
					</div>
				</li>
			{% endfor %}
			</ul>	
			<br />
		{% endif %}

		{# we set this variable earlier in the template #}
		{% if galleries.length %}
			<h4 class="media_slide">Galleries:</h4>
			<ul class="media_slide">
			{% for gallery in galleries %}
				<li>
					<a href="{{ gallery.urlDefault }}"><img src="{{ gallery.urlPreview }}" alt="#" class="photo" /></a>
					<div class="meta">
					Gallery: <a href="{{ gallery.urlDefault }}">{{ gallery.title }}</a>
					<span class="date">({{ gallery.created|timeSince }})</span>
					</div>
				</li>
			{% endfor %}
			</ul>	
			<br />
		{% endif %}

		{# we set this variable earlier in the template #}
		{% if interactives.length %}
			<h4 class="media_video">Interactives:</h4>
			<ul class="media_video">
			{% for interactive in interactives %}
				<li>
					<a href="{{ interactive.urlDefault }}"><img src="{{ interactive.urlPreview }}" alt="#" class="photo" /></a>
					<div class="meta">
					Interactive: <a href="{{ interactive.urlDefault }}">{{ interactive.title }}</a>
					<span class="date">({{ interactive.created|timeSince }})</span>
					</div>
				</li>
			{% endfor %}
			</ul>	
			<br />
		{% endif %}
				
		{# we set this variable earlier in the template #}
		{% if charts.length %}
			{% for chart in charts %}{{ render.chart(chart) }}{% endfor %}		
		{% endif %}

		{{ article.infobox_formatted }}
					
		<h4>Possibly related:</h4>
		<ul id="article-related">
			{% for item in article.getRelated() %}
				<li><a href="{{ item.url }}">{{ item.headline }}</a></li>
			{% endfor %}
		</ul>
		
		</div>
		<div class="box gray" id="tools">
			<h4>Article Tools:</h4>
			{% import 'macros/tools.tpl' as tools %}
			<ul id="article-tools">
				<li>{{ tools.facebook(article) }}</li>
				<li>{{ tools.twitter(article) }}</li>
				<li>{{ tools.digg(article) }}</li>
				<li>{{ tools.delicious(article) }}</li>
				<li>{{ tools.blogger(article) }}</li>
				<li>{{ tools.feed(article) }}</li>
				<li>{{ tools.print(article) }}</li>
			</ul>
		</div>
	</div>
	
	<div class="grid_5 omega" id="article">
	
	<h1>{{ article.headline }}</h1>
	{% if article.subhead %}
		<h3 style="padding:.5em 0;">{{ article.subhead }}</h3>
	{% endif %}

	{% if article.authors.length %}
		{% set author = article.authors.shift() %}
		By <span class="credit"><a href="{{ author.url }}">{{ author.name }}</a>
		
		{% for author in authors %}
			and <a href="{{ author.url }}">{{ author.name }}</a>
		{% endfor %}
		</span>
	{% endif %}
			
	<span class="modified">(<b>Last updated:</b> {{article.modified|timeSince }})</span>
		
	{{ article.copy_formatted|extract(1) }}

	{# again, we set the variable earlier #}
	{% if mugShots.length %}
		<div class="mugshots">
			{% for mug in mugShots %}
				<img src="{{ mug.urlPreview }}" alt="mugshot" />
				{{ mug.caption_formatted }}
			{% endfor %}
		</div>
	{% endif %}
	
	{{ article.copy_formatted|extract(null, 1) }}

		
	<span class="modified"><b>Originally Published:</b> {{ article.created|timeSince }}</span>
	</div>

</div>

<div class="grid_4 standard-sidebar">
	{% include 'gryphon/main/sidebar-article.tpl' %}
</div>

<div class="clear"></div>

<div class="grid_8">
	<h3>Commentary</h3>
	
	<p>Add your $0.02, <a href="#comment_form">go to the comment form</a> or follow the <a href="{{ article.url }}.xml" class="feed_link">comment feed</a></p>

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
	COMMENT SIDEBAR
</div>

{% endblock %}