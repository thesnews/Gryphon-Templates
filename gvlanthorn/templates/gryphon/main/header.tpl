		

<div id="header">
	<div id="subnav">
		<p class="right">
			{{ now|date('F j, Y') }} | {{ weather.temp }} &deg;F &nbsp;
			<!-- weather image changes based on weather
			<img src="<?php echo WeatherBugPlugin::icon(); ?>" height="16" style="position:relative; top:4px;" />  
			-->
			<a href="{{ weather.url }}">7-Day Forecast</a>
		</p>
		<p>
			<a href="{{ 'index.php'|url }}">HOME</a> | <a href="{{ 'search'|url }}">ARCHIVES</a> | <a href="{{ 'page/advertising'|url }}">ADVERTISING</a> | <a href="{{ 'contact'|url }}">CONTACT US</a> |  <a href="{{ 'page/about_us'|url }}">ABOUT US</a> | <a href="{{ 'calendar'|url }}">EVENT CALENDAR</a> | <a href="{{ 'page/feeds'|url }}">RSS</a>
		</p>
	</div>
	
	<div class="mb">
		<?php Foundry::import( 'global:ads/header_banner_468x60' ); ?>
		<img src="{{ 'style/images/logo_header.png'|url }}" alt="logo_header" />
		<div id="tagline">Allendale and Grand Rapids, Mich. | www.Lanthorn.com</div>
	</div>
	
	
	{% include 'gryphon/navigation.tpl' %}


</div><!-- #header -->