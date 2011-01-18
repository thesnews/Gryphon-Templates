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

	<meta name="title" content="The State News{{ title|default(" :: Michigan State University's Independent Voice") }}" />
	<meta name="description" content="{{ description|default("Michigan State University's Independent Voice") }}" />

	<script type="text/javascript" src="{{ 'javascript/vendor/mootools/mootools-1.2.4-compressed.js'|url }}"></script>


		<script type="text/javascript" src="{{ 'style_chroma/js/jquery/effects.js'|url }}"></script>
		<script type="text/javascript" src="{{ 'style_chroma/js/jquery/jquery-1.3.2.min.js'|url }}"></script>
		<script type="text/javascript" src="{{ 'style_chroma/js/jquery/jquery-ui-1.7.2.min.js'|url }}"></script>



	{% if noIndex %}
		<meta name="robots" content="noindex, nofollow" />
	{% endif %}

	<title>Detroit Softworks{{ title|default(" :: Michigan State University's Independent Voice") }}</title>

	{% if config.get('debug') %}
		<script type="text/javascript" src="{{ 'javascript/vendor/offspring.js'|url }}"></script>
		<script type="text/javascript" src="{{ 'javascript/vendor/rosewood.js'|url }}"></script>
		<script type="text/javascript" src="{{ 'javascript/base.js'|url }}"></script>
		<script type="text/javascript" src="{{ 'javascript/expandable.js'|url }}"></script>
		<script src="{{ 'javascript/vendor/video-js/video.js'|url }}" type="text/javascript" charset="utf-8"></script>
	{% else %}
		<script src="{{ 'javascript/snews.compressed.js'|url }}" type="text/javascript"></script>
	{% endif %}

	{% block styles %}{% endblock %}
	{% block scripts %}{% endblock %}
	{% block links %}{% endblock %}

	<link rel="icon" type="image/png" href="{{ 'style_chroma/images/favico.png'|url }}" />
	
	
	<link rel="stylesheet" type="text/css" media="screen, projection" href="{{ 'style_chroma/screen/master.css?021610'|url }}" />
	<link rel="stylesheet" type="text/css" media="print" href="{{ 'style_chroma/print/master.css'|url }}" />
	<!--[if IE 6]>
		<link rel="stylesheet" type="text/css" media="screen, projection" href="{{ 'style_chroma/screen/ie6.css'|url }}" />
	<![endif]-->
	<link rel="stylesheet" href="{{ 'javascript/vendor/video-js/video-js.css'|url }}" type="text/css" media="screen" title="Video JS" charset="utf-8">
	<script type="text/javascript" charset="utf-8">
		VideoJS.setupAllWhenReady({
			linksHiding: true,
			controlsHiding: true
		});
	</script>


	<link rel="alternate" type="application/rss+xml" title="Top Stories" href="http://feeds.feedburner.com/statenews/top" />


	<script type="text/javascript">
	
	  var _gaq = _gaq || [];
	  _gaq.push(['_setAccount', 'UA-1362565-1']);
	  _gaq.push(['_trackPageview']);
	
	  (function() {
		var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(ga);
	  })();
	
	</script>
	
	<link rel="stylesheet" type="text/css" media="screen, projection" href="{{ 'style_chroma/screen/calendar.css'|url }}" />
	
</head>
<body>

	<div id="wrapper"> <!-- CENTERS EVERYTHING -->
		
		
		<div id="border"> <!-- PUTS 1px GRAY BORDER WITH 1px PADDING AROUND NAV, CONTENT, FOOTER.  -->
				
			<div class="container_12">
			<div class="grid_12 dark" id="ticker">
				<div>
					<span id="date">{{ now|date('l, F j, Y') }}</span> 
					<span id="founded">Detroit, MI | Since 2009</span>
					<span id="wx">{{ weather }}, {{ weather.temp }}&deg; F | {{ weather.tempC }}&deg; C</span>
					<span id="links"><a href="#">Contact Us</a> | <a href="#">Advertise</a> | <a href="#">Classifieds</a> | <a href="#">Feeds</a></span>
				</div>
				<form method="get" action="#" id="search">
					<input id="search_button" type="image" name="submit" src="{{ 'style_chroma/images/search_icon.png'|url }}" width="13" height="13" alt="search">			
					<input id="search_field" type="text" name="search" value="Search Detroit Softworks" />
				</form>
			</div>
			<div class="grid_12 leaderboard">
				<img src="{{ 'style_chroma/images/ads/leaderboard.png'|url}} " alt="advertisement" />
			</div>
			<div class="grid_12" id="header">
				<a href="#"><img src="{{ 'style_chroma/images/client/logo_header.png'|url }}" /></a>
				<ul>
					<li><a href="{{ 'main'|url }}">Front Page</a></li>
					<li><a href="{{ 'section/news'|url }}">News</a></li>
					<li><a href="{{ 'section/sports'|url }}">Sports</a></li>
					<li><a href="{{ 'section/opinion'|url }}">Opinion</a></li>
					<li><a href="{{ 'section/features'|url }}">Features</a></li>
					<li><a href="{{ 'multimedia'|url }}">Multimedia</a></li>
				</ul>
			</div>

			<div class="container_12" id="main-content"> <!-- 960.GS STARTS HERE. DONT FORGET TO USE "CLEAR" DIVs AFTER EACH ROW! -->
				{% if not suppressLeaderBoard %}
					<div class="grid_12">
						{% include 'gryphon/ads/leaderboard.tpl' %}
					</div>
					<hr />
				{% endif %}



				{# THIS IS THE MAIN CONTENT BLOCK #}
				
				{% block content %}{% endblock %}


			</div>

				<div class="clear"></div> <!-- LEAVE THIS CLEAR DIV!! OTHERWISE, THE CONTAINER WILL COLLAPSE! -->


			</div>
		
			<div class="container_12" id="footer">
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
						
						<div class="clear"></div>
			</div>
		
		</div>
	</div>

</body>
</html