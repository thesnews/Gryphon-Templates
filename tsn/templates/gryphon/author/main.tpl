{% extends "gryphon/base.tpl" %}
{% block title %} :: Staff - {{ author.name }}{% endblock %}

{% block content %}

<div class="grid_8">

	<h1>{{ author.name }}</h1>
	
	{{ author.tagline }}
	
	<hr class="spacer" />
	
	Recent articles:
	<ul>
		{% for item in author.articles %}
			<li><a href="{{ item.url }}">{{ item.headline }}</a></li>
		{% endfor %}
	</ul>

	Recent posts:
	<ul>
		{% for item in author.blogPosts %}
			<li><a href="{{ item.url }}">{{ item.headline }}</a></li>
		{% endfor %}
	</ul>


	Recent media:
	<ul>
		{% for item in author.media %}
			<li><a href="{{ item.urlDefault }}">{{ item.title }}</a></li>
		{% endfor %}
	</ul>
	

</div>

<div class="grid_4">

	{% include 'gryphon/main/sidebar-standard.tpl' %}
	
</div>

{% endblock content %}
