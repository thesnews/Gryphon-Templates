{% macro abstract5Col(article) %}
	{% helper dswSync %} {# bring the 'dswSync' helper into the macro context #}
	{% set topImage = article.media.grab('type', 'image')[0] %}
	{% set showHeadline = 1 %}
	

				<div class="grid_5 alpha">
					{% if showHeadline %}
						<h1><a href="{{ article.url }}">{{ article.headline }}</a></h1>
					{% endif %}
					<div class="dark byline">
						<span class="date">{{ article.created|date('M d, Y') }}</span>&nbsp;
						<a class="author">{% if article.authors.length %}
							{{ article.authors.splat('name')|join(', ') }}
						{% endif %}</a>&nbsp;
						<a class="comment" href="{{ article.url }}#comments">{{ article.commentTotal|int2noun('comment') }}</a>
					</div>
					<p>{{ article.abstract_formatted }}<a href="{{ article.url }}" class="dark"><span>More</span></a></p>	
					
				</div>

{% endmacro %}


{% macro abstract3Col(article) %}

					<div class="grid_3">
						<h2><a href="{{ article.url }}">{{ article.headline }}</a></h2>
						<div class="dark byline">
							<span class="date">{{ article.created|date('m/d') }}</span>
							<a class="author">
							{% if article.authors.length %}
							{{ article.authors.splat('name')|join(', ') }}
							{% endif %}</a>
						</div>
						<p>{{ article.abstract_formatted|clip(300) }}<br /><a href="{{ article.url }}" class="dark"><span>More</span></a></p>
					</div>
{% endmacro %}