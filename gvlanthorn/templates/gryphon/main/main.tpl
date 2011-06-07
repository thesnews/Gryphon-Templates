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
		<form method="get" id="searchform" class="mb" action="" >
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
		'where': 'status = 1',
		'withTags': ['artsentertainment']

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
		'where': 'status = 1',
		'withTags': ['lakerlife']

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
			
	
		{% include 'gryphon/main/popular.tpl' %}
	
	<div class="mod-head">
		<h4>PDF Archives</h4>
	</div>
	<div class="mod mb">
		<div class="inner">
		
		
			{% fetch pdf from media with [
				'where': 'status = 1',
				'limit': 1,
				'order': 'uid desc',
				'withTags': ['frontpagepdf']
			] %}
		<div class="mmb" style="text-align:center">
			<a href="{{ pdf[0].urlOriginal }}"><img id="paper" src="{{ pdf[0].urlPreview }}" alt="Frontpage Preview" /></a>
		</div>

		<div class="aside2" style="text-align:right"><a href="http://www.gvlarchives.com/pdfs">VIEW THE LANTHORN ONLINE &raquo;</a></div>

		
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
		
		{% fetch cartoon from media with [
			'limit': 1,
			'order': 'self:weight desc, self:created desc',
			'withTags': ['cartoon']
		] %}

			{% for media in cartoon %}
					<div class="image">
					<a href="{{ media.urlDefault }}"><img src="{{ media.url }}" alt="{{ media.title }}" /></a>
					</div>
					<div class="caption aside mb">Editorial cartoon</div>
			{% endfor %}

			<hr class="mmb" />
		{% fetch editorials from article with [
		'limit': 3,
		'order': 'weight desc, created desc',
		'where': 'status = 1',
		'withTags': ['editorial']
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
	
			<h5>Online poll: </h5>
			
		</div>
	</div>
		
	<div class="grid_2 alpha">
		<div class="mod-head">
			<h4>Social Media</h4>
		</div>
		<div class="mod mb">
			<div class="inner">
				<ul class="links">
				
					{% set urls = config.get('dsw:twitterurl') %}
					{% if urls %}
					<li><img src="{{ 'style/assets/twitter.png'|url }}" style="position:relative;top:2px;" alt="icn" />&nbsp;&nbsp;<a href="{{ 'dsw:twitterurl'|url }}" class="head4">Twitter</a></li>
					{% endif %}
					
					<li><img src="{{ 'style/assets/twitter.png'|url }}" style="position:relative;top:2px;" alt="icn" />&nbsp;&nbsp;<a href="http://www.twitter.com/lanthornsports" class="head4">Twitter (Sports)</a></li>
			
					<li><img src="{{ 'style/assets/twitter.png'|url }}" style="position:relative;top:2px;" alt="icn" />&nbsp;&nbsp;<a href="http://www.twitter.com/gvlarts" class="head4">Twitter (A&amp;E)</a></li>
		
					{% set urls = config.get('dsw:facebookurl') %}
					{% if urls %}
			<li><img src="{{ 'gfn-lanthorn/assets/facebook.png'|url }}" style="position:relative;top:2px;" alt="icn" />&nbsp;&nbsp;<a href="{{ 'dsw:facebookurl'|url }}" class="head4">Facebook</a></li>
					{% endif %}
			
			<li><img src="{{ 'gfn-lanthorn/assets/youtube.png'|url }}" style="position:relative;top:2px;left:-1px;" alt="icn" />&nbsp;&nbsp;<a href="http://www.youtube.com/user/gvsulanthorn" class="head4" style="margin-left:-1px;">YouTube</a></li>
			
					{% set urls = config.get('dsw:emailurl') %}
					{% if urls %}			
			<li><img src="{{ 'gfn-lanthorn/assets/icons/email_14.gif'|url }}" style="position:relative;top:2px;" alt="icn" />&nbsp;&nbsp;<a href="{{ 'dsw:emailurl'|url }}" target="_blank" class="head4">Email Edition</a></li>
					{% endif %}
			
			<li><img src="{{ 'gfn-lanthorn/assets/29.png'|url }}" style="position:relative;top:1px;margin-right:2px;" alt="icn" />&nbsp;&nbsp;<a href="{{ 'page/feeds'|url }}" class="head4">RSS Feeds</a></li>


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
</div>	
		
</div>

<div class="grid_4">
	<div class="mod-head">
		<h4>Briefs</h4>
	</div>
	<div class="mod mb">
		<div class="inner">


<!-- briefs does not work as tag

		{% fetch briefs from article with [
		'limit': 3,
		'order': 'weight desc, created desc',
		'where': 'status = 1'
		]
		%}
			<ul class="links mb">
				{% for article in briefs %}
				<li><a href="{{ article.url }}">{{ article.headline }}</a>&nbsp;<span class="dateline aside">{{ article.created|date('M d') }}</span></li>
				{% endfor %}
			</ul>
	-->
		</div>
	</div>
	
	<div class="mod-head">
		<h4>Classifieds</h4>
	</div>
	<div class="mod mb">
		<div class="inner">
					

					
			<div class="aside2" style="text-align:right"><a href="">SEE MORE CLASSIFIEDS &raquo;</a></div>
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

	{% include 'gryphon/main/calendar.tpl' %}


</div>

<div class="clear">&nbsp;</div>




{% endblock content %}
