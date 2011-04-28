{% extends "gryphon/base.tpl" %}

{% block title %} :: Poll Archive {% endblock %}
{% block active %}opinion{% endblock %}

{% block content %}

<div class="grid_12">

	<div class="grid_10 alpha">
		<h1>Poll Archive</h1>
	<br />
	<div class="pagination">
		<ul class="page_numbers">
			{% for page in pagination %}
			
				{% if page.isCurrent %}
				<li class="act"><a href="{{ page.url }}">{{ page.label }}</a></li>
				{% else %}
				<li><a href="{{ page.url }}">{{ page.label }}</a></li>
				{% endif %}
				{% endfor %}
		</ul>
	</div>
		
	<br />
	
	<ul class="search-results">
		{% for poll in polls %}
			<li><a href="{{ poll.url }}">{{ poll.question }}</a></li>
		{% endfor %}
	</ul>
	
	<br />
	
	<div class="pagination">
		<ul class="page_numbers">
			{% for page in pagination %}
			
				{% if page.isCurrent %}
				<li class="act"><a href="{{ page.url }}">{{ page.label }}</a></li>
				{% else %}
				<li><a href="{{ page.url }}">{{ page.label }}</a></li>
				{% endif %}
				{% endfor %}
		</ul>
	</div>
	
	</div>
	
	<div class="grid_2 omega">
		<img src="{{ 'style_chroma/images/ads/skyscraper.png'|url }}" alt="advertisement" />
	</div>

</div>

{% endblock content %}