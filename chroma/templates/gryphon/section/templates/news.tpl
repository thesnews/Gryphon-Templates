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
				
				<div class="grid_3 omega">
						{% fetch news from article with [
						'limit': 6,
						'order': 'weight desc, created desc',
						'where': 'status = 1',
						'withTags': ['opinion']
															]
						%}
						{% set topPost = news.shift() %}
						<h2><a href="{{ topPost.url }}">{{ topPost.headline }}</a></h2>
						<div class="dark byline">
							{% if topPost.authors.length %}
							<a class="author">{{ topPost.authors.splat('name')|join(', ') }}</a>
							{% endif %}
							<span class="date">{{ topPost.created|date('M d, Y') }}</span
						</div>
						<p>
						{{ topPost.abstract_formatted }}
						<a href="#" class="dark"><span>More</span></a>
						</p>	
						
						<br />
						
						{% set topPost = news.shift() %}
						<h2><a href="{{ topPost.url }}">{{ topPost.headline }}</a></h2>
						<div class="dark byline">
							{% if topPost.authors.length %}
							<a class="author">{{ topPost.authors.splat('name')|join(', ') }}</a>
							{% endif %}
							<span class="date">{{ topPost.created|date('M d, Y') }}</span
						</div>
						<p>
						{{ topPost.abstract_formatted }}
						<a href="#" class="dark"><span>More</span></a>
						</p>						
					</div>		
	
						
				<div class="grid_3 omega">
						{% set topPost = news.shift() %}
						<h2><a href="{{ topPost.url }}">{{ topPost.headline }}</a></h2>
						<div class="dark byline">
							{% if topPost.authors.length %}
							<a class="author">{{ topPost.authors.splat('name')|join(', ') }}</a>
							{% endif %}
							<span class="date">{{ topPost.created|date('M d, Y') }}</span
						</div>
						<p>
						{{ topPost.abstract_formatted }}
						<a href="#" class="dark"><span>More</span></a>
						</p>	
						
						<br />
						
							{% set topPost = news.shift() %}
						<h2><a href="{{ topPost.url }}">{{ topPost.headline }}</a></h2>
						<div class="dark byline">
							{% if topPost.authors.length %}
							<a class="author">{{ topPost.authors.splat('name')|join(', ') }}</a>
							{% endif %}
							<span class="date">{{ topPost.created|date('M d, Y') }}</span
						</div>
						<p>
						{{ topPost.abstract_formatted }}
						<a href="#" class="dark"><span>More</span></a>
						</p>						
					</div>		

				<div class="grid_2 omega" style="text-align: right;">
				
				<img src="{{ 'style_chroma/images/ads/button.png'|url }}" alt="advertisement" />
				<img src="{{ 'style_chroma/images/ads/button.png'|url }}" alt="advertisement" />
				<img src="{{ 'style_chroma/images/ads/button.png'|url }}" alt="advertisement" />

				</div>
				
			</div>
			
			<div class="grid_12" id="secondary">
				<div class="grid_4 alpha">
				
						<img src="{{ 'style_chroma/images/ads/square.png'|url }}" alt="advertisement" />
						
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
					<div id="section_tabs">
						<ul id="section_tabs_nav">
							<li id="news_tab"><a href="#news">News</a></li>
							<li id="sports_tab"><a href="#sports">Sports</a></li>
							<li id="opinion_tab"><a href="#opinion">Opinion</a></li>
							<li id="entertainment_tab"><a href="#entertainment">Entertainment</a></li>
							<li id="multimedia_tab"><a href="#multimedia">Multimedia</a></li>
							<li id="comments_tab"><a href="#comments">Comments</a></li>
						</ul>
						<div id="news">
							<ul>
								<li><h3>Top Stories in <a href="#">News</a>:</h3></li>
								<li><a href="#">Here is an interesting news article!</a></li>
								<li><a href="#">Here is an interesting news article!</a></li>
								<li><a href="#">Here is an interesting news article!</a></li>
								<li><a href="#">Here is an interesting news article!</a></li>
								<li><a href="#">Here is an interesting news article!</a></li>
							</ul>
						</div>
						<div id="sports">
							<ul>
								<li><h3>Top Stories in <a href="#">Sports</a>:</h3></li>
								<li><a href="#">Here is a cool sports article!</a></li>
								<li><a href="#">Here is a cool sports article!</a></li>
								<li><a href="#">Here is a cool sports article!</a></li>
								<li><a href="#">Here is a cool sports article!</a></li>
							</ul>
						</div>
						<div id="opinion">
							<ul>
								<li><h3>Top Stories in <a href="#">Opinion</a>:</h3></li>
								<li><a href="#">Here is a poorly written letter to the editor!</a></li>
								<li><a href="#">Here is a poorly written letter to the editor!</a></li>
								<li><a href="#">Here is a poorly written letter to the editor!</a></li>
								<li><a href="#">Here is a poorly written letter to the editor!</a></li>
								<li><a href="#">Here is a poorly written letter to the editor!</a></li>
							</ul>
						</div>
						<div id="entertainment">
							<ul>
								<li><h3>Top Stories in <a href="#">Entertainment</a>:</h3></li>
								<li><a href="#">Here is an interesting entertainment article!</a></li>
								<li><a href="#">Here is an interesting entertainment article!</a></li>
								<li><a href="#">Here is an interesting entertainment article!</a></li>
							</ul>
						</div>
						<div id="multimedia">
							<ul>
								<li><h3>Top <a href="#">Multimedia</a> Pieces:</h3></li>
								<li><a href="#">Here is a link to a multimedia piece!</a></li>
								<li><a href="#">Here is a link to a multimedia piece!</a></li>
								<li><a href="#">Here is a link to a multimedia piece!</a></li>
								<li><a href="#">Here is a link to a multimedia piece!</a></li>
								<li><a href="#">Here is a link to a multimedia piece!</a></li>
							</ul>
						</div>
						<div id="comments">
							<ul>
								<li><h3>Recent Comments in <a href="#">News</a>:</h3></li>
								<li><a href="#">John</a> said: "Lorem ipsum dolor sit amet..." <small>(21 mins ago)</small></li>
								<li><a href="#">Bob</a> said: "Lorem ipsum dolor sit amet, consectetur adipisicing..." <small>(41 mins ago)</small></li>
								<li><a href="#">Lenny</a> said: "Lorem ipsum dolor sit amet..." <small>(1 hrs ago)</small></li>
								<li><a href="#">Curly</a> said: "Lorem ipsum dolor sit amet, consectetur adipisicing..." <small>(6 hrs ago)</small></li>
								<li><a href="#">Moe</a> said: "Lorem ipsum dolor sit amet..." <small>(2 days ago)</small></li>
							</ul>
						</div>
<br />
					<div class="dark" id="newsletter">
						<h3>Subscribe to our eNewsletter</h3>
						<form method="post" action="#" id="newsletterform">
							<p>Fresh headlines, delivered daily, to your inbox.</p>
							<input id="subscribe" type="text" name="subscribe" value="Your Email" />
							<input type="submit" value="Subscribe" />&nbsp;<input type="submit" value="Unsubscribe" />
						</form>
					</div>
				</div>
			</div>
{% endblock content %}