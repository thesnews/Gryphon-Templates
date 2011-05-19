		

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
			<a href="{{ 'classifieds'|url }}">HOME</a> | <a href="<?php echo Foundry::link( 'search' ). '?a=1' ?>">ARCHIVES</a> | <a href="{{ 'page/advertising'|url }}">ADVERTISING</a> | <a href="{{ 'contact'|url }}">CONTACT US</a> |  <a href="{{ 'page/about_us'|url }}">ABOUT US</a> | <a href="{{ 'calendar'|url }}">EVENT CALENDAR</a> | <a href="{{ 'page/feeds'|url }}">RSS</a>
		</p>
	</div>
	
	<div class="mb">
		<?php Foundry::import( 'global:ads/header_banner_468x60' ); ?>
		<img src="{{ 'style/images/logo_header.png'|url }}" alt="logo_header" />
		<div id="tagline">Allendale and Grand Rapids, Mich. | www.Lanthorn.com</div>
	</div>
	
	
	{% include 'gryphon/navigation.tpl' %}

<!-- old nav

	<div style="border-top:1px solid #fff; border-left:1px solid #fff;">
	<table id="nav"><tr>
		<td<?php if($tab === 'home') echo ' class="active"'; ?>><a href="<?php echo Foundry::link('/') ?>">HOME</a></td>
		<td<?php if($tab === 'news') echo ' class="active"'; ?>><a href="<?php echo Foundry::link('section/news') ?>">NEWS</a></td>
		<td<?php if($tab === 'sports') echo ' class="active"'; ?>><a href="<?php echo Foundry::link('section/sports') ?>">SPORTS</a></td>
		<td<?php if($tab === 'ae') echo ' class="active"'; ?>><a href="<?php echo Foundry::link('section/ae') ?>">A&amp;E</a></td>
		<td<?php if($tab === 'laker_life') echo ' class="active"'; ?>><a href="<?php echo Foundry::link('section/laker_life') ?>">LAKER LIFE</a></td>
		<td<?php if($tab === 'editorial') echo ' class="active"'; ?>><a href="<?php echo Foundry::link('section/editorial') ?>">EDITORIAL</a></td>
		<td<?php if($tab === 'briefs') echo ' class="active"'; ?>><a href="<?php echo Foundry::link('section/briefs') ?>">BRIEFS</a></td>
		<td<?php if($tab === 'blogs') echo ' class="active"'; ?>><a href="<?php echo Foundry::link('blog') ?>">BLOGS</a></td>
		<td<?php if($tab === 'multimedia') echo ' class="active"'; ?>><a href="<?php echo Foundry::link('multimedia') ?>">MULTIMEDIA</a></td>
		<td<?php if($tab === 'travel') echo ' class="active"'; ?>><a href="<?php echo Foundry::link('page/travel') ?>">TRAVEL</a></td>
		<td><a href="http://reprints.lanthorn.com">PHOTO STORE</a></td>
		<td<?php if($tab === 'classified') echo ' class="active"'; ?>><a href="<?php echo Foundry::link('classified') ?>">CLASSIFIEDS</a></td>
		<td><a href="http://www.gvsuoffcampushousing.com">HOUSING</a></td>
	</tr></table>
	</div>
	
-->


</div><!-- #header -->