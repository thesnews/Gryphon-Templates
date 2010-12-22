{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ blog.name }}{% endblock %}
{% block active %}blogs{% endblock %}
{% block subActive %}{{ blog.slug }}{% endblock %}


{% block content %}

<div class="grid_8">
	<h1>{{ blog.name }}</h1>
	<div class="pagination"><span>
	{% for page in pagination %}
		{% if page.isCurrent %}
			<strong>{{ page.label }}</strong>
		{% else %}
			<a href="{{ page.url }}">{{ page.label }}</a>
		{% endif %}
	{% endfor %}
	</span></div>
	
	<hr class="spacer" />
	
	{% for post in posts %}
	
		<h2><a href="{{ post.url }}">{{ post.headline }}</a></h2>
		
		<div class="gray box blogsize">
		{% if post.authors.length %}
			By {{ post.authors.splat('name')|join(', ') }}<br /><br />
		{% endif %}
		<strong>Created:</strong><br />{{ post.created|timeSince }}<br /><br />
		<strong>Last updated:</strong> <br />{{ post.modified|timeSince }}<br /><br />
		<a href="{{ post.url }}#comments">{{ post.commentTotal|int2noun('comment') }}</a>
		</div>		
		
		<div>
		{{ post.copy_formatted }}		
		</div>
		<hr class="spacer" />
	
	{% endfor %}
	<hr class="spacer" />
	
	<div class="pagination"><span>
	{% for page in pagination %}
		{% if page.isCurrent %}
			<strong>{{ page.label }}</strong>
		{% else %}
			<a href="{{ page.url }}">{{ page.label }}</a>
		{% endif %}
	{% endfor %}
	</span></div>
	
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

{% endblock %}