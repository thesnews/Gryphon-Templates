{% macro abstract5Col(article) %}
	{% helper dswSync %} {# bring the 'dswSync' helper into the macro context #}
	{% set topImage = article.media.grab('type', 'image')[0] %}
	{% set showHeadline = 1 %}
	
	{% if topImage %}
		{% if 'vertical'|in(topImage.meta) %}
			{% set showHeadline = 0 %}
			<h1><a href="{{ article.url }}">{{ article.headline }}</a></h1>
	
			<div class="grid_2 alpha"><div class="image">
				<a href="{{ article.url }}">
					<img src="{{ topImage.url }}"  alt="{{ article.headline }}" class="col_2" />
				</a>
				<div class="info small">
					{{ topImage.authors.splat('name')|join(', ') }} /
					{{ topImage.source }}
				</div>
				{% if dswSync.buyURL(topImage) %}
					<a href="{{ dswSync.buyURL(topImage) }}" class="reprint"><img style="border: none;" class="reprint_icon" src="{{ 'style/gryphon/images/reprint.png'|url }}" alt="Reprints" /></a>
				{% endif %}
	
			</div></div>
		{% else %}
			
		{% endif %}
	{% endif %}

	<div class="article">
		{% if showHeadline %}
			<h1><a href="{{ article.url }}">{{ article.headline }}</a></h1>
		{% endif %}
		
		<div class="dark byline">
			{{ article.created|date('M d, Y') }}&nbsp;
			{% if article.authors.length %}
				{{ article.authors.splat('name')|join(', ') }}
			{% endif %}&nbsp;

			
			<a href="{{ article.url }}#comments">{{ article.commentTotal|int2noun('comment') }}</a>

			
		</div>
		
		<p>{{ article.abstract_formatted }} <a href="{{ article.url }}">More</a></p>
				
	</div>
{% endmacro %}

{% macro abstract3Col(article) %}
	<div class="article">
		<h4><a href="{{ article.url }}">{{ article.headline }}</a></h4>
		
		<div class="small box gray">
			{% if article.authors.length %}
				By {{ article.authors.splat('name')|join(', ') }}
			{% endif %}
			<span class="byline_divider">|</span>
			Published {{ article.created|date('m/d') }}
		</div>
		
		<p>{{ article.abstract_formatted|clip(100) }} <a href="{{ article.url }}">More &#187;</a></p>
	
	</div>
{% endmacro %}