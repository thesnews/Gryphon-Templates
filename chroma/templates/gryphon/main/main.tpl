{% extends "gryphon/base.tpl" %}

{% block content %}

{% set topStory = articles.shift() %}
{% set secondaryStories = articles.shift(3) %}
{% import "macros/article.tpl" as articleRender %}

<div class="grid_12">

	
	<div class="grid_12 omega">
		{{ articleRender.abstract5Col(topStory) }}	
	</div>
	
	<hr />
	
	<div class="grid_12">
	
		<div class="grid_9 alpha">
			{% fetch news from article with [
					'limit': 6,
					'order': 'weight desc, created desc',
					'where': 'status = 1',
					'withTags': ['news']
					]
			%}
			<div class="grid_3 alpha">
			
				<h5 class="bordered">
				RECENT NEWS:
				<span><a href="{{ 'section/news'|url }}">More News &#187;</a></span>
				</h5>
				<div class="grid_3 alpha">
				{% set topPost = news.shift() %}
				<h3><a href="{{ topPost.url }}">{{ topPost.headline }}</a></h3>
				<div class="small gray box">
					{% if topPost.authors.length %}
						By {{ topPost.authors.splat('name')|join(', ') }}
						<span class="byline_divider">|</span>
					{% endif %}
					
					Published {{ topPost.created|date('m/d') }}

				</div>
				<p>
					{% for item in topPost.multimedia %}
						{% if item.type == 'image' %}
							<img src="{{ item.urlThumbnail }}" alt="media" />
						{% endif %}
					{% endfor %}
					{{ topPost.abstract_formatted }}
				</p>
				</div>
				<div class="grid_3 omega">
				<ul>
				{% for item in news %}
					<li><h4><a href="{{ item.url }}">{{ item.headline }}</a></h4><br /><span class="small">{% if item.authors.length %}
						By {{ item.authors.splat('name')|join(', ') }}
					{% endif %}</span></li>
				{% endfor %}
				</ul>
				</div>
				
			</div>			
			
			
			<div class="grid_3">
			
				{% fetch sports from article with [
					'limit': 6,
					'order': 'weight desc, created desc',
					'where': 'status = 1',
					'withTags': ['sports']
					]
				%}
		
				<h5 class="bordered">
				RECENT SPORTS:
				<span><a href="{{ 'section/sports'|url }}">More Sports &#187;</a></span>
				</h5>
				<div class="grid_3 alpha">
				{% set topPost = sports.shift() %}
				<h3><a href="{{ topPost.url }}">{{ topPost.headline }}</a></h3>
				<div class="small gray box">
					{% if topPost.authors.length %}
						By {{ topPost.authors.splat('name')|join(', ') }}
						<span class="byline_divider">|</span>
					{% endif %}
					
					Published {{ topPost.created|date('m/d') }}

				</div>
				<p>{{ topPost.abstract_formatted }}</p>
				
			</div>
			
			
			
			<div class="grid_3 omega">
				<ul>
				{% for item in sports %}
					<li><h4><a href="{{ item.url }}">{{ item.headline }}</a></h4><br /><span class="small">{% if item.authors.length %}
						By {{ item.authors.splat('name')|join(', ') }}
					{% endif %}</span></li>
				{% endfor %}
				</ul>
				</div>
			
				
				
			</div>
		
		
		</div>		
		
		
		<div class="grid_3 omega">
		
			{% include "gryphon/ads/skyscraper.tpl" %}
		
		</div>	
	
	</div>

	<hr class="spacer" />
</div>

<hr />
</div>

<div class="grid_4">

	<iframe src="http://www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Fpages%2FThe-State-News%2F62758758853&amp;width=292&amp;colorscheme=light&amp;connections=10&amp;stream=false&amp;header=true&amp;height=300" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:292px; height:300px;" allowTransparency="true"></iframe>

	<hr />
	
	{% include 'gryphon/main/featured.tpl' %}

	<hr class="spacer" />
	
	{% include 'gryphon/main/pod-gallery.tpl' %}
	
	<hr class="spacer" />
	
	{% include 'google/calendar/featured.tpl' %}
	
	
</div>

{% endblock content %}
