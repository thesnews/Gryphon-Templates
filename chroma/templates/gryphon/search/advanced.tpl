{% extends "gryphon/base.tpl" %}

{% block title %} :: Advanced Search{% endblock %}

{% block content %}

{% set months = [
	'01': 'January',
	'02': 'February',
	'03': 'March',
	'04': 'April',
	'05': 'May',
	'06': 'June',
	'07': 'July',
	'08': 'August',
	'09': 'September',
	'10': 'October',
	'11': 'November',
	'12': 'December'
] %}

{% set types = [
	'article',
	'media',
	'page',
	'section',
	'comment'
] %}

<div class="grid_12">

	<div class="grid_8 alpha">
		<h1>
			{% if query	%}
				Search Results
			{% else %}
				Advanced Search
			{% endif %}
		</h1>
		{% if query %}
			<p>Below are your search results. You can also try a <a href="{{ 'search'|url }}">Basic Search</a>.</p>
		{% else %}
		<p>Use the field below to perform an advanced search of The State News' archives. This will return articles, images, and multimedia relevant to your query. You can also try a <a href="{{ 'search'|url }}">Basic search</a></p>
		{% endif %}
	
	{% include 'gryphon/search/form.tpl' %}
	
	</div>
	<div class="grid_4 omega">		
		<img src="{{ 'style_chroma/images/ads/square.png'|url }}" alt="advertisement" />
	</div>

</div>
<div class="grid_12" id="secondary">
	{% if query %}
	<div class="grid_10 alpha">
		<h2>Search Results:</h2>
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
		<ul class="search-results">
			{% for item in hits %}
				<li>
					<h3><a href="{{ item.url|url }}">{{ item.title }}</a></h3> <em>({{ item.created|timeSince }})</em>
					<br />
					{{ item.description }}
				</li>
			{% endfor %}
		</ul>
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
	{% endif %}
	<div class="grid_2 omega">
		<img src="{{ 'style_chroma/images/ads/skyscraper.png'|url }}" alt="advertisement" />
	</div>
</div>

{% endblock %}