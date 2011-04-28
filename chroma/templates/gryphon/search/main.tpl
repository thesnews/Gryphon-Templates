{% extends "gryphon/base.tpl" %}

{% block title %} :: Search{% endblock %}

{% block content %}

<div class="grid_12">

	<h1>
		{% if query	%}
			Search Results for "{{ query }}"
		{% else %}
			Basic Search
		{% endif %}
	</h1>
	{% if query %}
		<p><strong>{{ pagination.total|int2noun('item') }}</strong> found for "{{ query }}". If you're looking for something specific, you can also perform a search of the <a href="{{ 'page/archives'|url }}">Archives</a>.</p>
	{% else %}
	<p>Use the field below to perform a basic search. This will return articles, images, and multimedia relevant to your query.</p>
	<p>If you are looking for something more specific, you can also perform a search of the <a href="{{ 'page/archives'|url }}">Archives</a>.</p>
	{% endif %}
	

	<div id="main_search">
		<form id="search" method="get" action="{{ 'gryphon:search'|url }}" class="search-form search2">
				<input id="search_field" class="replace-text" type="text" name="q" value="Search" />
				<input class="search_button" type="image" name="submit" style="float: right;" src="{{ 'style_chroma/images/search_icon.png'|url }}" width="13" height="13" alt="search">
		</form>
	</div>

</div>

{% if query %}
<div class="grid_12" id="secondary">
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


	<div class="grid_10 alpha">
	
	{% if query %}
	<h2>Search Results:</h2>
			
		<div>
		<ul>
			{% for item in hits %}
				<li>
					<h3><a href="{{ item.url|url }}">{{ item.title }}</a></h3> 
				
					<p style="margin-left:10px;">{{ item.created|date(' M d, Y') }} - {{ item.description|clip(400) }}
					</p>
				</li>
			{% endfor %}
		</ul>
		
		</div>
			
		<div class="pagination">
		<br />
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
	{% endif %}
	</div>
	<div class="grid_2 omega">
		<img src="{{ 'style_chroma/images/ads/skyscraper.png'|url }}" alt="advertisement" />
	</div>
</div>
{% endif %}

<div class="clear"></div>

{% endblock %}