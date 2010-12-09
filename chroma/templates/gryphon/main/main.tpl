{% extends "gryphon/base.tpl" %}

{% block content %}

{% set topStory = articles.shift() %}
{% set secondaryStories = articles.shift(3) %}
{% import "macros/article.tpl" as articleRender %}


<div class="container_12">
			
			
			<div class="grid_12">
				<div class="grid_5 alpha">
					<h1><a href="article.php">Lorem ipsum dolor sit amet consectetur adipisicing elit</a></h1>
					<div class="dark byline">
						<span class="date"><?php echo date("M d, Y"); ?></span>
						<a class="author" href="#">John Doe</a>
						<a class="comment" href="#">0 Comments</a>
					</div>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Velit esse cillum dolore eu fugiat nulla pariatur. deserunt mollit anim id est laborum. <a href="#" class="dark"><span>More</span></a></p>
				</div>
				<div class="grid_7 omega">
					<div id="featured_stories">
					    <ul>
					        <li class="active"><a href="#featured_story1"><img src="{{ 'style_chroma/images/dummy/ftr1.jpg'|url }}" alt="featured" /></a></li>
					        <li><a href="#featured_story2"><img src="{{ 'style_chroma/images/dummy/ftr2.jpg'|url }}" alt="featured" /></a></li>
					        <li><a href="#featured_story3"><img src="{{ 'style_chroma/images/dummy/ftr3.jpg'|url }}" alt="featured" /></a></li>
					    </ul>
					    <div id="featured_story1">
					    	<img src="{{ 'style_chroma/images/dummy/ftr1.jpg'|url }}" alt="featured" />
							<div class="caption">
								<h3><a href="#">Lorem ipsum dolor sit amet</a></h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
							</div>
					    </div>
					    <div id="featured_story2">
					       <img src="{{ 'style_chroma/images/dummy/ftr2.jpg'|url }}" alt="featured" />
							<div class="caption">
								<h3><a href="#">Lorem ipsum dolor sit amet</a></h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
							</div>
					    </div>
					    <div id="featured_story3">
					        <img src="{{ 'style_chroma/images/dummy/ftr3.jpg'|url }}" alt="featured" />
							<div class="caption">
								<h3><a href="#">Lorem ipsum dolor sit amet</a></h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
							</div>
					    </div>
					</div>
				</div>
			</div>
			<div class="grid_12" id="secondary">
				<div class="grid_9 alpha">
					<div class="grid_9 alpha omega">
						<div class="grid_3 alpha">
							<h2><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing</a></h2>
							<div class="dark byline">
								<span class="date"><?php echo date("M d, Y"); ?></span>
								<a class="author" href="#">John Doe</a>
							</div>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Velit esse cillum dolore eu fugiat nulla pariatur. deserunt mollit anim id est laborum. <a href="#" class="dark"><span>More</span></a></p>
						</div>
						<div class="grid_3">
							<h2><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing</a></h2>
							<div class="dark byline">
								<span class="date"><?php echo date("M d, Y"); ?></span>
								<a class="author" href="#">John Doe</a>
							</div>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Velit esse cillum dolore eu fugiat nulla pariatur. deserunt mollit anim id est laborum. <a href="#" class="dark"><span>More</span></a></p>
						</div>
						<div class="grid_3 omega">
							<h2><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing</a></h2>
							<div class="dark byline">
								<span class="date"><?php echo date("M d, Y"); ?></span>
								<a class="author" href="#">John Doe</a>
							</div>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Velit esse cillum dolore eu fugiat nulla pariatur. deserunt mollit anim id est laborum. <a href="#" class="dark"><span>More</span></a></p>
						</div>
					</div>
					
					{% fetch news from article with [
					'limit': 6,
					'order': 'weight desc, created desc',
					'where': 'status = 1',
					'withTags': ['news']
					]
		%}
					<div class="grid_9 alpha omega">
						<div class="grid_3 alpha">
							<ul class="more_from">
								<li><h3>More from <a href="#">News</a>:</h3></li>
								{% for article in articles %}
								<li><h4><a href="{{ article.url }}">{{ article.headline }}</a></h4></li>
								{% endfor %}
							</ul>
							
							</ul>
						</div>
						
		{% fetch sports from article with [
					'limit': 6,
					'order': 'weight desc, created desc',
					'where': 'status = 1',
					'withTags': ['sports']
					]
		%}
						<div class="grid_3">
							<ul class="more_from">
								<li><h3>More from <a href="#">Sports</a>:</h3></li>
								{% for item in sports %}
								<li><h4><a href="{{ item.url }}">{{ item.headline }}</a></h4></li>
								{% endfor %}
							</ul>
						</div>
						{% fetch opinion from article with [
					'limit': 6,
					'order': 'weight desc, created desc',
					'where': 'status = 1',
					'withTags': ['opinion']
					]
		%}
						<div class="grid_3 omega">
							<ul class="more_from">
								<li><h3>More from <a href="#">Opinion</a>:</h3></li>
								{% for item in opinion %}
								<li><h4><a href="{{ item.url }}">{{ item.headline }}</a></h4></li>
							{% endfor %}
							</ul>
						</div>
					</div>
				</div>
				<div class="grid_3 omega" style="text-align: right;">
					<img src="{{ 'style_chroma/images/ads/skyscraper.png'|url }}" alt="advertisement" />
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
							<li><a href="#upcoming_events1"><?php echo "<span class=\"day\">",date("D"),"</span><span class=\"num\">",date("d"),"</span>"; ?></a></li>
							<li><a href="#upcoming_events2"><?php echo "<span class=\"day\">",date("D", mktime(0, 0, 0, date("m"), date("d")+1, date("y"))),"</span><span class=\"num\">",date("d", mktime(0, 0, 0, date("m"), date("d")+1, date("y"))),"</span>"; ?></a></li>
							<li><a href="#upcoming_events3"><?php echo "<span class=\"day\">",date("D", mktime(0, 0, 0, date("m"), date("d")+2, date("y"))),"</span><span class=\"num\">",date("d", mktime(0, 0, 0, date("m"), date("d")+2, date("y"))),"</span>"; ?></a></li>
							<li><a href="#upcoming_events4"><?php echo "<span class=\"day\">",date("D", mktime(0, 0, 0, date("m"), date("d")+3, date("y"))),"</span><span class=\"num\">",date("d", mktime(0, 0, 0, date("m"), date("d")+3, date("y"))),"</span>"; ?></a></li>
							<li><a href="#upcoming_events5"><?php echo "<span class=\"day\">",date("D", mktime(0, 0, 0, date("m"), date("d")+4, date("y"))),"</span><span class=\"num\">",date("d", mktime(0, 0, 0, date("m"), date("d")+4, date("y"))),"</span>"; ?></a></li>
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
			<div class="grid_12" id="footer">
				<div class="grid_2 alpha">
					<ul>
						<li><h3>News</h3></li>
						<li><a href="#">Campus</a></li>
						<li><a href="#">City</a></li>
						<li><a href="#">Police Briefs</a></li>
						<li><a href="#">Crime Map</a></li>
					</ul>
					<ul>
						<li><h3>Opinion</h3></li>
						<li><a href="#">Editorials</a></li>
						<li><a href="#">Columns</a></li>
						<li><a href="#">Letters</a></li>
					</ul>
					<ul>
						<li><h3>Entertainment</h3></li>
						<li><a href="#">Dining Guide</a></li>
						<li><a href="#">Calendar</a></li>
					</ul>
				</div>
				<div class="grid_2">
					<ul>
						<li><h3>Sports</h3></li>
						<li><a href="#">Baseball</a></li>
						<li><a href="#">Basketball</a></li>
						<li><a href="#">Cross Country</a></li>
						<li><a href="#">Football</a></li>
						<li><a href="#">Golf</a></li>
						<li><a href="#">Gymnastics</a></li>
						<li><a href="#">Ice Hockey</a></li>
						<li><a href="#">Soccer</a></li>
						<li><a href="#">Softball</a></li>
						<li><a href="#">Swimming &amp; Diving</a></li>
						<li><a href="#">Track & Field</a></li>
						<li><a href="#">Volleyball</a></li>
					</ul>
				</div>
				<div class="grid_2">
					<ul>
						<li><a href="#">Blogs</a></li>
						<li><a href="#">Classifieds</a></li>
						<li><a href="#">Religious Guide</a></li>
						<li><a href="#">Puzzles</a></li>
						<li><a href="#">Mobile Edition</a></li>
					</ul>
					<ul>
						<li><h3>Multimedia</h3></li>
						<li><a href="#">Videos</a></li>
						<li><a href="#">Photo Galleries</a></li>
						<li><a href="#">Podcasts</a></li>
					</ul>
					<ul>
						<li><h3>Features</h3></li>
						<li><a href="#">Special Editions</a></li>
					</ul>
				</div>
				<div class="grid_2">
					<ul>
						<li><a href="#">Archives</a></li>
						<li><a href="#">Search</a></li>
						<li><a href="#">Feeds</a></li>
						<li><a href="#">Photo Reprints</a></li>
						<li><a href="#">Advertise With Us</a></li>
						<li><a href="#">Alumni</a></li>
						<li><a href="#">Work Here</a></li>
						<li><a href="#">Contact Us</a></li>
						<li><a href="#">Privacy Policy</a></li>
					</ul>
					<ul>
						<li class="title">Follow Us:</li>
						<li><a class="facebook" href="#">Facebook</a></li>
						<li><a class="twitter" href="#">Twitter</a></li>
					</ul>
				</div>

				<div class="grid_2" style="width: 120px;">
					<ul>
						<li><a href="#"><img class="front_pdf" src="{{ 'style_chroma/images/dummy/front_pdf.jpg'|url }}" alt="frontpage" /></a></li>
						<li><a href="#">More Page Fronts</a></li>
						<li><a href="#">Reprints</a></li>
					</ul>
				</div>
				<div class="grid_2 omega">
					<p><b>Detroit Softworks</b> offers a hosted CMS, web ad management, and reprint sales solution for your publication. With unprecedented control over your site’s design and Web ads, content delivery via state-of-the art Macintosh server hardware, and ecommerce-grade security, you can rest easy in the knowledge that <b>It. Just. Works.</b></p>
				</div>
				<div class="clear"></div>
				<div id="copyright">
					<p>&copy; Copyright 2009 Detroit Softworks. All Rights Reserved.<br /><small>Valid <a href="http://validator.w3.org/check/referer">HTML5</a> and <a href="#">CSS3</a></small><p>
					<a id="powered" href="http://detroitsoftworks.com">Powered by Detroit Softworks</a>
				</div>
			</div>
		</div>

{% endblock content %}
