{% extends "gryphon/base.tpl" %}

{% block title %} :: Multimedia{% endblock %}
{% block active %}multimedia{% endblock %}
{% block subActive%}{{ subActive }}{% endblock %}

{% block content %}

{% import 'macros/render.tpl' as mediaRender %}

{% set topMedia = media.shift() %}

<div class="grid_12">

	<h2>{{ topMedia.fileType }}:</h2><h1>{{ topMedia.title }}</h1>
	
	{{ mediaRender.media(topMedia) }}
	<br />
	{{ topMedia.authors.splat('name')|join(', ') }} / {{ topMedia.source }}
	<br />
	{{ topMedia.caption_formatted }}
	
<br /><br />
<h3>Related:</h3>
	<ul>
		{% for item in topMedia.articles %}
			<li><a href="{{ item.url }}">{{ item.headline }}</a></li>
		{% endfor %}
	</ul>

	<div class="gir_12 alpha omega pagination dark byline">
		<div class="pagination clear-fix">
			<span>
			{% for page in pagination %}
				<a href="{{ page.url }}">{{ page.label }}</a>
			{% endfor %}
			</span>
		</div>
	</div>	
	<ul>
	{% for item in media %}
		<li>
			<a href="{{ item.urlDefault }}"><img src="{{ item.urlThumbnail }}" alt="{{ item.urlThumbnail }}" style="border:0;float:left;margin:5px 0 0 5px;"/></a>
			
			<div class="box gray small" style="padding-left:125px;">
				<h4 style="display:inline;"><a href="{{ item.urlDefault }}">{{ item.title }}</a></h4> &nbsp;&nbsp;&nbsp;&nbsp;
				Posted: {{ item.created|timeSince }}&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="{{ ('gryphon:multimedia/'~item.fileType)|url }}">More {{ item.fileType }}</a>
			</div>

			{{ item.caption_formatted|default('Hrm... no description here.') }}
			<hr class="spacer clear-fix"/>
		</li>
	{% endfor %}
	</ul>

	<br /><br />
	<div class="gir_12 alpha omega pagination dark byline">
		<div class="pagination clear-fix">
			<span>
			{% for page in pagination %}
				<a href="{{ page.url }}">{{ page.label }}</a>
			{% endfor %}
			</span>
		</div>
	</div>
</div>	
</div>

{% endblock content %}
