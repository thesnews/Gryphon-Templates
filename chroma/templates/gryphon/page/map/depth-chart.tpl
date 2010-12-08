<?php
	Foundry_Registry::set( 'gfn:include.scripts', array(
		'http://www.google.com/jsapi?key='.
			Foundry_Registry::get( 'gmap:apiKey' ),
		//'http://gmaps-utility-library-dev.googlecode.com/svn/tags/extinfowindow/1.1/src/extinfowindow_packed.js',
	));
	
	Foundry_Registry::set( 'gfn:include.styles', array(
//		Foundry::path( 'style/screen/crimeMap.css' )
	));
	
	Foundry_Registry::set( 'gfn:template.title', 'Depth Chart' );
	Foundry_Registry::set( 'gfn:template.activeNav', 'sports' );
//	Foundry_Registry::set( 'gfn:template.subActiveNav', 'Crime Map' );
?>

<script type="text/javascript">
	<?php Foundry::import( 'page/map/depth-chart-scripts' ) ?>
</script> 
<style type="text/css">

	#depthChartInfo {
		background: url( <?php echo Foundry::path( 'images/depthChart/depthchart-info-bg.png' ) ?> ) no-repeat center center;
		width: 250px;
		height: 250px;
		position: absolute;
		color: #f1f1f1;
	}
	#depthChartInfo a.close {
		position: absolute;
		top: 10px;
		right: 10px;
		width: 12px;
		height: 12px;
	}
		#depthChartInfo a.close span {
			display: none;
		}

	#depthChartInfo > div {
		padding: 10px;
		overflow: auto;
	}
	#depthChartInfo strong {
		color: #f1f1f1;
	}

</style>

<div class="grid_8">

	<a href="http://reprints.statenews.com"><img src="<?php echo Foundry::path( 'images/depthChart/depth-chart-header.gif' ) ?>" alt="Depth Chart" style="border:0;" /></a>
	

	<div id="map" style="width:620px;height:500px;"></div>
	<div style="font-size:.8em;"><strong>Markers are not to scale.</strong> Produced by State News Online Design &amp; Development</div>

	<p>
		The 2009 Spartan Football starting lineup. Select a position, either in the map or below, to see players and stats.
	</p>
	
	<hr class="spacer" />
	
	<div class="grid_4 alpha depthChart-positions">
		<h5 class="bordered">OFFENSE</h5>
		<ul class="grid_2 alpha bullet">
			<li><a href="#map" rel="1">X Receiver</a></li>
			<li><a href="#map" rel="2">Left Tackle</a></li>
			<li><a href="#map" rel="22">Left Guard</a></li>
			<li><a href="#map" rel="3">Center</a></li>
			<li><a href="#map" rel="4">Right Guard</a></li>
		</ul>
		<ul class="grid_2 bullet omega">
			<li><a href="#map" rel="5">Right Tackle</a></li>
			<li><a href="#map" rel="6">Tight End</a></li>
			<li><a href="#map" rel="7">Z Receiver</a></li>
			<li><a href="#map" rel="8">Quarterback</a></li>
			<li><a href="#map" rel="9">Running Back</a></li>
			<li><a href="#map" rel="10">Fullback</a></li>
		</ul>
	</div>
	<div class="grid_4 omega depthChart-positions">
		<h5 class="bordered">DEFENSE</h5>
		<ul class="grid_2 alpha bullet">
			<li><a href="#map" rel="11">Defensive End</a></li>
			<li><a href="#map" rel="12">Defensive Tackle</a></li>
			<li><a href="#map" rel="13">Nose Tackle</a></li>
			<li><a href="#map" rel="14">Defensive End</a></li>
			<li><a href="#map" rel="15">SAM Linebacker</a></li>
		</ul>
		<ul class="grid_2 bullet omega">
			<li><a href="#map" rel="16">MIKE Linebacker</a></li>
			<li><a href="#map" rel="17">WILL Linebacker</a></li>
			<li><a href="#map" rel="18">Front Cornerback</a></li>
			<li><a href="#map" rel="19">Free Safety</a></li>
			<li><a href="#map" rel="20">Strong Safety</a></li>
			<li><a href="#map" rel="21">Back Cornerback</a></li>
		</ul>
	</div>
	
	<div id="depthChartInfo">
		<a href="#" class="close"><img src="<?php echo Foundry::path( 'images/depthChart/depth-chart-x.png' ) ?>" alt="close" /></a>
		<div>
		</div>
	</div>
</div>
<div class="grid_4">
	<?php Foundry::import( 'global:sidebar-medium' ) ?>
</div>
<hr class="spacer" />
