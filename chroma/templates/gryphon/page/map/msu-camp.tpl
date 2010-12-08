{% extends "gryphon/base.tpl" %}
{% block title %}:: Map : MSU CAMP{% endblock %}

{% block active %}multimedia{% endblock %}
{% block subActive %}Interactives{% endblock %}

{% block scripts %}
	<script type="text/javascript" src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAOAJJSVnRhiCfDawwOL-wDxTTK3WMb6Y_3oBU9NJeBkSCoFhVMhSAjX2xNFBXWPNSCKDIqwceDiNWtA"></script>

{% endblock %}


{% block content %}

	<script type="text/javascript">
	
	var _markers = $H();
	
	document.addEvent( 'domready', function() {
		var coords = $('gmap').getCoordinates();
		
		var screen = new Element( 'div', {
			'id': 'gmap-screen',
			'styles': {
				'position': 'absolute',
				'top': coords.top,
				'left': coords.left,
				'width': '620px',
				'height': '400px',
				'background': '#333 url( '+TSN_BASE_PATH+'style/images/throbber_333.gif ) no-repeat center center',
				'opacity': 0.8,
				'color': '#fff'
			},
			'text': 'Loading...'
		});
		
		$(document.body).adopt( screen );
	
		
	});
	
	var initGMap = function() {
		var map = new google.maps.Map2( $('gmap') );
	
		map.setCenter( new google.maps.LatLng( 38.013476,-97.646484 ) );
		map.addControl( new google.maps.SmallMapControl() );
		map.addControl( new google.maps.MapTypeControl() );
	
		map.setZoom( 4 );
		
		var counter = 0;
		
		[
			{
				latLng: [31.672083,-99.448242],
				title: 'Texas',
				node: 'audio-36869'
			},
			{
				latLng: [37.256566,-119.311523],
				title: 'California',
				node: 'audio-36867'
			},
			{
				latLng: [29.13297,-82.177734],
				title: 'Flordia',
				node: 'audio-36870'
			},
			{
				latLng: [42.988576,-84.506836],
				title: 'Michigan',
				node: 'audio-36868'
			}
			
		].each( function( item ) {
			var marker = new google.maps.Marker( new google.maps.LatLng( item.latLng[0], item.latLng[1] ));
			
			map.addOverlay( marker );
			
			if( item.node ) {
				marker.bindInfoWindow( $(item.node) );
			}
			
			counter++;
			
			_markers.set( 'marker'+counter, marker );
			
		});
	
		setTimeout( function() {
			$('gmap-screen').fade( 'out' );
		}, 1000 );
		
	}
	
	google.load( 'maps', '2.x' );
	google.setOnLoadCallback( initGMap );
	
	
	</script>
	
	<div class="grid_8" id="map">
		<img src="{{ 'images/map_grandrivercorridor.gif'|url }}" height="75px" width="640px" alt="Michigan-Grand River Avenue Corridor Study" />
		
		<p>
			<a href="http://mss.msu.edu/camp/">MSU's College Assistant Migrant Program</a>, or CAMP is the federally funded program that helps students who either are, or have parents who are, migratory or seasonal farmworkers. 
		</p>
		
		<p>
			Currently, MSU CAMP hosts 32 students from Texas, 16 from Michigan, 14 from Flordia and one from California.
		</p>
		
		<p>
			Click a map location to learn more about the CAMP students.
		</p>
		
		<div id="gmap" style="width:620px;height:400px;border:1px solid #333;">
		</div>
		<hr class="spacer" />
		
		<h3><a href="http://www.statenews.com/index.php/article/">Return to XXXX &#187;</a></h3>

		
		{% include 'gryphon/page/interactive/footer.tpl' %}

	</div>
	<div class="grid_4">
		{% include 'gryphon/main/sidebar-standard.tpl' %}
	</div>
	
	<hr class="spacer" />

{% endblock %}
