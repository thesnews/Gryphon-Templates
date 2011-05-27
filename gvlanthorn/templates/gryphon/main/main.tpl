{% extends "gryphon/base.tpl" %}

{% block content %}

{% set topStory = articles.shift() %}
{% set secondaryStories = articles.shift(3) %}
{% import "macros/article.tpl" as articleRender %}

	
	<div class="grid_5">

		{{ articleRender.abstract5Col(topStory) }}		
	
	</div>

	<div class="grid_3">
		{% for article in secondaryStories %}
			{{ articleRender.abstract3Col(article) }}
		{% endfor %}			
				
	</div>

	<div class="grid_4">
	
		<!- search needs to be updated >
		<form method="get" id="searchform" class="mb" action="/index.php/search/" >
			<input type="text" name="q" size="30" value="" /> <input type="submit" id="searchsubmit" value="Search" />
		</form>
		
		{% fetch multimedia from media with [
			'limit': 5,
			'order': 'self:weight desc, self:created desc',
		] %}
		<div class="mod-head">
			<h4>Featured Multimedia</h4>
		</div>

			<ul>
			{% for media in multimedia %}
				<li>
					<a href="{{ media.urlDefault }}"><img src="{{ media.url }}" alt="{{ media.title }}" /></a>
					<p>
						<strong>{{ media.type }}: {{ media.title }}</strong>
						<br />
						{{ media.caption|clip }}
					</p>
				</li>
			{% endfor %}
			</ul>
		
		</div>

	<hr class="grid_12 thick" />

	<div class="grid_3">
		<h2 class="mmb">News</h2>
		<hr class="mmb" />
		{% fetch news from article with [
		'limit': 6,
		'order': 'weight desc, created desc',
		'where': 'status = 1',
		'withTags': ['news']
		]
		%}
		<ul class="links mb">
			{% for article in news %}
			<li><a href="{{ article.url }}">{{ article.headline }}</a>&nbsp;<span class="dateline aside">{{ article.created|date('M d') }}</span></li>
			{% endfor %}
		</ul>
	</div>

	<div class="grid_3">
		<h2 class="mmb">Sports</h2>
		<hr class="mmb" />
		{% fetch sports from article with [
		'limit': 6,
		'order': 'weight desc, created desc',
		'where': 'status = 1',
		'withTags': ['sports']
		]
		%}
		<ul class="links mb">
			{% for article in sports %}
			<li><a href="{{ article.url }}">{{ article.headline }}</a>&nbsp;<span class="dateline aside">{{ article.created|date('M d') }}</span></li>
			{% endfor %}
		</ul>
	</div>

	<div class="grid_3">
		<h2 class="mmb">A&amp;E</h2>
		<hr class="mmb" />
		{% fetch ae from article with [
		'limit': 6,
		'order': 'weight desc, created desc',
		'where': 'status = 1'
		]
		%}
		<ul class="links mb">
			{% for article in ae %}
			<li><a href="{{ article.url }}">{{ article.headline }}</a>&nbsp;<span class="dateline aside">{{ article.created|date('M d') }}</span></li>
			{% endfor %}
		</ul>
	</div>

	<div class="grid_3">
		<h2 class="mmb">Laker Life</h2>
		<hr class="mmb" />
		{% fetch laker_life from article with [
		'limit': 6,
		'order': 'weight desc, created desc',
		'where': 'status = 1'
		]
		%}
		<ul class="links mb">
			{% for article in laker_life %}
			<li><a href="{{ article.url }}">{{ article.headline }}</a>&nbsp;<span class="dateline aside">{{ article.created|date('M d') }}</span></li>
			{% endfor %}
		</ul>
	</div>

<hr class="grid_12 thick mb" />

<div class="grid_4">
			
	<div class="mod mb">
		{% include 'gryphon/main/popular.tpl' %}
	</div>	
	
	<div class="mod-head">
		<h4>PDF Archives</h4>
	</div>
	<div class="mod mb">
		<div class="inner">
		</div>	
	</div>
	
	<div class="clear"></div>
</div>
	
