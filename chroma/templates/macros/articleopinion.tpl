{% macro abstract6Col(article) %}
	{% helper dswSync %} {# bring the 'dswSync' helper into the macro context #}
	{% set topImage = article.media.grab('type', 'image')[0] %}
	{% set showHeadline = 1 %}
	
	

	{% if showHeadline %}
			<h1><a href="{{ article.url }}">{{ article.headline }}</a></h1>
		{% endif %}
					<div class="dark byline">
					
						<span class="date">{{ article.created|date('m/d') }}</span>
						
					
						{% if article.authors.length %}
							<a class="author">
							{{ article.authors.splat('name')|join(', ') }}
							</a>
							{% endif %}						
						<a class="comment" href="{{ article.url }}#comments">{{ article.commentTotal|int2noun('comment') }}</a>
						
					</div>
					
					<p>{{ article.abstract_formatted }} 
					<a href="{{ article.url }}" class="dark"><span>More</span></a></p>
					<br />

	

{% endmacro %}

{% macro abstract3Col(article) %}


						<h2><a href="{{ article.url }}">{{ article.headline }}</a></h2>
						<div class="dark byline">
							<span class="date">{{ article.created|date('M d,Y') }}</span>
							{% if article.authors.length %}
							<a class="author">
							{{ article.authors.splat('name')|join(', ') }}
							</a>
							{% endif %}
							
							
						</div>
						<p>{{ article.abstract_formatted|clip(250) }}<a href="{{ article.url }}" class="dark"><span>More</span></a></p>
<br />






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