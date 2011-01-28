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
						<img src="style_chroma/images/ads/skyscraper.png" alt="advertisement" />
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
									<li><h3>Top Stories in <a href="{{ 'section/news'|url }}">News</a>:</h3></li>
									<ul>
									{% for item in news %}
										<li><a href="{{ item.url }}">{{ item.headline }}</a>
									{% endfor %}
									</ul>
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
						</div>					</div>

						<div class="grid_2 omega">
						</div>



				<!-- Front page
					<div class="grid_2 omega">
						{% fetch pdf from media with [
							'where': 'status = 1',
							'limit': 1,
							'order': 'uid desc',
							'withTags': ['frontpage', 'pdf']
						] %}
						<div class="dark" id="front_pdf">
							<h3>Today's Front Page</h3>
							<a href="{{ pdf[0].urlOriginal }}">
							<img src="{{ pdf[0].urlPreview }}" alt="frontpage" class="front_pdf" />
							</a>
						</div>
					</div>
				-->
				
				
				
				</div>
			<div class="grid_12">
				<div class="grid_4 alpha">
					<div class="dark featured_multimedia" id="featured_multimedia">
				
						<h3>Featured Multimedia</h3>
						
						<div id="featured_multimedia1">
							{% fetch multimedia from media with [
							'limit': 1,
							'order': 'self:weight desc, self:created desc',
							'withTags': ['Multimedia Box']
							] %}
							
							{% include "gryphon/main/box.tpl" %}
						</div>

						<div id="featured_multimedia2">
							{% fetch multimedia from media with [
							'limit': 1,
							'order': 'self:weight desc, self:created desc',
							'withTags': ['Multimedia Box']
							] %}
							
							{% include "gryphon/main/box.tpl" %}
						</div>		

						<div id="featured_multimedia3">
							{% fetch multimedia from media with [
							'limit': 1,
							'order': 'self:weight desc, self:created desc',
							'withTags': ['Multimedia Box']
							] %}
							
							{% include "gryphon/main/box.tpl" %}
						</div>	

						<div id="featured_multimedia4">
							{% fetch multimedia from media with [
							'limit': 1,
							'order': 'self:weight desc, self:created desc',
							'withTags': ['Multimedia Box']
							] %}
							
							{% include "gryphon/main/box.tpl" %}
						</div>
							
							<div id="featured_multimedia5">
							{% fetch multimedia from media with [
							'limit': 1,
							'order': 'self:weight desc, self:created desc',
							'withTags': ['Multimedia Box']
							] %}
							
							{% include "gryphon/main/box.tpl" %}
						</div>
						
						<div id="featured_multimedia6">
							{% fetch multimedia from media with [
							'limit': 1,
							'order': 'self:weight desc, self:created desc',
							'withTags': ['Multimedia Box']
							] %}
							
							{% include "gryphon/main/box.tpl" %}
						</div>

						<div id="featured_multimedia7">
							{% fetch multimedia from media with [
							'limit': 1,
							'order': 'self:weight desc, self:created desc',
							'withTags': ['Multimedia Box']
							] %}
							
							{% include "gryphon/main/box.tpl" %}
						</div>

						<div id="featured_multimedia8">
							{% fetch multimedia from media with [
							'limit': 1,
							'order': 'self:weight desc, self:created desc',
							'withTags': ['Multimedia Box']
							] %}
							
							{% include "gryphon/main/box.tpl" %}
						</div>

						<div id="featured_multimedia9">
							{% fetch multimedia from media with [
							'limit': 1,
							'order': 'self:weight desc, self:created desc',
							'withTags': ['Multimedia Box']
							] %}
							
							{% include "gryphon/main/box.tpl" %}
						</div>

						<div id="featured_multimedia10">
							{% fetch multimedia from media with [
							'limit': 1,
							'order': 'self:weight desc, self:created desc',
							'withTags': ['Multimedia Box']
							] %}
							
							{% include "gryphon/main/box.tpl" %}
						</div>

						<ul>
					        <li><a href="#featured_multimedia1">1</a></li>
					        <li><a href="#featured_multimedia2">2</a></li>
					        <li><a href="#featured_multimedia3">3</a></li>
							<li><a href="#featured_multimedia4">4</a></li>
					        <li><a href="#featured_multimedia5">5</a></li>
					        <li><a href="#featured_multimedia6">6</a></li>
							<li><a href="#featured_multimedia7">7</a></li>
					        <li><a href="#featured_multimedia8">8</a></li>
					        <li><a href="#featured_multimedia9">9</a></li>
							<li><a href="#featured_multimedia10">10</a></li>
					    </ul>
				
					</div>
					
				</div>
				
				
				<div class="grid_4">
								
					<div id="upcoming_events">
						<h3>Upcoming Events</h3>
												
						
						<ul id="calendar">
						
						{% set start = 'Today 00:00:00'|toTime %}
						{% set end = '+0 days'|toTime(start) %}
	
						{% for i in start|range(end, 86400) %}
						{% set events = 'google:calendarEvent'|call('findInRange', [i, (i+86400), 3]) %}
							<li>
							<a href="#upcoming_events1">
							<h3 class="day">{{ i|date('D') }}</h3>
							<h1 class="number">{{ i|date('j') }}</h1>
							</a>
							</li>
							
						{% endfor %}
							
						{% set start = 'Tomorrow 00:00:00'|toTime %}
						{% set end = '+0 days'|toTime(start) %}
	
						{% for i in start|range(end, 86400) %}
						{% set events = 'google:calendarEvent'|call('findInRange', [i, (i+86400), 3]) %}

							<li>
							<a href="#upcoming_events2">
							<h3 class="day">{{ i|date('D') }}</h3>
							<h1 class="number">{{ i|date('j') }}</h1>
							</a>
							</li>
						{% endfor %}	
							
						{% set start = '+2 days 00:00:00'|toTime %}
						{% set end = '+0 days'|toTime(start) %}
	
						{% for i in start|range(end, 86400) %}
						{% set events = 'google:calendarEvent'|call('findInRange', [i, (i+86400), 3]) %}

							<li>
							<a href="#upcoming_events3">
							<h3 class="day">{{ i|date('D') }}</h3>
							<h1 class="number">{{ i|date('j') }}</h1>
							</a>
							</li>
						{% endfor %}	
						
						{% set start = '+3 days 00:00:00'|toTime %}
						{% set end = '+0 days'|toTime(start) %}
	
						{% for i in start|range(end, 86400) %}
						{% set events = 'google:calendarEvent'|call('findInRange', [i, (i+86400), 3]) %}

							<li>
							<a href="#upcoming_events4">
							<h3 class="day">{{ i|date('D') }}</h3>
							<h1 class="number">{{ i|date('j') }}</h1>
							</a>
							</li>
						{% endfor %}	
						
						{% set start = '+4 days 00:00:00'|toTime %}
						{% set end = '+0 days'|toTime(start) %}
	
						{% for i in start|range(end, 86400) %}
						{% set events = 'google:calendarEvent'|call('findInRange', [i, (i+86400), 3]) %}

							<li>
							<a href="#upcoming_events5">
							<h3 class="day">{{ i|date('D') }}</h3>
							<h1 class="number">{{ i|date('j') }}</h1>
							</a>
							</li>
						{% endfor %}	
						
						</ul>
					    				
					   <div id="upcoming_events1">

							<ul>
								{% set start = 'Today 00:00:00'|toTime %}
								{% set end = '+0 days'|toTime(start) %}
			
								{% for i in start|range(end, 86400) %}
								{% set events = 'google:calendarEvent'|call('findInRange', [i, (i+86400), 3]) %}
								<li>Events Scheduled for Today:</li>
								{% if events.length %}
								{% for event in events %}
						<li>
							<a href="{{ event.url }}">{{ event.title }}</a><br />
							<div class="small">
								{% if event.allday %}
									All day
								{% else %}
									starts at {{ event.start_time|date('g:ia') }}
								{% endif %}
								</div>
								</li>
								{% endfor %}
								{% else %}
								<li>Sorry, no events for this day</li>
								{% endif %}
		
								{% endfor %}
							</ul>
					    </div>


					   <div id="upcoming_events2">

							<ul>
								{% set start = 'Today 00:00:00'|toTime %}
								{% set end = '+0 days'|toTime(start) %}
			
								{% for i in start|range(end, 86400) %}
								{% set events = 'google:calendarEvent'|call('findInRange', [i, (i+86400), 3]) %}
								<li>Events Scheduled for Today:</li>
								{% if events.length %}
								{% for event in events %}
						<li>
							<a href="{{ event.url }}">{{ event.title }}</a><br />
							<div class="small">
								{% if event.allday %}
									All day
								{% else %}
									starts at {{ event.start_time|date('g:ia') }}
								{% endif %}
								</div>
								</li>
								{% endfor %}
								{% else %}
								<li>Sorry, no events for this day</li>
								{% endif %}
		
								{% endfor %}
							</ul>
					    </div>


					   <div id="upcoming_events3">

							<ul>
								{% set start = 'Today 00:00:00'|toTime %}
								{% set end = '+0 days'|toTime(start) %}
			
								{% for i in start|range(end, 86400) %}
								{% set events = 'google:calendarEvent'|call('findInRange', [i, (i+86400), 3]) %}
								<li>Events Scheduled for Today:</li>
								{% if events.length %}
								{% for event in events %}
						<li>
							<a href="{{ event.url }}">{{ event.title }}</a><br />
							<div class="small">
								{% if event.allday %}
									All day
								{% else %}
									starts at {{ event.start_time|date('g:ia') }}
								{% endif %}
								</div>
								</li>
								{% endfor %}
								{% else %}
								<li>Sorry, no events for this day</li>
								{% endif %}
		
								{% endfor %}
							</ul>
					    </div>

					   <div id="upcoming_events4">

							<ul>
								{% set start = 'Today 00:00:00'|toTime %}
								{% set end = '+0 days'|toTime(start) %}
			
								{% for i in start|range(end, 86400) %}
								{% set events = 'google:calendarEvent'|call('findInRange', [i, (i+86400), 3]) %}
								<li>Events Scheduled for Today:</li>
								{% if events.length %}
								{% for event in events %}
						<li>
							<a href="{{ event.url }}">{{ event.title }}</a><br />
							<div class="small">
								{% if event.allday %}
									All day
								{% else %}
									starts at {{ event.start_time|date('g:ia') }}
								{% endif %}
								</div>
								</li>
								{% endfor %}
								{% else %}
								<li>Sorry, no events for this day</li>
								{% endif %}
		
								{% endfor %}
							</ul>
					    </div>

					   <div id="upcoming_events5">

							<ul>
								{% set start = 'Today 00:00:00'|toTime %}
								{% set end = '+0 days'|toTime(start) %}
			
								{% for i in start|range(end, 86400) %}
								{% set events = 'google:calendarEvent'|call('findInRange', [i, (i+86400), 3]) %}
								<li>Events Scheduled for Today:</li>
								{% if events.length %}
								{% for event in events %}
						<li>
							<a href="{{ event.url }}">{{ event.title }}</a><br />
							<div class="small">
								{% if event.allday %}
									All day
								{% else %}
									starts at {{ event.start_time|date('g:ia') }}
								{% endif %}
								</div>
								</li>
								{% endfor %}
								{% else %}
								<li>Sorry, no events for this day</li>
								{% endif %}
		
								{% endfor %}
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
