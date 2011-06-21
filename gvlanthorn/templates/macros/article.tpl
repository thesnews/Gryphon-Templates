{% macro abstract5Col(article) %}
	{% helper dswSync %} {# bring the 'dswSync' helper into the macro context #}
	{% set topMug = article.media.grab('meta', 'mugshot', true)[0] %}
	{% set topImage = article.media.grab('type', 'image')[0] %}
	{% set showHeadline = 1 %}
	{% if article.media.length %}
	<div class="image mmb">
		<a  href="{{ article.url }}">
		<img src="{{ topImage.url }}"  alt="{{ article.headline }}" class="col_2" />
		</a>
	</div>
	{% endif %}
	<a class="reprints-button" href="http://reprints.lanthorn.com"></a>
	<div class="clear mmb">&nbsp;</div>
		<h2><a href="{{ article.url }}">{{ article.headline }}</a></h2>
	<div class="byline aside mmb">
		<span class="dateline aside">{{ article.authors.splat('name')|join(', ') }} | 
		
		<span class="{% if article.modified > now - 86400 %}attn{% endif %}">{{ article.created|date('M d') }}</span>
		
		</span>
	</div>
	<div class="abstract mb">
		{{ article.abstract_formatted }}
	</div>

{% endmacro %}

{% macro abstract3Col(article) %}
		<h3><a href="{{ article.url }}">{{ article.headline }}</a></h3>
		
		<div class="byline aside mmb">
			<span class="aside dateline">{% if article.authors.length %}By {{ article.authors.splat('name')|join(', ') }}{% endif %} | {{ article.created|date('M d') }}</span>
		</div>

			
		<div class="thumbright">
				<a href="{{ article.url }}"><img src="{{ article.media[0].urlThumbnail }}" alt="{{ article.media[0].title }}" /></a>
		</div>


		<div class="abstract mb">
			{{ article.abstract_formatted|clip(200) }}
		</div>

{% endmacro %}