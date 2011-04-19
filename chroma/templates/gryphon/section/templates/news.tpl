{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ section.name }}{% endblock %}
{% block active %}news{% endblock %}
{% block subActive %}News{% endblock %}

{% block content %}


{% set topStory = articles.shift() %}
{% set featuredStories = articles.shift(2) %}

{% import "macros/articlenew.tpl" as articleRender %}

			<div class="grid_12">
				<div class="grid_4 alpha">
				{{ articleRender.abstract4Col(topStory) }}
				</div>
				
				<div class="grid_3">
						{% fetch news from article with [
						'limit': 5,
						'order': 'weight desc, created desc',
						'where': 'status = 1',
						'withTags': ['news']
															]
						%}
						{% set topPost = news.shift() %}
						{% set topPost = news.shift() %}
					
						<h2><a href="{{ topPost.url }}">{{ topPost.headline }}</a></h2>
						<div class="dark byline">
							{% if topPost.authors.length %}
							<a class="author">{{ topPost.authors.splat('name')|join(', ') }}</a>
							{% endif %}
							<span class="date">{{ topPost.created|date('M d, Y') }}</span>
							<br />
							<a class="comment" href="{{ article.url }}#comments">{{ topPost.commentTotal|int2noun('comment') }}</a>
						</div>

						<p>
				
						{{ topPost.abstract_formatted|clip(350) }}
						<a href="#" class="dark"><span>More</span></a>
						</p>	
						
						
						<br />
						
						{% set topPost = news.shift() %}
						<h2><a href="{{ topPost.url }}">{{ topPost.headline }}</a></h2>
						<div class="dark byline">
							{% if topPost.authors.length %}
							<a class="author">{{ topPost.authors.splat('name')|join(', ') }}</a>
							{% endif %}
							<span class="date">{{ topPost.created|date('M d, Y') }}</span>
							<br />
							<a class="comment" href="{{ topPost.url }}#comments">{{ topPost.commentTotal|int2noun('comment') }}</a>
						</div>
						<p>
						{{ topPost.abstract_formatted|clip(350) }}
						<a href="#" class="dark"><span>More</span></a>
						</p>
												
					</div>		
	
						
				<div class="grid_3">
						{% set topPost = news.shift() %}
						<h2><a href="{{ topPost.url }}">{{ topPost.headline }}</a></h2>
						<div class="dark byline">
							{% if topPost.authors.length %}
							<a class="author">{{ topPost.authors.splat('name')|join(', ') }}</a>
							{% endif %}
							<span class="date">{{ topPost.created|date('M d, Y') }}</span>
							<br />
							<a class="comment" href="{{ topPost.url }}#comments">{{ topPost.commentTotal|int2noun('comment') }}</a>
						</div>
						<p>
						{{ topPost.abstract_formatted|clip(350) }}
						<a href="#" class="dark"><span>More</span></a>
						</p>	
						
						<br />
						
							{% set topPost = news.shift() %}
						<h2><a href="{{ topPost.url }}">{{ topPost.headline }}</a></h2>
						<div class="dark byline">
							{% if topPost.authors.length %}
							<a class="author">{{ topPost.authors.splat('name')|join(', ') }}</a>
							{% endif %}
							<br />
							<a class="comment" href="{{ topPost.url }}#comments">{{ topPost.commentTotal|int2noun('comment') }}</a>
						</div>
						<p>
						{{ topPost.abstract_formatted|clip(350) }}
						<a href="#" class="dark"><span>More</span></a>
						</p>						
					</div>		
					<div class="grid_2 omega">
					<img src="{{ 'style_chroma/images/ads/skyscraper.png'|url }}" alt="advertisement" />
					</div>
				</div>
			
			<div class="grid_12" id="secondary">
				<div class="grid_4 alpha">
				
						{% include 'gryphon/main/box.tpl' %}
						<br />
						{% fetch news from article with [
						'limit': 5,
						'order': 'weight desc, created desc',
						'where': 'status = 1',
															]
						%}
					<h3>More Stories from News:</h3>
					<ul>
					{% for item in news %}
					<li><h4><a href="{{ item.url }}">{{ item.headline }}</a> <span class="small">({{ article.created|date('M d') }})
					</span></h4>
					</li>
					{% endfor %}
				</ul>					
				</div>
				<div class="grid_5">
						{% fetch articles from article with [
						'limit': 3,
						'order': 'weight desc, created desc',
						'where': 'status = 1',
															]
						%}
					
				{% for article in articles %}
				<h2><a href="{{ article.url }}">{{ article.headline }}</a></h2>
						<div class="dark byline">
							<span class="date">{{ article.created|date('M d, Y') }}</span>
							<a class="author">
							{% if article.authors.length %}
							{{ article.authors.splat('name')|join(', ') }}
							{% endif %}</a>
						</div>
						<p>{{ article.abstract_formatted|clip(300) }}<br /><a href="{{ article.url }}" class="dark"><span>More</span></a></p>
						{% endfor %}

					
				</div>

				<div class="grid_3 omega">
				{% include 'gryphon/main/section_tabs.tpl' %}
				
<br />
			{% include 'gryphon/main/enewsletter.tpl' %}	

				</div>
			</div>
{% endblock content %}