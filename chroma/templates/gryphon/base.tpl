{% import "macros/render.tpl" as render %}
{% helper config %}
{% helper weather %}

{% set title %}{% block title %}{% endblock %}{% endset %}

{% if not active %}
	{% set active %}{% block active %}{% endblock %}{% endset %}
{% endif %}

{% set subActive %}{% block subActive %}{% endblock %}{% endset %}

{% set description %}{% block description %}{% endblock %}{% endset %}

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<meta name="generator" content="Gryphon {{ config.appVersion }} (Foundry {{ config.foundryVersion }})" />

	<meta name="title" content="Detroit Softworks{{ title|default(" :: Detroit Softworks") }}" />
	<meta name="description" content="{{ description|default("Detroit Softworks") }}" />

	{% if noIndex %}
		<meta name="robots" content="noindex, nofollow" />
	{% endif %}

	<title>Detroit Softworks{{ title|default(" :: Detroit Softworks") }}</title>


		<script type="text/javascript" src="{{ 'style_chroma/js/mootools-1.2-min.js'|url }}"></script>
		<script type="text/javascript" src="{{ 'style_chroma/js/rosewood.js'|url }}"></script>
		<script type="text/javascript" src="{{ 'style_chroma/js/main.js'|url }}"></script>
				
		<script src="/javascript/snews.compressed.js" type="text/javascript"></script>


	{% block styles %}{% endblock %}
	{% block scripts %}{% endblock %}
	{% block links %}{% endblock %}

	<link rel="icon" type="image/ico" href="{{ 'style_chroma/images/client/favicon.ico'|url }}" />

	<link rel="stylesheet" type="text/css" media="screen, projection" href="{{ 'style_chroma/screen/master.css'|url }}" />
	
	<link rel="stylesheet" type="text/css" media="print" href="{{ 'style_chroma/print/master.css'|url }}" />
	<!--[if IE 6]>
		<link rel="stylesheet" type="text/css" media="screen, projection" href="{{ 'style_chroma/screen/ie6.css'|url }}" />
	<![endif]-->



	<link rel="alternate" type="application/rss+xml" title="Top Stories" href="http://feeds.feedburner.com/statenews/top" />

	<link rel="stylesheet" type="text/css" media="screen, projection" href="{{ 'style_chroma/screen/calendar.css'|url }}" />
	
</head>
<body>

