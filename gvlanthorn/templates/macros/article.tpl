{% macro abstract5Col(article) %}
	{% helper dswSync %} {# bring the 'dswSync' helper into the macro context #}
	{% set topMug = article.media.grab('meta', 'mugshot', true)[0] %}
	{% set topImage = article.media.grab('type', 'image')[0] %}
	{% set showHeadline = 1 %}
	
	<div class="image mmb">
		<a  href="{{ article.url }}">
		<img src="{{ topImage.url }}"  alt="{{ article.headline }}" class="col_2" />
		</a>
	</div>
	<a class="reprints-button" href="http://reprints.lanthorn.com"></a>
	<div class="clear mmb">&nbsp;</div>
		<h2><a href="{{ article.url }}">{{ article.headline }}</a></h2>
	<div class="byline aside mmb">
		<span class="dateline aside">{{ article.authors.splat('name')|join(', ') }} | 
		
		<span {% if article.modified > (now - 86400) %}class="attn"{% endif %}>{{ article.created|date('M d') }}</span>
		
		</span>
	</div>
	<div class="abstract mb">
		{{ article.abstract_formatted }}
	</div>

{% endmacro %}

<!--
	
{% macro abstract5Coloriginal(article) %}	
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
		
		{% if topMug %}
			<img src="{{ topMug.url }}" style="float:left;padding:5px 5px 5px 0;" />
		{% endif %}
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


-->

{% macro abstract3Col(article) %}
		<h3><a href="{{ article.url }}">{{ article.headline }}</a></h3>
		
		<div class="byline aside mmb">
			<span class="aside dateline">{% if article.authors.length %}By {{ article.authors.splat('name')|join(', ') }}{% endif %} | {{ article.created|date('M d') }}</span>
		</div>

			
		<div class="thumbright">
				<a href="{{ article.url }}"><img src="{{ media.urlThumbnail }}" alt="{{ article.headline }}" /></a>
		</div>


		<div class="abstract mb">
			{{ article.abstract_formatted|clip(200) }}
		</div>



<!--
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
-->
{% endmacro %}