   {% extends "gryphon/base.tpl" %}

{% block title %} :: {{ section.name }}{% endblock %}
{% block active %}news{% endblock %}
{% block subActive %}News{% endblock %}

{% block content %}


{% set topStory = articles.shift() %}
{% set featuredStories = articles.shift(2) %}
{% import "macros/article.tpl" as articleRender %}
<!DOCTYPE html>

<div class="container_12">
{% include "gryphon/ads/leaderboard.tpl" %}
		
			<div class="grid_12">
				<div class="grid_4 alpha">
					{{ articleRender.abstract5Col(topStory) }}
				</div>
				<div class="grid_3">
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
						By {{ topPost.authors.splat('name')|join(', ') }}
						<span class="byline_divider">|</span>
					{% endif %}
					Published {{ topPost.created|date('m/d') }}
						<p>					
						</div>
					{{ topPost.abstract_formatted }}
					 <a href="#" class="dark"><span>More</span></a>
					</p>
					<br />
					<h2><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing</a></h2>
					<div class="dark byline">
						<span class="date">Jan 13, 2011</span>
						<a class="author" href="#">John Doe</a>
					</div>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea. <a href="#" class="dark"><span>More</span></a></p>
				</div>
				<div class="grid_3">
					<h2><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing</a></h2>
					<div class="dark byline">
						<span class="date">Jan 13, 2011</span>
						<a class="author" href="#">John Doe</a>
					</div>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea. <a href="#" class="dark"><span>More</span></a></p>
					<br />
					<h2><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing</a></h2>
					<div class="dark byline">
						<span class="date">Jan 13, 2011</span>
						<a class="author" href="#">John Doe</a>
					</div>
					<p><img class="section_sub" src="img/dummy/ftr3.jpg" />Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea. <a href="#" class="dark"><span>More</span></a></p>
				</div>
				<div class="grid_2 omega" style="text-align: right;">
				{% include "gryphon/ads/skyscraper.tpl" %}				</div>
			</div>
			<div class="grid_12" id="secondary">
				<div class="grid_4 alpha">
					<img src="img/ads/square.png" alt="advertisement" />
					<ul class="more_stories">
						<li><h3>More Stories from <a href="#">News</a>:</h3></li>
						<li><a href="#">Lorem ipsum dolor sit amet</a> <span>(Nov 10)</span></li>
						<li><a href="#">Lorem ipsum dolor sit amet consectetur</a> <span>(Nov 10)</span></li>
						<li><a href="#">Lorem ipsum dolor sit amet adipisicing</a> <span>(Nov 9)</span></li>
						<li><a href="#">Lorem ipsum dolor sit amet adipisicing</a> <span>(Nov 8)</span></li>
						<li><a href="#">Lorem ipsum dolor sit</a> <span>(Nov 2)</span></li>
					</ul>
						
				</div>
				<div class="grid_5">
					<h2><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing</a></h2>
					<div class="dark byline">
						<span class="date">Jan 13, 2011</span>
						<a class="author" href="#">John Doe</a>
						<a class="comment" href="#">0 Comments</a>
					</div>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Velit esse cillum dolore eu fugiat nulla pariatur. deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. <a href="#" class="dark"><span>More</span></a></p>
					<br />
					<h2><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing</a></h2>
					<div class="dark byline">
						<span class="date">Jan 13, 2011</span>
						<a class="author" href="#">John Doe</a>
						<a class="comment" href="#">0 Comments</a>
					</div>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Velit esse cillum dolore eu fugiat nulla pariatur. deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. <a href="#" class="dark"><span>More</span></a></p>
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
					</div>
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