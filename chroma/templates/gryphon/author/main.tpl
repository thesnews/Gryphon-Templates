{% extends "gryphon/base.tpl" %}
{% block title %} :: Staff - {{ author.name }}{% endblock %}

{% block content %}

	<h1>{{ author.name }}</h1>
	
	<p>{{ author.tagline }}</p>
	
	<br />
<div class="grid_12" id="secondary">
	<div class="grid_4 alpha">
	<ul>
		<li><h3>Recent articles:</h3></li>
		{% for item in author.articles %}
			<li><a href="{{ item.url }}">{{ item.headline }}</a></li>
		{% endfor %}
	</ul>
	</div>
	<div class="grid_3">
	<ul>
		<li><h3>Recent posts:</h3></li>
		{% for item in author.blogPosts %}
			<li><a href="{{ item.url }}">{{ item.headline }}</a></li>
		{% endfor %}
	</ul>
	</div>
	<div class="grid_3">
	<ul>
		<li><h3>Recent media:</h3></li>
		{% for item in author.media %}
			<li><a href="{{ item.urlDefault }}">{{ item.title }}</a></li>
		{% endfor %}
	</ul>
	</div>
	<div class="grid_2 omega">
		<img src="{{ 'style_chroma/images/ads/skyscraper.png'|url }}" alt="advertisement" />
	</div>
</div>

{% endblock content %}
