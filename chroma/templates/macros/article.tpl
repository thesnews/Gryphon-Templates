{% macro abstract5Col(article) %}
	{% helper dswSync %} {# bring the 'dswSync' helper into the macro context #}
	{% set topImage = article.media.grab('type', 'image')[0] %}
	{% set showHeadline = 1 %}
	
	
	<!--
	
	{% if topImage %}
		{% if 'vertical'|in(topImage.meta) %}
			{% set showHeadline = 0 %}
			<h1><a href="{{ article.url }}">{{ article.headline }}</a></h1>
	
			<div class="grid_2 alpha"><div class="image">
				<a href="{{ article.url }}">
					<img src="{{ topImage.url }}"  alt="{{ article.headline }}" class="col_2" />
				</a>

				
	
			</div></div>
		{% else %}

			<div class="image">
				<a href="{{ article.url }}">
					<img src="{{ topImage.url }}"  alt="{{ article.headline }}" class="col_4" />
				</a>
				<div class="info">

					
				</div>
			</div>

			

		{% endif %}
	{% endif %}

-->

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