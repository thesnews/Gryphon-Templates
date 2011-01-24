{% extends "gryphon/base.tpl" %}

{% block content %}

{% set topStory = articles.shift() %}
{% set secondaryStories = articles.shift(3) %}
{% import "macros/article.tpl" as articleRender %}


			<div class="grid_12">
				
					{{ articleRender.abstract5Col(topStory) }}
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
							<span class="byline_divider">|</span>
							{% endif %}
							<span class="date">{{ topPost.created|date('M d, Y') }}</span
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
							<span class="byline_divider">|</span>
							{% endif %}
							<span class="date">{{ topPost.created|date('M d, Y') }}</span
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
							<span class="byline_divider">|</span>
							{% endif %}
							<span class="date">{{ topPost.created|date('M d, Y') }}</span
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
									<li><h3>More from <a href="#">News</a>:</h3></li>
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
				
						<div class="grid_3 omega">
						{% include 'gryphon/ads/skyscraper.tpl' %}
						</div>
						
			</div>
		</div>
			<div class="grid_12">
					<div class="grid_4 alpha square">
						<img src="{{ 'style_chroma/images/ads/square.png'|url }}" alt="advertisement" />
					</div>
					<div class="grid_3">
						<div id="poll">
							<div class="dark">
								<h3>Poll of the Week</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing?</p>
								<div id="vote">
									<form action="#" method="post" id="pollform">
									    <input type="radio" name="button" value="#" /> Yes<br />
										<input type="radio" name="button" value="#" /> No<br />
										<input type="radio" name="button" value="#" /> Maybe<br />
									    <input type="submit" id="submit" value="Submit" />
										<a href="#">Poll Archive</a>
									 </form>
								</div>
								<div id="results">
									<img id="poll_chart"  src="http://chart.apis.google.com/chart?cht=p&amp;chd=t:20,70,10&amp;chs=197x70&amp;chl=Yes|No|Maybe&amp;chco=666666,cecece,b9b9b9" />
									<span>Thanks for voting! | <a href="#">Poll Archive</a></span>
								</div>
							</div>
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
					<div class="grid_3">
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
									<li><h3>Recent <a href="#">Comments</a>:</h3></li>
									<li><a href="#">John</a> said: "Lorem ipsum dolor sit amet..." <small>(21 mins ago)</small></li>
									<li><a href="#">Bob</a> said: "Lorem ipsum dolor sit amet, consectetur adipisicing..." <small>(41 mins ago)</small></li>
									<li><a href="#">Lenny</a> said: "Lorem ipsum dolor sit amet..." <small>(1 hrs ago)</small></li>
									<li><a href="#">Curly</a> said: "Lorem ipsum dolor sit amet, consectetur adipisicing..." <small>(6 hrs ago)</small></li>
									<li><a href="#">Moe</a> said: "Lorem ipsum dolor sit amet..." <small>(2 days ago)</small></li>
								</ul>
							</div>

						</div>
					</div>

					<div class="grid_2 omega">
						<div class="dark" id="front_pdf">
							<h3>Today's Front Page</h3>
							<a href="#"><img class="front_pdf" src="{{ 'style_chroma/images/dummy/front_pdf.jpg'|url }}"></a>
						</div>
					</div>
				</div>
			<div class="grid_12">
				<div class="grid_4 alpha">
					<div class="dark" id="featured_multimedia">
						<h3>Featured Multimedia</h3>
					    <div id="featured_multimedia1">
							<a href="#">
					    		<img src="{{ 'style_chroma/images/dummy/ftr1.jpg'|url }}" alt="featured" />
								<div class="caption">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
								</div>
							</a>
					    </div>
					    <div id="featured_multimedia2">
							<a href="#">
					       		<img src="{{ 'style_chroma/images/dummy/ftr2.jpg'|url }}" alt="featured" />
								<div class="caption">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
								</div>
							</a>
					    </div>
					    <div id="featured_multimedia3">
							<a href="#">
					        	<img src="{{ 'style_chroma/images/dummy/ftr3.jpg'|url }}" alt="featured" />
								<div class="caption">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
								</div>
							</a>
					    </div>
						<ul>
					        <li><a href="#featured_multimedia1">1</a></li>
					        <li><a href="#featured_multimedia2">2</a></li>
					        <li><a href="#featured_multimedia3">3</a></li>
							<li><a href="#featured_multimedia1">4</a></li>
					        <li><a href="#featured_multimedia2">5</a></li>
					        <li><a href="#featured_multimedia3">6</a></li>
							<li><a href="#featured_multimedia1">7</a></li>
					        <li><a href="#featured_multimedia2">8</a></li>
					        <li><a href="#featured_multimedia3">9</a></li>
							<li><a href="#featured_multimedia1">10</a></li>
					    </ul>
					</div>
				</div>
				
				
				<div class="grid_4">
					<div id="upcoming_events">
						<h3>Upcoming Events</h3>
						<ul id="calendar">
							<li><a href="#upcoming_events1">
							<?php echo "<span class=\"day\">",date("D"),"</span><span class=\"num\">",date("d"),"</span>"; ?>
							</a></li>
							<li><a href="#upcoming_events2">
							<?php echo "<span class=\"day\">",date("D", mktime(0, 0, 0, date("m"), date("d")+1, date("y"))),"</span><span class=\"num\">",date("d", mktime(0, 0, 0, date("m"), date("d")+1, date("y"))),"</span>"; ?>
							</a></li>
							<li><a href="#upcoming_events3">
							<?php echo "<span class=\"day\">",date("D", mktime(0, 0, 0, date("m"), date("d")+2, date("y"))),"</span><span class=\"num\">",date("d", mktime(0, 0, 0, date("m"), date("d")+2, date("y"))),"</span>"; ?>
							</a></li>
							<li><a href="#upcoming_events4">
							<?php echo "<span class=\"day\">",date("D", mktime(0, 0, 0, date("m"), date("d")+3, date("y"))),"</span><span class=\"num\">",date("d", mktime(0, 0, 0, date("m"), date("d")+3, date("y"))),"</span>"; ?>
							</a></li>
							<li><a href="#upcoming_events5">
							<?php echo "<span class=\"day\">",date("D", mktime(0, 0, 0, date("m"), date("d")+4, date("y"))),"</span><span class=\"num\">",date("d", mktime(0, 0, 0, date("m"), date("d")+4, date("y"))),"</span>"; ?>
							</a></li>
						</ul>
					    <div id="upcoming_events1">
							<ul>
								<li>Events Scheduled for Today:</li>
								<li><a href="#">Lorem ipsum dolor sit amet</a> <small>(Starts at 7pm)</small></li>
								<li><a href="#">Lorem ipsum dolor sit amet</a> <small>(Starts at 8pm)</small></li>
								<li><a href="#">Lorem ipsum dolor sit amet</a> <small>(All Day)</small></li>
							</ul>
					    </div>
						<div id="upcoming_events2">
							<ul>
								<li>Events Scheduled for Tomorrow:</li>
								<li><a href="#">Lorem ipsum dolor sit amet</a> <small>(Starts at 7pm)</small></li>
								<li><a href="#">Lorem ipsum dolor sit amet</a> <small>(Starts at 8pm)</small></li>
								<li><a href="#">Lorem ipsum dolor sit amet</a> <small>(All Day)</small></li>
							</ul>
					    </div>
						<div id="upcoming_events3">
							<ul>
								<li>Events Scheduled for <?php echo date("l", mktime(0, 0, 0, date("m"), date("d")+2, date("y"))); ?>:</li>
								<li><a href="#">Lorem ipsum dolor sit amet</a> <small>(Starts at 7pm)</small></li>
								<li><a href="#">Lorem ipsum dolor sit amet</a> <small>(Starts at 8pm)</small></li>
								<li><a href="#">Lorem ipsum dolor sit amet</a> <small>(All Day)</small></li>
							</ul>
					    </div>
						<div id="upcoming_events4">
							<ul>
								<li>Events Scheduled for <?php echo date("l", mktime(0, 0, 0, date("m"), date("d")+3, date("y"))); ?>:</li>
								<li><a href="#">Lorem ipsum dolor sit amet</a> <small>(Starts at 7pm)</small></li>
								<li><a href="#">Lorem ipsum dolor sit amet</a> <small>(Starts at 8pm)</small></li>
								<li><a href="#">Lorem ipsum dolor sit amet</a> <small>(All Day)</small></li>
							</ul>
					    </div>
						<div id="upcoming_events5">
							<ul>
								<li>Events Scheduled for <?php echo date("l", mktime(0, 0, 0, date("m"), date("d")+4, date("y"))); ?>:</li>
								<li><a href="#">Lorem ipsum dolor sit amet</a> <small>(Starts at 7pm)</small></li>
								<li><a href="#">Lorem ipsum dolor sit amet</a> <small>(Starts at 8pm)</small></li>
								<li><a href="#">Lorem ipsum dolor sit amet</a> <small>(All Day)</small></li>
							</ul>
					    </div>
					</div>
				</div>
				
				
				<div class="grid_4 omega">
					<img src="{{ 'style_chroma/images/ads/button.png'|url }}" alt="advertisement" style="float: left" />
					<img src="{{ 'style_chroma/images/ads/button.png'|url }}" alt="advertisement" style="float: right" />
				</div>
			</div>

		</div>


{% endblock content %}
