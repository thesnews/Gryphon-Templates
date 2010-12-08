{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ section.name }}{% endblock %}
{% block active %}sports{% endblock %}
{% block subActive %}Sports{% endblock %}

{% block content %}

{% set topStory = articles.shift() %}
{% set secondaryStories = articles.shift(3) %}
{% import "macros/article.tpl" as articleRender %}

<div class="grid_8">

	<div class="grid_3 alpha">

		<h5 class="bordered">
			SPORTS:
		</h5>
		
		{% for article in secondaryStories %}
			{{ articleRender.abstract3Col(article) }}
		{% endfor %}
		
		
		<script src="http://widgets.twimg.com/j/2/widget.js"></script>
		<script>
		new TWTR.Widget({
		  version: 2,
		  type: 'profile',
		  rpp: 10,
		  interval: 10000,
		  width: 'auto',
		  height: 300,
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
		}).render().setUser('thesnews_sports').start();
		</script>
		
	</div>

	<div class="grid_5 omega">

		{{ articleRender.abstract5Col(topStory) }}		

		<hr class="spacer" />

		<h5 class="bordered">SPORTS MULTIMEDIA:<span><a href="{{ 'multimedia'|url }}">More multimedia &#187;</a></span></h5>	
		{% fetch multimedia from media with [
			'limit': 10,
			'order': 'self:weight desc, self:created desc',
			'withTags': ['Multimedia Box','sports']
		] %}
		{% include "gryphon/main/box.tpl" %}


	</div>
	
</div>

<div class="grid_4">
	
	{% include 'gryphon/main/sidebar-short.tpl' %}

</div>

<hr class="spacer" />
<hr />


<div class="grid_8">
	
	<div class="grid_6 alpha">

		<h5 class="bordered">MORE SPORTS:</h5>

		<div class="grid_3 alpha">
			{% set topPost = articles.shift() %}
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
			{% for item in articles %}
				<li><h4><a href="{{ item.url }}">{{ item.headline }}</a></h4><br /><span class="small">{% if item.authors.length %}
					By {{ item.authors.splat('name')|join(', ') }}
				{% endif %}</span></li>
			{% endfor %}
			</ul>
		</div>

		<hr class="spacer" />

		{% fetch blogs from blog with [
			'limit': 5,
			'where': 'status = 1',
			'order': 'self:modified desc',
			'withTags' : ['sports']
		] %}

		<h5 class="bordered">
			RECENT BLOG POSTS:
			<span><a href="{{ 'blog'|url }}">More Blogs &#187;</a></span>
		</h5>
		<div class="grid_3 alpha">
			{% set topPost = blogs.shift().mostRecent %}
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
				{% for blog in blogs %}
					{% set topPost = blog.mostRecent %}
					<li><h4><a href="{{ topPost.url }}">{{ topPost.headline }}</a></h4><br /><span class="small">From: {{ blog.name }}</span></li>
				{% endfor %}
			</ul>
		</div>

		<hr class="spacer" />

		<h5 class="bordered">MORE TEAMS:</h5>
		<ul class="grid_3 alpha">

			<li><h3><a href="/index.php/section/baseball">Baseball</a></h3></li>
			<li><h3><a href="/index.php/section/basketball">Basketball</a></h3></li>
			<li><h3><a href="/index.php/section/crosscountry">Cross Country</a></h3></li>
			<li><h3><a href="/index.php/section/football">Football</a></h3></li>
			<li><h3><a href="/index.php/section/Golf">Golf</a></h3></li>
			<li><h3><a href="/index.php/section/gymnastics">Gymnastics</a></h3></li>

			<li><h3><a href="/index.php/section/fieldhockey">Field Hockey</a></h3></li>
		</ul>
		<ul class="grid_3 omega">
			<li><h3><a href="/index.php/section/hockey">Ice Hockey</a></h3></li>
			<li><h3><a href="/index.php/section/rowing">Rowing</a></h3></li>
			<li><h3><a href="/index.php/section/soccer">Soccer</a></h3></li>
			<li><h3><a href="/index.php/section/softball">Softball</a></h3></li>
			<li><h3><a href="/index.php/section/swimmingdiving">Swimming &amp; Diving</a></h3></li>

			<li><h3><a href="/index.php/section/trackfield">Track &amp; Field</a></h3></li>
			<li><h3><a href="/index.php/section/volleyball">Volleyball</a></h3></li>
			<li><h3><a href="/index.php/section/wrestling">Wrestling</a></h3></li>
		</ul>

	</div>
	<div class="grid_2 omega">
		{% include 'gryphon/ads/skyscraper.tpl' %}
	</div>

	<hr class="spacer" />
	
</div>
<div class="grid_4">
	{% include 'gryphon/main/sidebar-lower.tpl' %}
</div>

<hr class="spacer" />

{% endblock content %}