<div class="grid_4">
	<div class="mod-head">
		<h4>Editorial</h4>
	</div>
	<div class="mod mb">
		<div class="inner">
		
			{% fetch editorials from article with [
			'limit': 1,
			'order': 'weight desc, created desc',
			'where': 'status = 1',
			'withTags': ['cartoon']
			]
			%}
			<ul class="links mb">
				{% for article in editorials %}
				<li><a href="{{ article.url }}">{{ article.headline }}</a>&nbsp;<span class="dateline aside">{{ article.created|date('M d') }}</span></li>
				{% endfor %}

			<hr class="mmb" />
			{% fetch editorials from article with [
			'limit': 6,
			'order': 'weight desc, created desc',
			'where': 'status = 1',
			'withTags': ['letters','column']
			]
			%}
			<ul class="links mb">
				{% for article in editorials %}
				<li><a href="{{ article.url }}">{{ article.headline }}</a>&nbsp;<span class="dateline aside">{{ article.created|date('M d') }}</span></li>
				{% endfor %}
			</ul>
		</div>
	</div>	
		
	<div class="mod-head">
		<h4>Valley Vote</h4>
	</div>
	<div class="mod mb">
		<div class="inner">
	
			<h5>Online poll: 4/21/2011</h5>
			
		</div>
	</div>
		
	<div class="grid_2 alpha">
		<div class="mod-head">
			<h4>Social Media</h4>
		</div>
		<div class="mod mb">
			<div class="inner">
				<ul class="links">
								<li>
				<img src="{{ 'style/assets/twitter.png'|url }}" style="position:relative;top:2px;" alt="icn" />&nbsp;&nbsp;<a href="" class="head4">Twitter</a></li>
			</li>
								
					<li><img src="{{ 'style/assets/twitter.png'|url }}" style="position:relative;top:2px;" alt="icn" />&nbsp;&nbsp;<a href="" class="head4">Twitter (Sports)</a></li>
		
					
					<li><img src="{{ 'style/assets/twitter.png'|url }}" style="position:relative;top:2px;" alt="icn" />&nbsp;&nbsp;<a href="" class="head4">Twitter (A&amp;E)</a></li>
					
								<li><img src="{{ 'style/assets/facebook.png'|url }}" style="position:relative;top:2px;" alt="icn" />&nbsp;&nbsp;<a href="" class="head4">Facebook</a></li>
								
					<li><img src="{{ 'style/assets/youtube.png'|url }}" style="position:relative;top:2px;left:-1px;" alt="icn" />&nbsp;&nbsp;<a href="" class="head4" style="margin-left:-1px;">YouTube</a></li>
					
								<li><img src="{{ 'style/assets/icons/email_14.gif'|url }}" style="position:relative;top:2px;" alt="icn" />&nbsp;&nbsp;<a href="" target="_blank" class="head4">Email Edition</a></li>
								
					<li><img src="{{ 'style/assets/29.png'|url }}" style="position:relative;top:1px;margin-right:2px;" alt="icn" />&nbsp;&nbsp;<a href="{{ '' }}" class="head4">RSS Feeds</a></li>
				</ul>
		
			</div>
		</div>	
	</div>
	<div class="grid_2 omega">
		<div class="mod-head">
			<h4>Puzzle Solutions</h4>
		</div>
		<div class="mod mb">
			<div class="inner">
				<ul class="links">
		
				</ul>
			</div>
		</div>
</div>

	<div class="clear">&nbsp;</div>
	
	<div class="mb">
	<!-- Begin Monster Career Ad Network Creative for TRAK_JSW_grandval_co -->
	<!-- End Monster Career Ad Network Creative for TRAK_JSW_grandval_co -->
</div>	
		
</div>