<div id="wrapper"> <!-- CENTERS EVERYTHING -->
		
	<div class="container_12"> <!-- CENTERS EVERYTHING -->
		
		<div class="grid_12 dark" id="ticker">
			<div>
			<span id="date">{{ now|date('l F j, Y') }}</span> 
			<span id="founded">Detroit, MI | Since 2009  </span>
			<span id="wx">{{ weather }}, {{ weather.temp }}&deg; F | {{ weather.tempC }}&deg; C</span>
			<span id="links"><a href="{{ 'page/contact'|url }}">Contact Us</a> | <a href="#">Advertise</a> | <a href="{{ 'classifieds'|url }}">Classifieds</a> | <a href="{{ 'page/feeds'|url }}">Feeds</a></span>
			</div>	
	<form id="search" method="get" action="{{ 'gryphon:search'|url }}" class="search-form search2">
			<input id="search_field" class="search replace-text" type="text" name="q" value="Search" />
			<input class="search_button" type="image" name="submit" style="float: right;" src="{{ 'style_chroma/images/search_icon.png'|url }}" width="13" height="13" alt="search">
	</form>
		
		</div>
			<div class="grid_12 leaderboard">
				<img src="{{ 'style_chroma/images/ads/leaderboard.png'|url }}" alt="advertisement" />
			</div>

		<div id="header" class="grid_12">
			<a href="#"><img src="{{ 'style_chroma/images/client/logo_header.png'|url }}" style="width:350px;" /></a>{% include "gryphon/navigation.tpl" %}
		</div>
		

		<div class="container_12" id="main-content"> <!-- 960.GS STARTS HERE. DONT FORGET TO USE "CLEAR" DIVs AFTER EACH ROW! -->
				

				{# THIS IS THE MAIN CONTENT BLOCK #}
					{% block content %}{% endblock %}
					
					
		</div>

		<div class="grid_12" id="footer">
							
						<div class="grid_2 alpha">
							<ul>
								<li><a href="{{ 'section/news'|url }}">News</a></li>
							</ul>
							<ul>
								<li><a href="{{ 'section/opinion'|url }}">Opinion</a></li>
								<li><a href="{{ 'section/editorials'|url }}">Editorials</a></li>
								<li><a href="{{ 'section/columns'|url }}">Columns</a></li>	
								<li><a href="{{ 'section/letters'|url }}">Letters</a></li>				
							</ul>
							<ul>
								<li><a href="{{ 'section/features'|url }}">Features</a></li>
							</ul>
							<ul>
								<li><a href="{{ 'blog'|url }}">Blogs</a></li>
							</ul>							
							<ul>
								<li><a href="{{ 'multimedia'|url }}">Multimedia</a></li>
							</ul>						
						</div>
						
						<div class="grid_2">
							<ul>
								<li><a href="{{ 'section/sports'|url }}">Sports</a></li>
								<li><a href="{{ 'section/baseball'|url }}">Baseball</a></li>
								<li><a href="{{ 'section/basketball'|url }}">Basketball</a></li>	
								<li><a href="{{ 'section/crosscountry'|url }}">Cross Country</a></li>
								<li><a href="{{ 'section/football'|url }}">Football</a></li>
								<li><a href="{{ 'section/golf'|url }}">Golf</a></li>
								<li><a href="{{ 'section/gymnastics'|url }}">Gymnastics</a></li>
								<li><a href="{{ 'section/hockey'|url }}">Ice Hockey</a></li>
								<li><a href="{{ 'section/soccer'|url }}">Soccer</a></li>
								<li><a href="{{ 'section/softball'|url }}">Softball</a></li>
								<li><a href="{{ 'section/swimmingdiving'|url }}">Swimming & Diving</a></li>
								<li><a href="{{ 'section/trackfield'|url }}">Track & Field</a></li>
								<li><a href="{{ 'section/volleyball'|url }}">Volleyball</a></li>
							</ul>
						</div>
						
						<div class="grid_2">


							<ul class="title_links">
							<li></li>
								<li><a href="{{ '#'|url }}">Contact Us</a></li>
								<li><a href="{{ 'page/archives'|url }}">Archives</a></li>
								<li><a href="{{ '#'|url }}">Classifieds</a></li>
								<li><a href="{{ '#'|url }}">Feeds</a></li>
								<li><a href="{{ 'search'|url }}">Search</a></li>
								<li><a href="{{ 'page/privacy'|url }}">Privacy Policy</a></li>
							</ul>

						</div>
						

						
						
						<div class="grid_3">
								{% fetch pdf from media with [
									'where': 'status = 1',
									'limit': 1,
									'order': 'uid desc',
									'withTags': ['frontpage', 'pdf']
								] %}
							
								<ul>
								<li><h3>Today's Front Page</h3></li>
								<li>
								<a href="{{ pdf[0].urlOriginal }}">
								<img id="paper" src="{{ pdf[0].urlPreview }}" alt="frontpage" class="front_pdf" />
								</a>
								</li>
							</ul>
						</div>
					
						
						
						<div class="grid_3 omega">
							

							<a id="gryphon_logo_footer" title="Gryphon CMS" href="http://detroitsoftworks.com/index.php/page/gryphon"></a>
							<a id="dsw_logo_footer" title="Detroit Softworks" href="http://detroitsoftworks.com/"></a>

						</div> 
						
						<p><b>Detroit Softworks</b> offers a hosted CMS, web ad management, and reprint sales solution for your publication. With unprecedented control over your site’s design and Web ads, content delivery, and ecommerce-grade security, you can rest easy in the knowledge that <b>It. Just. Works.</b></p>
						
										
						<div class="clear"></div> <!-- LEAVE THIS CLEAR DIV!! OTHERWISE, THE CONTAINER WILL COLLAPSE! -->
						
						<div id="copyright" class="small">
							All Content &copy; Copyright 2010, The State News | Valid <a href="http://validator.w3.org/check/referer">HTML</a> & <a href="http://jigsaw.w3.org/css-validator/validator?uri=#">CSS</a><br />
						
							<a id="powered" href="http://detroitsoftworks.com">Powered by Detroit Softworks</a>
						</div>
						
						<div class="clear"></div>
		
	</div>
</div>




</body>
</html>
