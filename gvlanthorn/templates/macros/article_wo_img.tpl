{% macro abstract5Col(article) %}
	{% helper dswSync %} {# bring the 'dswSync' helper into the macro context #}
	{% set topMug = article.media.grab('meta', 'mugshot', true)[0] %}
	{% set topImage = article.media.grab('type', 'image')[0] %}
	{% set showHeadline = 1 %}
	
	<h2><a href="{{ article.url }}">{{ article.headline }}</a></h2>
	<div class="byline aside mmb">
		<span class="dateline aside">
		{% if article.authors.length %}By {{ article.authors.splat('name')|join(', ') }} | {% endif %}
		{{ article.created|date('M d') }}</span>
	</div>
	<div class="abstract mb">
		{{ article.abstract_formatted }}
	</div>

{% endmacro %}

{% macro abstract3Col(article) %}
		<h3><a href="{{ article.url }}">{{ article.headline }}</a></h3>
		
		<div class="byline aside mmb">
			<span class="aside dateline">{% if article.authors.length %}By {{ article.authors.splat('name')|join(', ') }} | {% endif %}{{ article.created|date('M d') }}</span>
		</div>

			
		<div class="thumbright">
				<a href="{{ article.url }}"><img src="{{ media.urlThumbnail }}" alt="{{ article.headline }}" /></a>
		</div>


		<div class="abstract mb">
			{{ article.abstract_formatted|clip(200) }}
		</div>

{% endmacro %}