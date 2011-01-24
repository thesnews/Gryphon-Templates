{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ section.name }}{% endblock %}
{% block active %}features{% endblock %}
{% block subActive %}Features{% endblock %}

{% block content %}

{% set topStory = articles.shift() %}
{% set secondaryStories = articles.shift(3) %}
{% import "macros/article.tpl" as articleRender %}

<div class="grid_8">

	{% if breaking %}
		<div>
			<div>
				<h3><a href="{{ breaking.url }}">{{ breaking.headline }}</a><span>Last updated {{ breaking.modified|timeSince }}</span></h3>
				<a href="{{ breaking.url }}">Read more &#187;</a>

			</div>
		</div>
	
		<hr class="spacer" />
	{% endif %}

	<div class="grid_5 alpha">
		{{ articleRender.abstract5Col(topStory) }}		

		<hr class="spacer" />

		<h5 class="bordered">FEATURED MULTIMEDIA:<span><a href="{{ 'multimedia'|url }}">More multimedia &#187;</a></span></h5>	
		{% fetch multimedia from media with [
			'limit': 10,
			'order': 'self:weight desc, self:created desc',
			'withTags': ['Multimedia Box']
		] %}
		{% include "gryphon/main/box.tpl" %}


	</div>
	
<!-- Here is where the grid 3 columns start.  End of grid 8.  --->

	<div class="grid_3 omega">
		<!-- prod notice
		<div class="box gray">
			The State News will resume regular publication <strong>May 17</strong>. Check back with statenews.com for updates throughout the semester break.
		</div>
		<hr class="spacer" />
		end prod notice -->
		
		
		{% for article in secondaryStories %}
			{{ articleRender.abstract3Col(article) }}
		{% endfor %}
		
		
	</div>
	
	<hr class="spacer">
	<hr class="spacer">
	
	<div class="grid_6 alpha">
		<div class="grid_3 alpha">
			<h5 class="bordered">MORE FEATURES</h5>
	
			<ul>
				{% for article in articles %}
					<li><h4><a href="{{ article.url }}">{{ article.headline }}</a></h4> <span class="small">(updated {{ article.modified|timeSince }})</span></li>
				{% endfor %}
			</ul>
	
		</div>
		<div class="grid_3 omega">
			<h5 class="bordered">
				BLOGS:
				<span><a href="{{ 'blog'|url }}">More blogs &#187;</a></span>
			</h5>
			{% fetch blogs from blog with [
				'limit': 8,
				'where': 'status = 1',
				'order': 'self:modified desc'
			] %}
			<ul>
				{% for blog in blogs %}
					<li>
					<div class="small">
						{{ blog.name }}
					</div>
					{% set topPost = blog.mostRecent %}
					<h4><a href="{{ topPost.url }}">{{ topPost.headline }}</a></h4>
					</li>
				{% endfor %}
			</ul>
	
		</div>		
		

	</div>
	<div class="grid_2 omega">
		{% include 'gryphon/ads/skyscraper.tpl' %}
	</div>
</div>



<!-- Here is where the grid 4 columns start.  End of grid 3.  --->

<div class="grid_4">
	{% include 'gryphon/ads/rectangle.tpl' %}

	<hr class="spacer" />
	
	<div class="box gray">
		{% include "pre1/featured.tpl" %}
	</div>

	<hr class="spacer" />

	<div class="alpha grid_2">
		{% include 'gryphon/ads/button.tpl' %}
	</div>
	<div class="omega grid_2">
		{% include 'gryphon/ads/button.tpl' %}
	</div>
	
	<hr class="spacer" />
	
	{% include 'gryphon/main/featured.tpl' %}
	
	<hr class="spacer" />
	
	{% include 'gryphon/main/pod-gallery.tpl' %}

</div>





{% endblock content %}
