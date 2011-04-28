{% extends "gryphon/base.tpl" %}
{% block title %}:: Feeds{% endblock %}


{% block active %}{% endblock %}
{% block subActive %}{% endblock %}

{% block content %}
	
<div class="grid_12">
	
		<h1>Feeds, Syndication and Widges</h1>

		

			<h2>RSS/Atom Feeds:</h2>
			
			<p>
				RSS and Atom feeds allow you to add Detroit Softworks content to your favorite feed reader, like <a href="http://reader.google.com">Google Reader</a> or add us to your <a href="http://facebook.com">Facebook</a> news feed.
			</p>
</div>
<div class="grid_12" id="feeds">

	<div class="grid_2 alpha">
			<ul>
				<li><h3>News</h3></li>
				<li><a href="<?php echo Foundry::link( 'section/pageOne.xml' ) ?>">Top Stories</a></li>
			</ul>
			
			<ul>
				<li><h3>Opinion</h3></li>
				<li><a href="{{ 'gryphon:section/editorials.xml'|url }}">Editorials</a></li>
				<li><a href="{{ 'gryphon:section/columns.xml'|url }}">Columns</a></li>
				<li><a href="{{ 'gryphon:section/letters.xml'|url }}">Letters</a></li>
			</ul>
			<ul>
				<li><a href="{{ 'gryphon:section/features.xml'|url }}">Features</a></li>
			</ul>

	</div>

	<div class="grid_2">
			<ul>
				<li><h3>Sports</h3></li>
				<li><a href="{{ 'gryphon:section/baseball.xml'|url }}">Baseball</a></li>
				<li><a href="{{ 'gryphon:section/basketball.xml'|url }}">Basketball</a></li>
				<li><a href="{{ 'gryphon:section/crosscountry.xml'|url }}">Cross Country</a></li>
				<li><a href="{{ 'gryphon:section/football.xml'|url }}">Football</a></li>
				<li><a href="{{ 'gryphon:section/golf.xml'|url }}">Golf</a></li>
				<li><a href="{{ 'gryphon:section/gymnastics.xml'|url }}">Gymnastics</a></li>
				<li><a href="{{ 'gryphon:section/fieldhockey.xml'|url }}">Field Hockey</a></li>
				<li><a href="{{ 'gryphon:section/icehockey.xml'|url }}">Ice Hockey</a></li>
				<li><a href="{{ 'gryphon:section/rowing.xml'|url }}">Rowing</a></li>
				<li><a href="{{ 'gryphon:section/soccer.xml'|url }}">Soccer</a></li>
				<li><a href="{{ 'gryphon:section/softball.xml'|url }}">Softball</a></li>
				<li><a href="{{ 'gryphon:section/swimmingdiving.xml'|url }}">Swimming &amp; Diving</a></li>
				<li><a href="{{ 'gryphon:section/trackfield.xml'|url }}">Track &amp; Field</a></li>
				<li><a href="{{ 'gryphon:section/volleyball.xml'|url }}">Volleyball</a></li>
				<li><a href="{{ 'gryphon:section/wrestling.xml'|url }}">Wrestling</a></li>
			</ul>
	</div>	

	<div class="grid_3">
			<ul>
				<li><h3>Blogs:</h3></li>
				{% fetch blogs from blog with [
					'where': 'status = 1',
					'order': 'name asc'
				] %}
				{% for blog in blogs %}
					<li><a href="{{ blog.url }}.xml">{{ blog.name }}</a></li>
				{% endfor %}
			</ul>
	</div>
			
		
		<div class="grid_5 omega">
			<img src="{{ 'style_chroma/images/ads/square.png'|url }}" alt="advertisement" />
		</div>
</div>

{% endblock %}