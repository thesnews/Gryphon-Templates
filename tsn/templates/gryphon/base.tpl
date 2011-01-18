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

	{% if noIndex %}
		<meta name="robots" content="noindex, nofollow" />
	{% endif %}

	<title>The State News{{ title|default(" :: Michigan State University's Independent Voice") }}</title>

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

	<link rel="icon" type="image/png" href="{{ 'style/gryphon/images/favico.png'|url }}" />
	<link rel="stylesheet" type="text/css" media="screen, projection" href="{{ 'style/gryphon/screen/master.css'|url }}" />
	<link rel="stylesheet" type="text/css" media="print" href="{{ 'style/gryphon/print/master.css'|url }}" />
	<!--[if IE 6]>
		<link rel="stylesheet" type="text/css" media="screen, projection" href="{{ 'style/screen/ie6.css'|url }}" />
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
</head>
<body>

	<div id="print-info">
		<h3>The State News</h3>
		URL: {{ '/'|qualifiedUrl }}<br />
		Current Date: {{ now|date('r') }}
	</div>

	<div id="wrapper"> <!-- CENTERS EVERYTHING -->
		<div id="ticker">
			<span id="date">{{ now|date('<b>l</b> F j, Y') }} | Since 1909 | East Lansing, MI</span>
			<span id="links"><a href="http://advertise.statenews.com">Advertise</a> | <a href="{{ 'classifieds'|url }}">Classifieds</a> | <a href="{{ 'page/puzzles'|url }}">Puzzles</a> | <a href="{{ 'page/work'|url }}">Employment</a> | <a href="{{ 'page/contact'|url }}">Contact Us</a></span>
		</div>
	
		<div id="logo_wrapper">
			<a id="logo" href="http://statenews.com"></a>
		</div>
	
		<div id="etc">
		
			<div id="rss">
				<span class="label">Feed:</span>
				<a id="rss_icon" href="{{ 'page/feeds'|url }}"></a>
			</div>
			
			<div id="follow">
				<span class="label">Follow us on:</span>
				<a id="twitter_icon" href="http://twitter.com/thesnews"></a>
				<a id="facebook_icon" href="http://www.facebook.com/pages/The-State-News/62758758853"></a>
			</div>
			
			<div id="wx">
				<a href="#"></a>
				<b>{{ weather }}</b>, {{ weather.temp }}&deg; F | {{ weather.tempC }}&deg; C<br />
				<a href="{{ weather.url }}">7 day forecast</a>
			</div>
		
		</div>
		
		<div id="border"> <!-- PUTS 1px GRAY BORDER WITH 1px PADDING AROUND NAV, CONTENT, FOOTER.  -->
				
			<div id="nav">
				<form method="get" action="{{ 'search'|url }}" class="search-form">
				<input class="search_button" type="image" name="submit" src="{{ 'style/gryphon/images/search_button.png'|url }}" width="24" height="24" alt="search">			
				
				<input class="search replace-text" type="text" name="q" value="Search the State News" />
				</form>
				
				{% include "gryphon/navigation.tpl" %}

				<span id="search_options"><a href="{{ 'search/?a=1'|url }}">Advanced Search</a><a href="{{ 'page/archives'|url }}">Archives</a></span>
				
				
		
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
				
				<hr />
				
				<div class="grid_12">
					<div class="advertisement leaderboard">
						<script type="text/javascript"><!--
						google_ad_client = "pub-3894131125488372";
						/* SN Leaderboard Bottom */
						google_ad_slot = "2177491549";
						google_ad_width = 728;
						google_ad_height = 90;
						//-->
						</script>
						<script type="text/javascript"
						src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
						</script>
					</div>
				</div>

				<div class="clear"></div> <!-- LEAVE THIS CLEAR DIV!! OTHERWISE, THE CONTAINER WILL COLLAPSE! -->


			</div>
		
			<div class="container_12" id="footer">
				<div class="grid_2">
							<ul>
								<li class="title"><a href="{{ 'section/news'|url }}">News</a></li>
								<li><a href="{{ 'section/campus'|url }}">Campus</a></li>
								<li><a href="{{ 'section/city'|url }}">City</a></li>
								<li><a href="{{ 'section/briefs'|url }}">Police Briefs</a></li>
								<li><a href="{{ 'crime'|url }}">Crime Map</a></li>
							</ul>
							<ul>
								<li class="title"><a href="{{ 'section/opinion'|url }}">Opinion</a></li>
								<li><a href="{{ 'section/editorials'|url }}">Editorials</a></li>
								<li><a href="{{ 'section/columns'|url }}">Columns</a></li>
								<li><a href="{{ 'section/letters'|url }}">Letters</a></li>
							</ul>
							<ul>
								<li class="title"><a href="{{ 'section/features'|url }}">Features</a></li>
								<li><a href="{{ 'tsn:dining'|url }}">Dining Guide</a></li>
								<li><a href="{{ 'google:calendar'|url }}">Calendar</a></li>
							</ul>
						</div>
						
						<div class="grid_2">
							<ul>
								<li class="title"><a href="{{ 'section/sports'|url }}">Sports</a></li>
								<li><a href="{{ 'section/baseball'|url }}">Baseball</a></li>
								<li><a href="{{ 'section/basketball'|url }}">Basketball</a></li>
								<li><a href="{{ 'section/crosscountry'|url }}">Cross Country</a></li>
								<li><a href="{{ 'section/football'|url }}">Football</a></li>
								<li><a href="{{ 'section/golf'|url }}">Golf</a></li>
								<li><a href="{{ 'section/gymnastics'|url }}">Gymnastics</a></li>
								<li><a href="{{ 'section/fieldhockey'|url }}">Field Hockey</a></li>
								<li><a href="{{ 'section/hockey'|url }}">Ice Hockey</a></li>
								<li><a href="{{ 'section/rowing'|url }}">Rowing</a></li>
								<li><a href="{{ 'section/soccer'|url }}">Soccer</a></li>
								<li><a href="{{ 'section/softball'|url }}">Softball</a></li>
								<li><a href="{{ 'section/swimmingdiving'|url }}">Swimming & Diving</a></li>
								<li><a href="{{ 'section/trackfield'|url }}">Track & Field</a></li>
								<li><a href="{{ 'section/volleyball'|url }}">Volleyball</a></li>
								<li><a href="{{ 'section/wrestling'|url }}">Wrestling</a></li>
							</ul>
						</div>
						
						<div class="grid_2">
							<ul class="title_links">
								<li><a href="{{ 'blog'|url }}">Blogs</a></li>
								<li><a href="{{ 'smartPub'|url }}">Classifieds</a></li>
								<li><a href="{{ 'page/religious'|url }}">Religious Guide</a></li>
								<li><a href="{{ 'page/puzzles'|url }}">Puzzles</a></li>
								<li><a href="{{ 'page/mobile'|url }}">Mobile Edition</a></li>
								<li><a href="{{ 'roost'|url }}">Housing Guide</a></li>
							</ul>
							<ul>
								<li class="title"><a href="{{ 'multimedia'|url }}">Multimedia</a></li>
								<li><a href="{{ 'multimedia/living_city'|url }}">Living City</a></li>
								<li><a href="{{ 'multimedia/flashVideo'|url }}">Video</a></li>
								<li><a href="{{ 'gallery'|url }}">Photo Galleries</a></li>
								<li><a href="{{ 'multimedia'|url }}">Podcasts</a></li>
							</ul>
						</div>
						
						<div class="grid_2">
							<ul class="title_links">
								<li><a href="{{ 'page/archives'|url }}">Archives</a></li>
								<li><a href="{{ 'search'|url }}">Search</a></li>
								<li><a id="feeds" href="{{ 'page/feeds'|url }}">Feeds</a></li>
								<li><a href="http://reprints.statenews.com">Photo Reprints</a></li>
								<li><a href="http://advertise.statenews.com">Advertise With Us</a></li>
								<li><a href="http://snaa.statenews.com">SN Alumni</a></li>
								<li><a href="{{ 'page/work'|url }}">Work Here</a></li>
								<li><a href="{{ 'page/contact'|url }}">Contact Us</a></li>
								<li><a href="{{ 'page/privacy'|url }}">Privacy Policy</a></li>
							</ul>
							<ul>
								<li class="title">Follow Us:</li>
								<li><a id="facebook" href="http://www.facebook.com/pages/The-State-News/62758758853">Facebook</a></li>
								<li><a id="twitter" href="http://twitter.com/thesnews">Twitter</a></li>
							</ul>
						</div>
						
						<div class="grid_2">

								{% fetch pdf from media with [
									'where': 'status = 1',
									'limit': 1,
									'order': 'uid desc',
									'withTags': ['frontpage', 'pdf']
								] %}
							
								<ul>
								<li><a href="{{ pdf[0].urlOriginal }}"><img id="paper" src="{{ pdf[0].urlThumbnail }}" alt="frontpage" /></a></li>
								<li><a href="{{ 'page/pdf'|url }}">More Page Fronts</a></li>
								<li><a href="http://reprints.statenews.com">Reprints</a></li>
							</ul>
						</div>
						
						<div class="grid_2">
							<p><b>The State News</b> is published by the students of <a href="http://www.msu.edu">Michigan State University</a>. <b>State News, Inc.</b> is a nonprofit corporation. Its current 990 tax form is available for review upon request at <i>435 E. Grand River Avenue</i> during business hours.</p>

							<a id="gryphon_logo_footer" title="Gryphon CMS" href="http://detroitsoftworks.com/index.php/page/gryphon"></a>
							<a id="dsw_logo_footer" title="Detroit Softworks" href="http://detroitsoftworks.com/"></a>

						</div>
						
						<div id="copyright" class="small">
							All Content &copy; Copyright 2011, The State News<!-- | Valid <a href="http://validator.w3.org/check/referer">HTML</a> & <a href="http://jigsaw.w3.org/css-validator/validator?uri=#">CSS</a>--><br />
							Proudly powered by <a href="http://detroitsoftworks.com">Detroit Softworks</a><br />

							<hr class="spacer" />

							<a href="http://www.w3.org/html/logo/">
							<img src="http://www.w3.org/html/logo/badge/html5-badge-h-connectivity-css3-multimedia-semantics.png" width="100" height="28" alt="HTML5 Powered with Connectivity / Realtime, CSS3 / Styling, Multimedia, and Semantics" title="HTML5 Powered with Connectivity / Realtime, CSS3 / Styling, Multimedia, and Semantics">
							</a>

							<a id="sn_logo_footer" href="http://statenews.com"></a>
							
						</div>
						
						<div class="clear"></div>
			</div>
		
		</div>
	</div>

</body>
</html>