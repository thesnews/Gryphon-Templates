{% extends "gryphon/base.tpl" %}

{% block content %}

{% set topStory = articles.shift() %}
{% set secondaryStories = articles.shift(3) %}
{% import "macros/article.tpl" as articleRender %}

<div class="grid_8">

	{% if breaking %}
		<div class="breaking-box">
			<div>
				<h3><a href="{{ breaking.url }}">{{ breaking.headline }}</a></h3>
				<em>Last updated {{ breaking.modified|timeSince }}</em>
			</div>
		</div>
	
		<hr class="spacer" />
	{% endif %}

	<div class="grid_3 alpha">
		<!-- prod notice
		<div class="box gray">
			The State News will resume regular publication <strong>May 17</strong>. Check back with statenews.com for updates throughout the semester break.
		</div>
		<hr class="spacer" />
		end prod notice -->
		
<!--
		<a href="#rundown">
			<img src="{{ 'style/gryphon/images/rundown_ad.png'|url }}" alt="The Rundown Ad" style="border: none;"/>
		</a>
-->

		{#<a href="{{ 'calendar'|url }}">
			<img src="{{ 'style/gryphon/images/calendar_ad.png'|url }}" alt="Event Calendar" style="border: none;"/>
		</a>#}
		<a href="{{ 'section/mlk'|url }}">
			<img src="http://www.statenews.com/media/00/00/04/16/41623_mlk2011_linkerf.png" style="border:none;"/>
		</a>
		<br />
		<br />
		
		
		<h5 class="bordered">
			TOP STORIES:
			<span><a href="{{ 'section/news'|url }}">More news &#187;</a></span>
		</h5>
		
		{% for article in secondaryStories %}
			{{ articleRender.abstract3Col(article) }}
		{% endfor %}
		
		
		<h5 class="bordered">
			MORE NEWS:
		</h5>
		<ul>
				{% for article in articles %}
					<li><h4><a href="{{ article.url }}">{{ article.headline }}</a></h4> <span class="small">(updated {{ article.modified|timeSince }})</span></li>
				{% endfor %}
			</ul>
		
	</div>
	<div class="grid_5 omega">
		{{ articleRender.abstract5Col(topStory) }}		

		<hr class="spacer" />

		<h5 class="bordered">FEATURED MULTIMEDIA:<span><a href="{{ 'multimedia'|url }}">More multimedia &#187;</a></span></h5>	
		{% fetch multimedia from media with [
			'limit': 10,
			'order': 'self:weight desc, self:created desc',
			'withTags': ['Multimedia Box']
		] %}
		{% include "gryphon/main/box.tpl" %}
		<hr class="spacer" />

	</div>
</div>
<div class="grid_4">
	{% include 'gryphon/ads/rectangle.tpl' %}

	<hr class="spacer" />
	
	<div class="box gray">
		{% include "pre1/featured.tpl" %}
	</div>

	<hr class="spacer" />

	<div class="box gray">
		{% include 'tsn/poll/recent.tpl' %}
	</div>
	
	<hr class="spacer" />
	

	<div id="newsletter-signup"><div>
		<form action="http://feedburner.google.com/fb/a/mailverify" method="post" target="popupwindow" onsubmit="window.open('http://feedburner.google.com/fb/a/mailverify?uri=statenews/top', 'popupwindow', 'scrollbars=yes,width=550,height=520');return true">
			<h5>EMAIL EDITION:</h5>
			
			Fresh headlines, delivered daily, to your inbox.
			<p />
			
			<input type="text" class="replace-text" value="Email address" name="email"/>
			
			<input type="hidden" value="statenews/top" name="uri"/>
			<input type="hidden" name="loc" value="en_US"/><br /><br />
			<input type="submit" value="Subscribe" />

		</form>
	</div></div>

	<hr class="spacer" />
</div>

<hr />

<div class="grid_12">
	<div class="grid_2 alpha">
		{% include 'gryphon/ads/button.tpl' %}
	</div>
	<div class="grid_10 omega">
		{% include 'gryphon/ads/leaderboard.tpl' %}
	</div>
</div>

<hr />

<div class="grid_8">
		
		
		{% fetch blogs from blog with [
				'limit': 6,
				'where': 'status = 1',
				'order': 'self:modified desc'
				] 
		%}
	
		<div class="grid_6 alpha">
		
		<img id="rundown" src="{{ 'style/gryphon/images/rundown.png'|url }}" alt="The Rundown" />
	
		
		
		{% fetch news from article with [
					'limit': 6,
					'order': 'weight desc, created desc',
					'where': 'status = 1',
					'withTags': ['news']
					]
		%}
		
		<div class="grid_6 alpha omega">
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
		
		{% fetch sports from article with [
					'limit': 6,
					'order': 'weight desc, created desc',
					'where': 'status = 1',
					'withTags': ['sports']
					]
		%}
		<div class="grid_6 alpha omega">
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
		
		{% fetch opinion from article with [
					'limit': 6,
					'order': 'weight desc, created desc',
					'where': 'status = 1',
					'withTags': ['opinion']
					]
		%}
		<div class="grid_6 alpha omega">
			<h5 class="bordered">
				RECENT OPINION:
				<span><a href="{{ 'section/opinion'|url }}">More Opinion &#187;</a></span>
			</h5>
			<div class="grid_3 alpha">
				{% set topPost = opinion.shift() %}
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
				{% for item in opinion %}
					<li><h4><a href="{{ item.url }}">{{ item.headline }}</a></h4><br /><span class="small">{% if item.authors.length %}
						By {{ item.authors.splat('name')|join(', ') }}
					{% endif %}</span></li>
				{% endfor %}
				</ul>
			</div>
		</div>
		
		{% fetch features from article with [
					'limit': 6,
					'order': 'weight desc, created desc',
					'where': 'status = 1',
					'withTags': ['features']
					]
		%}
		<div class="grid_6 alpha omega">
			<h5 class="bordered">
				RECENT FEATURES:
				<span><a href="{{ 'section/features'|url }}">More Features &#187;</a></span>
			</h5>
			<div class="grid_3 alpha">
				{% set topPost = features.shift() %}
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
				{% for item in features %}
					<li><h4><a href="{{ item.url }}">{{ item.headline }}</a></h4><br /><span class="small">{% if item.authors.length %}
						By {{ item.authors.splat('name')|join(', ') }}
					{% endif %}</span></li>
				{% endfor %}
				</ul>
			</div>
		</div>
		
		<div class="grid_6 alpha omega">
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
		</div>
		
		</div>
		
		<div class="grid_2 omega">
			{% include 'gryphon/ads/skyscraper.tpl' %}
		</div>
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
