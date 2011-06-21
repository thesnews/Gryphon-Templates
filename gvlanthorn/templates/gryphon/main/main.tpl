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
			<input type="text" name="q" size="30" /> <input type="submit" id="searchsubmit" value="Search" />
		</form>
		
		{% include 'gryphon/main/modules/mm_viewer.tpl' %}

	</div>
		
		<div class="clear">&nbsp;</div>
		
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

	<div class="clear">&nbsp;</div>

<hr class="grid_12 thick mb" />

<div class="grid_4">
	
		{% include 'gryphon/main/modules/popular.tpl' %}
		
		{% include 'gryphon/main/modules/gallery_box.tpl' %}

		{% include 'gryphon/main/modules/archives.tpl' %}

	
	<div class="clear"></div>
</div>
	
<div class="grid_4">
	{% include 'gryphon/main/modules/editorial.tpl' %}
		
	<div class="mod-head">
		<h4>Valley Vote</h4>
	</div>
	<div class="mod mb">
		<div class="inner">
	
			<h5>Online poll: </h5>
			
		</div>
	</div>
		
	<div class="grid_2 alpha">
		{% include 'gryphon/main/modules/social.tpl' %}
	</div>
	<div class="grid_2 omega">
		{% include 'gryphon/main/modules/puzzles.tpl' %}
	</div>

	<div class="clear">&nbsp;</div>
	
	<div class="mb">
</div>	
		
</div>

<div class="grid_4">
	{% include 'gryphon/main/modules/briefs.tpl' %}
	
	{% include 'gryphon/main/modules/classifieds.tpl' %}

	
	<!-- calendar widget -->
	{% include 'google/calendar/featured.tpl' %}
	
</div>

<div class="clear">&nbsp;</div>




{% endblock content %}
