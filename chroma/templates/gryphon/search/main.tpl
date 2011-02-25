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
		<p><strong>{{ pagination.total|int2noun('item') }}</strong> found for "{{ query }}". If you're looking for something specific, you can also try an <a href="#">Advanced Search</a>.</p>
	{% else %}
	<p>Use the field below to perform a basic search. This will return articles, images, and multimedia relevant to your query. You can also try an <a href="{{ 'search/?a=1'|url }}">Advanced Search</a>.</p>
	{% endif %}
	

	<div id="main_search">
		<br />
		<form id="search" method="get" action="{{ 'gryphon:search'|url }}" class="search-form search2">
				<input id="search_field" class="search replace-text" type="text" name="q" value="Search The State News" />
				<input class="search_button" type="image" name="submit" style="float: right;" src="{{ 'style_chroma/images/search_icon.png'|url }}" width="13" height="13" alt="search">
		</form>
			
	</div>

</div>

<div class="grid_12" id="secondary">
		<div class="pagination">
			<span>
			<ul class="page_numbers">
			{% for page in pagination %}
				<li><a href="{{ page.url }}">{{ page.label }}</a></li>
			{% endfor %}
			</ul>
			</span>
			<br />
		</div>
		

<div class="grid_10 alpha">


{% if query %}<h2>Search Results:</h2>{% endif %}
		
	<div>
	<ul>
		{% for item in hits %}
			<li>
				<h3><a href="{{ item.url|url }}">{{ item.title }}</a></h3> 
				{{ item.created|date(' M d, Y') }}
				<p>
				{{ item.description|clip(400) }}
				</p>
			</li>
			<li  class="divider">&nbsp;</li>
		{% endfor %}
	</ul>
	
	</div>
		
	<div class="pagination">
	<br />
		<span>
		<ul class="page_numbers">
		{% for page in pagination %}
			<li><a href="{{ page.url }}">{{ page.label }}</a></li>
		{% endfor %}
		</ul>
		</span>
	</div>


</div>



<div class="grid_2 omega">
	<img src="{{ 'style_chroma/images/ads/skyscraper.png'|url }}" alt="advertisement" />
</div>



</div>


<div class="clear"></div>

{% endblock %}