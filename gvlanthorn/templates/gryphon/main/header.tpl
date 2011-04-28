<?php
Foundry::import('global:functions');

$scripts = Foundry_Registry::get( 'gfn:include.scripts' );
$styles = Foundry_Registry::get( 'gfn:include.styles' );
$namespaces = Foundry_Registry::get( 'gfn:include.xmlNamespaces' );
?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="generator" content="Gryphon <?php echo __VERSION ?>" />

	<title><?php
		echo Foundry_Registry::get('gfn:publication.name');
		if( $data['title'] ) :
			echo ' :: '. $data['title'];
		endif;
	?></title>
	
	<link rel="stylesheet" type="text/css" href="<?php echo Foundry::path( 'gfn-lanthorn/css/master.css' ) ?>" media="all" />
	<link rel="stylesheet" type="text/css" href="<?php echo Foundry::path( 'gfn-lanthorn/css/thickbox.css' ) ?>" media="screen" />
	
	<!--[if IE]>
		<link rel="stylesheet" type="text/css" media="screen, projection" href="<?php echo Foundry::path( 'gfn-lanthorn/css/ie.css' ) ?>" />
	<![endif]-->

	<?php if( $styles ) : foreach( $styles as $style ) : ?>
		<link rel="stylesheet" type="text/css" href="<?php echo $style ?>" media="all" />
	<?php endforeach; endif ?>
	
	<link rel="shortcut icon" href="<?php echo Foundry::path( 'favicon.ico' ) ?>" />
	
	<link rel="alternate" type="application/rss+xml" title="<?php echo Foundry_Registry::get('gfn:publication.name') ?> : Top Stories" href="<?php echo Foundry::link( 'section/pageOne.xml' ) ?>" />
	
	<?php if( $data['feedlink'] ) :
	$feed = $data['feedlink']; ?>
		<link rel="alternate" type="application/rss+xml" title="<?php echo $feed['title'] ?>" href="<?php echo $feed['link'] ?>" />
	<?php endif; ?>
	
	<script type="text/javascript" src="<?php echo Foundry::path( 'gfn-lanthorn/js/jquery.js' ) ?>"></script>
	<script type="text/javascript" src="<?php echo Foundry::path( 'gfn-lanthorn/js/jquery-ui.js' ) ?>"></script>
	<script type="text/javascript" src="<?php echo Foundry::path( 'gfn-lanthorn/js/thickbox-compressed.js' ) ?>"></script>
	
	<?php if( $scripts ) : foreach( $scripts as $script ) : ?>
		<script src="<?php echo $script ?>" type="text/javascript"></script>
	<?php endforeach; endif ?>
	
	<script type="text/javascript" src="<?php echo Foundry::path( 'gfn-lanthorn/js/functions.js' ) ?>"></script>
	
	
	<?php
	if( $data['activeTab'] ) :
		$tab = $data['activeTab'];
	else :
		$tab = 0;
	endif;
	?>
	
</head>
<body>

<div id="header">
	<div id="subnav">
		<p class="right">
			<?php echo date('F j, Y') ?> | <?php echo WeatherBugPlugin::metar()->temperature_f ?>&deg;F &nbsp;<img src="<?php echo WeatherBugPlugin::icon(); ?>" class="" height="16" style="position:relative; top:4px;" alt="" /> <a href="<?php echo WeatherBugPlugin::forecastLink(); ?>" target="_new">7-Day Forecast</a>
		</p>
		<p>
			<a href="<?php echo Foundry::link('/') ?>">HOME</a> | <a href="<?php echo Foundry::link( 'search' ). '?a=1' ?>">ARCHIVES</a> | <a href="<?php echo Foundry::link('page/advertising') ?>">ADVERTISING</a> | <a href="<?php echo Foundry::link('page/contact') ?>">CONTACT US</a> | <a href="<?php echo Foundry::link('page/about_us') ?>">ABOUT US</a> | <a href="<?php echo Foundry::link('calendar') ?>">EVENT CALENDAR</a> | <a href="<?php echo Foundry::link('page/feeds') ?>">RSS</a>
		</p>
	</div>
	
	<div class="mb">
		<?php Foundry::import( 'global:ads/header_banner_468x60' ); ?>

		<h1 id="flag"><a href="<?php echo Foundry::link('/') ?>"><img src="<?php echo Foundry::path( 'gfn-lanthorn/assets/flag2.png' ) ?>" alt="<?php echo Foundry_Registry::get('gfn:publication.name') ?>" /></a></h1>
		<div id="tagline">Allendale and Grand Rapids, Mich. | www.Lanthorn.com</div>
	</div>
	
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
</div><!-- #header -->

<div id="main" class="container_12">