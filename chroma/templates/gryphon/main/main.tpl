{% extends "gryphon/base.tpl" %}

{% block content %}

{% set topStory = articles.shift() %}
{% set secondaryStories = articles.shift(3) %}
{% import "macros/article.tpl" as articleRender %}


<div class="grid_12">
		<div class="grid_5 alpha">
		{{ articleRender.abstract5Col(topStory) }}
		</div>
		
		<div class="grid_7 omega">
		{% include 'gryphon/main/featured.tpl' %}
		</div>
</div>

<div class="grid_12" id="secondary">

	<div class="grid_9 alpha">
		<div class="grid_3 alpha">
			{% fetch news from article with [
			'limit': 6,
			'order': 'weight desc, created desc',
			'where': 'status = 1',
			'withTags': ['news']
											]
			%}
			
			{% set topPost = news.shift() %}
			<h2><a href="{{ topPost.url }}">{{ topPost.headline }}</a></h2>
			<div class="dark byline">
				{% if topPost.authors.length %}
				<a class="author">{{ topPost.authors.splat('name')|join(', ') }}</a>
				{% endif %}
				<span class="date">{{ topPost.created|date('M d, Y') }}</span>
			</div>
			<p>
			{{ topPost.abstract_formatted }}
			<a href="#" class="dark"><span>More</span></a>
			
			</p>				
						
		</div>		
		<div class="grid_3">
			{% fetch sports from article with [
			'limit': 6,
			'order': 'weight desc, created desc',
			'where': 'status = 1',
			'withTags': ['sports']
											]
			%}
			{% set topPost = sports.shift() %}
			<h2><a href="{{ topPost.url }}">{{ topPost.headline }}</a></h2>
			<div class="dark byline">
				{% if topPost.authors.length %}
				<a class="author">{{ topPost.authors.splat('name')|join(', ') }}</a>
				{% endif %}
				<span class="date">{{ topPost.created|date('M d, Y') }}</span>
			</div>
			<p>
			{{ topPost.abstract_formatted }}
			 <a href="#" class="dark"><span>More</span></a>
			</p>				
				
		</div>		
		<div class="grid_3 omega">
			{% fetch opinion from article with [
			'limit': 6,
			'order': 'weight desc, created desc',
			'where': 'status = 1',
			'withTags': ['opinion']
												]
			%}
			{% set topPost = opinion.shift() %}
			<h2><a href="{{ topPost.url }}">{{ topPost.headline }}</a></h2>
			<div class="dark byline">
				{% if topPost.authors.length %}
				<a class="author">{{ topPost.authors.splat('name')|join(', ') }}</a>
				{% endif %}
				<span class="date">{{ topPost.created|date('M d, Y') }}</span>
			</div>
			<p>
			{{ topPost.abstract_formatted }}
			<a href="#" class="dark"><span>More</span></a>
			</p>				
		</div>		

	<div class="clear"></div> <!-- LEAVE THIS CLEAR DIV!! OTHERWISE, THE CONTAINER WILL COLLAPSE! -->	
	

	
		<div class="grid_3 alpha">
			{% fetch news from article with [
				'limit': 6,
			'order': 'weight desc, created desc',
			'where': 'status = 1',
			'withTags': ['news']
			]
			%}
				<ul class="more_from">
					<li><h3>More from <a href="{{ 'section/news'|url }}">News</a>:</h3></li>
					{% for article in articles %}
					<li><h4><a href="{{ article.url }}">{{ article.headline }}</a></h4></li>
					{% endfor %}
				</ul>
		</div>
				
		<div class="grid_3">	
			
			{% fetch sports from article with [
			'limit': 6,
			'order': 'weight desc, created desc',
			'where': 'status = 1',
			'withTags': ['sports']
			]
			%}			
				<ul class="more_from">
					<li><h3>More from <a href="{{ 'section/sports'|url }}">Sports</a>:</h3></li>
					{% for item in sports %}
					<li><h4><a href="{{ item.url }}">{{ item.headline }}</a></h4></li>
					{% endfor %}
				</ul>
				
		</div>
		
		<div class="grid_3 omega">
			{% fetch opinion from article with [
			'limit': 6,
			'order': 'weight desc, created desc',
			'where': 'status = 1',
			'withTags': ['opinion']
			]
			%}
			<ul class="more_from">
				<li><h3>More from <a href="{{ 'section/opinion'|url }}">Opinion</a>:</h3></li>
				{% for item in opinion %}
				<li><h4><a href="{{ item.url }}">{{ item.headline }}</a></h4></li>
				{% endfor %}

			</ul>
		</div>
			
	</div> <!-- this end tag coresponds to the div grid 9-->


		<div class="grid_1">
		&nbsp;
		</div>
			<div class="grid_2 omega">
			<img src="{{ 'style_chroma/images/ads/skyscraper.png'|url }}" alt="advertisement" />
			</div>
</div>

<div class="grid_12">
		<div class="grid_4 alpha">
			<img src="{{ 'style_chroma/images/ads/square.png'|url }}" alt="advertisement" />
		</div>
		<div class="grid_3">
			<div id="poll">
				<div class="dark">
					<h3>Poll of the Week</h3>
					{% include 'tsn/poll/recent.tpl' %}
					
				</div>
			</div>
			<br />
			{% include 'gryphon/main/enewsletter.tpl' %}	
		</div>
		
		<div class="grid_3">
		{% include 'gryphon/main/section_tabs.tpl' %}
	
		</div>

		<div class="grid_2 omega">
			
			{% fetch pdf from media with [
				'where': 'status = 1',
				'limit': 1,
				'order': 'uid desc',
				'withTags': ['frontpage', 'pdf']
			] %}
			<div class="dark front_pdf">
				<h3>Today's Front Page</h3>
				<a href="{{ pdf[0].urlOriginal }}">
				<img src="{{ pdf[0].urlPreview }}" alt="frontpage" class="front_pdf" />
				</a>
			</div>
		</div>
</div>


<div class="grid_12">
	<div class="grid_4 alpha">
		{% include 'gryphon/main/box.tpl' %}	
	</div>
	
	<div class="grid_4">
		{% include 'gryphon/main/calendar.tpl' %}	
	</div>
	
	<div class="grid_4 omega">
		<img src="{{ 'style_chroma/images/ads/button.png'|url }}" alt="advertisement" style="float: left" />
		<img src="{{ 'style_chroma/images/ads/button.png'|url }}" alt="advertisement" style="float: right" />
	</div>
</div>

{% endblock content %}
