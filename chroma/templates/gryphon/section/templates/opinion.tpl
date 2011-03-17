{#
	Our opinion section is a bit different. If you look in Gryphon youll see
	that opinion actually has an article limit of 0. In opinion we dont just
	want a ordered list of articles, we want specific numbers of specific types
	of articles: Editorials, Columns ad Letters. So, we pull them out inside the
	actual template file.
	
#}

{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ section.name }}{% endblock %}
{% block active %}opinion{% endblock %}
{% block subActive %}Opinion{% endblock %}

{% block content %}


{% import "macros/articleopinion.tpl" as articleRender %}

<div class="grid_12">

	<div class="grid_6 alpha">
	<h3>Editorials:</h3>
		{% fetch editorials from article with [
			'where': 'status = 1',
			'order': 'weight desc, created desc',
			'limit': 2,
			'withTags': ['Editorials']
		] %}
		
		{% for article in editorials %}
			{{ articleRender.abstract6Col(article) }}
		{% endfor %}

			<ul class="more_fromlarger">
				<li><h3>More from <a href="{{ 'gryphon:section/editorials'|url }}">Editorials:</a></h3></li>
							{% for article in editorials %}
							<li><h4><a href="{{ article.url }}">{{ article.headline }}</a></h4></li>
							{% endfor %}
			</ul>	



		
		{% fetch cartoons from media with [
			'where': 'status = 1',
			'order': 'created desc',
			'limit': 6,
			'withTags': ['Editorial Cartoon']
		] %}
						
<br />
	<div class="grid_4 alpha">
			<div id="featured_image">
					{% set cartoon = cartoons.shift() %}
		   		<a href="{{ cartoon.urlDefault }}"><img src="{{ cartoon.urlPreview }}" /></a>
				<div>
					<p>	
					{% if cartoon.authors.length %}
					<a href="{{ cartoon.authors[0].url }}" class="cartoonauthor">{{ cartoon.authors[0].name }}</a>
					{% endif %}
					{{ topImage.source }}
					</p>	
				</div>
			</div>
	</div>				    
		
		<div class="gird_2 omega">	

			<ul>
			<li><h3>More Cartoons:</h3></li>
				{% for cartoon in cartoons %}
				<li>Cartoon for <a href="{{ cartoon.urlDefault }}">{{ cartoon.created|date('M d, Y') }}</a></li>
				{% endfor %}
			</ul>
	
		</div>		

	</div>


	<div class="grid_3 alpha">
		
		<h3>Columns:</h3>
		{% fetch articles from article with [
			'where': 'status = 1',
			'order': 'weight desc, created desc',
			'limit': 3,
			'withTags': ['Columns']
		] %}
		
		{% for article in articles %}
			{{ articleRender.abstract3Col(article) }}
		{% endfor %}


<ul class="more_from">
			<li><h3>More from <a href="{{ 'gryphon:section/columns'|url }}">Columns</a></h3></li>
</ul>							
							
	</div>
	<div class="grid_3">
	
		<h3>Letters:</h3>
	
	
	
		{% fetch articles from article with [
			'where': 'status = 1',
			'order': 'weight desc, created desc',
			'limit': 3,
			'withTags': ['Letters']
		] %}
		
		{% for article in articles %}
			{{ articleRender.abstract3Col(article) }}
		{% endfor %}
	
	<ul class="more_from">
				<li><h3>More from <a href="{{ 'gryphon:section/letters'|url }}">Letters</a></h3></li>
							</ul>							
							
	
	
	</div>
	
</div>



{% endblock content %}