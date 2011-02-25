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

{% macro abstract7Col(article) %}
	{% helper dswSync %} {# bring the 'dswSync' helper into the macro context #}
	{% set topImage = article.media.grab('type', 'image')[0] %}
	{% set showHeadline = 1 %}
	
				
					<div id="featured_stories">
					    <ul>
					        <li class="active"><a href="#featured_story1">
							<img src="{{ topImage.url }}"  alt="{{ article.headline }}" />
					        </a></li>
					        					    </ul>
					    <div id="featured_story1">					   		
					    <a href="{{ article.url }}">
					    <img src="{{ topImage.url }}"  alt="{{ article.headline }}" />
					    </a>							
					    <div class="caption">
								<h3><a href="{{ article.url }}">{{ article.headline }}</a></h3>
								<p>{{ article.abstract_formatted|clip(200) }}</p>
							</div>
					    </div>
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