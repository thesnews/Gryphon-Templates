{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ blog.name }}{% endblock %}
{% block active %}blogs{% endblock %}
{% block subActive %}{{ blog.slug }}{% endblock %}


{% block content %}

<div class="grid_8">




	<div class="right"><img src="{{ 'style/assets/29.png'|url }}" style="position:relative;top:2px;" /> <a href="<?php echo $blog->url ?>.xml">RSS</a></div>
	<h1>{{ blog.name }}</h1>
		
	<div class="mmb">&nbsp;</div>
	
	<div class="body-copy boot mmb">
		{{ blog.description_formatted }}
	</div>
	
	
	{% for post in posts %}

		<h3 class="mmb"><a href="{{ post.url }}">{{ post.headline }}</a> &nbsp;<span class="byline aside">{{ post.comments.length }} comments |</span> <span class="dateline  aside">{{ post.created|date('M d') }}</span></h3>
		
		<div class="body-copy">
			{{ post.abstract_formatted }}
			<p><a href="{{ post.url }}">Continue reading &raquo;</a></p>
		</div>
		
		<hr class="mb" />
	
	{% endfor %}




</div>

<div class="grid_4">
	{% include 'gryphon/main/side_bar.tpl' %}
</div>

<div class="clear">&nbsp;</div>


{% endblock %}