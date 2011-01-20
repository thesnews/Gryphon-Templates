{% extends "gryphon/base.tpl" %}

{% block title %} :: Search{% endblock %}

{% block content %}

<div class="grid_8">

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
	<p>Use the field below to perform a basic search of The State News' archives. This will return articles, images, and multimedia relevant to your query. You can also try an <a href="{{ '/search/?a=1'|url }}">Advanced search</a></p>
	{% endif %}
	

	<div id="main_search">
	
		<div class="pagination">
			<span>
			{% for page in pagination %}
				{% if page.isCurrent %}
					<strong>{{ page.label }}</strong>
				{% else %}
					<a href="{{ page.url }}">{{ page.label }}</a>
				{% endif %}
			{% endfor %}
			</span>
		</div>
		
		
		<form method="get" action="{{ 'gryphon:search'|url }}" class="search-form">
			<input class="search replace-text" type="text" name="q" value="{% if query	%}{{ query }}{% else %}Search The State News{% endif %}" />
	
			<input class="search_button" type="image" name="submit" src="{{ 'style/gryphon/images/search_button.png'|url }}" width="24" height="24" alt="search">			
		</form>
			
	</div>
	
	<hr class="spacer" />

{% if query %}<h5 class="bordered">SEARCH RESULTS:</h5>{% endif %}
		
	<ul class="search-results">
		{% for item in hits %}
			<li>
				<h4 style="clear:both;"><a href="{{ item.url|url }}">{{ item.title }}</a></h4> <em>({{ item.created|timeSince }})</em>
				<br />
				{% if item.type == 'media' and item.misc.urlThumbnail %}
					<img src="{{ item.misc.urlThumbnail }}" style="float:left;padding: 5px 5px 5px 0;" />
				{% endif %}
				{{ item.description }}
			</li>
		{% endfor %}
	</ul>
		
	<br />
	<br />
	<div class="pagination">
		<span>
			{% for page in pagination %}
				{% if page.isCurrent %}
					<strong>{{ page.label }}</strong>
				{% else %}
					<a href="{{ page.url }}">{{ page.label }}</a>
				{% endif %}
			{% endfor %}
		</span>
	</div>
	


</div>



<div class="grid_4">
	{% include 'gryphon/main/sidebar-standard.tpl' %}
</div>

<div class="clear"></div>

{% endblock %}