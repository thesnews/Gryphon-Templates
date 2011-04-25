{#
	Our opinion section is a bit different. If you look in Gryphon you'll see
	that opinion actually has an article limit of 0. In opinion we don't just
	want a ordered list of articles, we want specific numbers of specific types
	of articles: Editorials, Columns ad Letters. So, we pull them out inside the
	actual template file.
	
#}

{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ section.name }}{% endblock %}
{% block active %}opinion{% endblock %}
{% block subActive %}Opinion{% endblock %}

{% block content %}


{% import "macros/article.tpl" as articleRender %}

<div class="grid_8">
	<div class="grid_3 alpha">
		{% if postStatus == 'success' %}
			<div class="box gray">
				<h3>Success</h3>
				
				<p>Your letter to the editor has been sent!</p>
			</div>
			<hr class="spacer" />
		{% endif %}
		<h5 class="bordered">CARTOON:</h5>
		{% fetch cartoons from media with [
			'where': 'status = 1',
			'order': 'created desc',
			'limit': 5,
			'withTags': ['Editorial Cartoon']
		] %}

		{% set cartoon = cartoons.shift() %}

		<a href="{{ cartoon.urlDefault }}"><img src="{{ cartoon.urlPreview }}" style="max-width:210px;" class="photo" /></a>
		By <a href="{{ cartoon.authors[0].urlSearch }}">{{ cartoon.authors[0].name }}</a>
		
		<hr class="spacer" />
		
		<h5>MORE CARTOONS:</h5>
		
		<ul>
			{% for cartoon in cartoons %}
				<li><a href="{{ cartoon.urlDefault }}">Cartoon for {{ cartoon.created|date('m/d') }}</a></li>
			{% endfor %}
		</ul>
		
		<hr class="spacer" />

		{#<h5 class="bordered">OPINION BLOGS: <span><a href="{{ 'gryphon:blog'|url }}">More blogs &#187;</a></span></h5>#}
		
		<div class="gray box">
			<h4>Have something to say?</h4>
			
			Send a <a href="{{ 'tsn:mail/opinion/1'|url }}">letter to the editor</a>.
		</div>

	</div>
	<div class="grid_5 omega">
		<h5 class="bordered">OUR VOICE: <span><a href="{{ 'gryphon:section/editorials'|url }}">More editorials &#187;</a></span></h5>
		
		{% fetch editorials from article with [
			'where': 'status = 1',
			'order': 'weight desc, created desc',
			'limit': 3,
			'withTags': ['Editorials']
		] %}
		
		{% for article in editorials %}
			{{ articleRender.abstract5Col(article) }}
		{% endfor %}
		
	</div>
	

	<hr class="spacer" />

	<div class="grid_3 alpha">
		<script src="http://widgets.twimg.com/j/2/widget.js"></script>
		<script>
		new TWTR.Widget({
		  version: 2,
		  type: 'profile',
		  rpp: 10,
		  interval: 10000,
		  width: 'auto',
		  height: 500,
		  theme: {
			shell: {
			  background: '#94af94',
			  color: '#ffffff'
			},
			tweets: {
			  background: '#ffffff',
			  color: '#333333',
			  links: '#5e8c5e'
			}
		  },
		  features: {
			scrollbar: true,
			loop: true,
			live: false,
			hashtags: true,
			timestamp: true,
			avatars: false,
			behavior: 'default'
		  }
		}).render().setUser('thesnews_opine').start();
		</script>
	
	</div>
	<div class="grid_3">
		<h5 class="bordered">COLUMNS: <span><a href="{{ 'gryphon:section/columns'|url }}">More columns &#187;</a></span></h5>

		{% fetch articles from article with [
			'where': 'status = 1',
			'order': 'weight desc, created desc',
			'limit': 3,
			'withTags': ['Columns']
		] %}
		
		{% for article in articles %}
			{{ articleRender.abstract3Col(article) }}
		{% endfor %}
		
		<hr class="spacer" />

		<h5 class="bordered">LETTERS: <span><a href="{{ 'gryphon:section/letters'|url }}">More letters &#187;</a></span></h5>
	
		{% fetch articles from article with [
			'where': 'status = 1',
			'order': 'weight desc, created desc',
			'limit': 3,
			'withTags': ['Letters']
		] %}
		
		{% for article in articles %}
			{{ articleRender.abstract3Col(article) }}
		{% endfor %}

	</div>
	<div class="grid_2 omega">
		{% include "gryphon/ads/skyscraper.tpl" %}
	</div>
	<hr class="spacer" />

</div>

<div class="grid_4">
	{% include "gryphon/main/sidebar-standard.tpl" %}
</div>

<hr class="spacer" />

{% endblock content %}