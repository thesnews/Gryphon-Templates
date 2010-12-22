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
			<div class="image">
				<a href="{{ article.url }}">
					<img src="{{ topImage.url }}"  alt="{{ article.headline }}" class="col_5" />
				</a>
				<div class="info">
					<span class="credit">
						{{ topImage.authors.splat('name')|join(', ') }} /
						{{ topImage.source }}
					</span>
					{% if dswSync.buyURL(topImage) %}
						<a href="{{ dswSync.buyURL(topImage) }}" class="reprint"><img style="border: none;" class="reprint_icon" src="{{ 'style/gryphon/images/reprint.png'|url }}" alt="Reprints" /></a>
					{% endif %}
				</div>
			</div>
		{% endif %}
	{% endif %}

	<div class="article">
		{% if showHeadline %}
			<h1><a href="{{ article.url }}">{{ article.headline }}</a></h1>
		{% endif %}
		
		<div class="small box gray">
			{% if article.authors.length %}
				By {{ article.authors.splat('name')|join(', ') }}
			{% endif %}
			<span class="byline_divider">|</span>
			Published {{ article.created|date('m/d') }}
			<span class="byline_divider">|</span>
			<a href="{{ article.url }}#comments">{{ article.commentTotal|int2noun('comment') }}</a>

			
		</div>
		
		<p>{{ article.abstract_formatted }} <a href="{{ article.url }}">Read more &#187;</a></p>
		
		{% if article.multimedia.length %}
			<hr class="spacer" />
			<h4>Related Media:</h4>
			<ul>
				{% for media in article.multimedia %}
					<li><strong>Related {{ media.type }}:</strong> <a href="{{ media.urlMultimedia }}">{{ media.title }}</a></li>
				{% endfor %}
			</ul>
		{% endif %}
		
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