<div class="grid_4">
	<div class="mod-head">
		<h4>Briefs</h4>
	</div>
	<div class="mod mb">
		<div class="inner">
			{% fetch briefs from article with [
			'limit': 6,
			'order': 'weight desc, created desc',
			'where': 'status = 1',
			]
			%}
			<ul class="links mb">
				{% for article in briefs %}
				<li><a href="{{ article.url }}">{{ article.headline }}</a>&nbsp;<span class="dateline aside">{{ article.created|date('M d') }}</span></li>
				{% endfor %}
			</ul>
	
		</div>
	</div>
	
	<div class="mod-head">
		<h4>Classifieds</h4>
	</div>
	<div class="mod mb">
		<div class="inner">
					
			<h5>In <a href="/index.php/classified/housing__roommates">Housing / Roommates</a></h5>
			<hr />
			<ul class="links mb">
				<li>
				<a href="/index.php/classified/housing__roommates#ad-273">Looking for 1 or 2 people to take over our 12 month lease starting in August. Its a 2&nbsp;&#133;</a>
				</li>
			</ul>
					
			<h5>In <a href="/index.php/classified/services">Services</a></h5>
			<hr />
			<ul class="links mb">
				<li>
					<a href="/index.php/classified/services#ad-272">Wanted: hard working individual to strip wall paper and paint in a dining room.  Job&nbsp;&#133;</a>
				</li>
			</ul>
					
			<h5>In <a href="/index.php/classified/housing__roommates">Housing / Roommates</a></h5>
			<hr />
			<ul class="links mb">
				<li>
					<a href="/index.php/classified/housing__roommates#ad-271">Looking to sublease 2 bedrooms at Copper Beech in a 4 bedroom apartment (guys).  Own&nbsp;&#133;</a>
				</li>
			</ul>
					
			<div class="aside2" style="text-align:right"><a href="/index.php/classified/">SEE MORE CLASSIFIEDS &raquo;</a></div>
		</div>
	</div>	
	<!-- calendar widget -->

	<div class="mod-head">
		<h4>Upcoming Events</h4>
	</div>

	<div id="events-mod" class="tabheader">
		<ul id="event-dates">
			<li><span>Wed</span><a href="#d-27">27</a></li>
			
			<li><span>Thu</span><a href="#d-28">28</a></li>
			
			<li><span>Fri</span><a href="#d-29">29</a></li>
			
			<li><span>Sat</span><a href="#d-30">30</a></li>
			
			<li><span>Sun</span><a href="#d-01">01</a></li>
		</ul>
		<div class="clear">&nbsp;</div>
	</div>

	<div class="mod mb">
		<div class="inner">
	
			<div id="d-27" class="eventtab">
				<p><span class="dateline aside">10:00 am | </span><a href="/index.php/calendar/event/1ooouojvuo4t8nrvqba96s78fg?time=1303912800">Overeaters Anonymous (OA) Meeting</a></p>
				<p><span class="dateline aside">11:00 am | </span><a href="/index.php/calendar/event/r3lj0sjp98oe0j44695euhof6c?time=1303916400">CFI Secular Lunch Hour</a></p>
				<p><span class="dateline aside">12:00 pm | </span><a href="/index.php/calendar/event/gsgntd10ke7n5jlljfr1uuvgfs?time=1303920000">12-Step Meeting</a></p>
				<p><span class="dateline aside">3:00 pm | </span><a href="/index.php/calendar/event/vbnp9hqgve3u38i9ora8ctdt8s?time=1303930800">12-Step Meeting</a></p>
				<p><span class="dateline aside">6:00 pm | </span><a href="/index.php/calendar/event/m5pm3e5k6747p0g98bflcclmh4?time=1303941600">12-Step Meeting</a></p>
			</div>
			
			<div id="d-28" class="eventtab">
				<p><span class="dateline aside">11:00 am | </span><a href="/index.php/calendar/event/r3lj0sjp98oe0j44695euhof6c?time=1304002800">CFI Secular Lunch Hour</a></p>
				<p><span class="dateline aside">3:00 pm | </span><a href="/index.php/calendar/event/vbnp9hqgve3u38i9ora8ctdt8s?time=1304017200">12-Step Meeting</a></p>
				<p><span class="dateline aside">6:00 pm 	| </span><a href="/index.php/calendar/event/m5pm3e5k6747p0g98bflcclmh4?time=1304028000">12-Step Meeting</a></p>
			</div>
	
			
			<div id="d-29" class="eventtab">
				<p><span class="dateline aside">3:00 pm | </span><a href="/index.php/calendar/event/vbnp9hqgve3u38i9ora8ctdt8s?time=1304103600">12-Step Meeting</a></p>
				<p><span class="dateline aside">6:00 pm | </span><a href="/index.php/calendar/event/m5pm3e5k6747p0g98bflcclmh4?time=1304114400">12-Step Meeting</a></p>
			</div>
			
			<div id="d-30" class="eventtab">
				<p>No events for this date</p>		
			</div>
			
			<div id="d-01" class="eventtab">
				<p><span class="dateline aside">All day | </span><a href="/index.php/calendar/event/raift0u3siuocpvqc16bp0fgkc?time=1304222400">Alpha Sigma Phi Bike Trip</a></p>
			</div>
			
			<div class="aside2" style="text-align:right"><a href="/index.php/calendar/" class="head4">FULL CALENDAR &raquo;</a></div>
	

	
		</div>
	</div>	
</div>

<div class="clear">&nbsp;</div>




{% endblock content %}
