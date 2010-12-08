<?php
	$items = _M( 'DepthChart:depthChartPosition' )->find( 'order by '.
		'name' );
		
	$positions = array();
	foreach( $items as $item ) {
		$positions[$item->name] = $item->data_formatted;
	}
?>
document.addEvent( 'domready', function() {
	var coords = $('map').getCoordinates();
	
	var screen = new Element( 'div', {
		'id': 'depthchart-screen',
		'styles': {
			'position': 'absolute',
			'top': coords.top,
			'left': coords.left,
			'width': '620px',
			'height': '500px',
			'background': '#333 url( '+TSN_BASE_PATH+'style/images/throbber_333.gif ) no-repeat center center',
			'opacity': 0.8,
			'color': '#fff'
		},
		'text': 'Loading...'
	});
	
	$(document.body).adopt( screen );
	
});

var initDepthChart = function() {
	var map = new google.maps.Map2( $('map') );

	map.setCenter( new google.maps.LatLng( 42.728206,-84.484874 ), 20, G_HYBRID_MAP );
//	map.addControl( new google.maps.SmallMapControl() );
//	map.addControl( new google.maps.MapTypeControl() );

//	map.setZoom( 20 );
	
	
	$(document.body).adopt( $('depthChartInfo') );
	var coords = $('map').getCoordinates();
	
	$('depthChartInfo').setStyles({
		'top': coords.top,
		'left': coords.left
	});
	$('depthChartInfo').getChildren( 'a' ).pop().addEvent( 'click', function(e){
		this.getParent().fade( 'out' );
		resetMarkers();
		return false;
	});

	$('depthChartInfo').set( 'tween', {
		'duration': 100
	});
	
	$('depthChartInfo').fade( 'hide' );

	items.each( function( item ) {
	
		var iconPath = TSN_BASE_PATH+'images/depthChart/scrim-x-icon.png';
		
		if( item.line == 'offense' ) {
			iconPath = TSN_BASE_PATH+'images/depthChart/scrim-o-icon.png';
		}
	
        var icon = new google.maps.Icon();
        icon.image = iconPath;
        icon.iconAnchor = new google.maps.Point(13, 13);
        icon.infoWindowAnchor = new google.maps.Point(13, 0);
        icon.iconSize = new google.maps.Size(26, 26);
        
        var marker = new google.maps.Marker( new google.maps.LatLng( item.location[0], item.location[1] ), {icon: icon});

		GEvent.addListener( marker, 'click', function(){ 
			resetMarkers();
			
			var iconActive = TSN_BASE_PATH+
				'images/depthChart/scrim-x-icon-active.png';

			if( item.line == 'offense' ) {
				iconActive = TSN_BASE_PATH+
					'images/depthChart/scrim-o-icon-active.png';
			}
			
			marker.setImage( iconActive );
			$('depthChartInfo').fade( 'in' );
			$('depthChartInfo').getChildren( 'div' ).pop().set( 'html',
				'<h4>'+item.position+'</h4>'+
				'<br /><br />'+item.players
			);
			
		});

	    map.addOverlay(marker);
	    
	    markers.set( item.id, { line:item.line, marker:marker } );
    });

	$$('.depthChart-positions ul li a' ).addEvent( 'click', function(e) {
		var id = this.get( 'rel' );

		google.maps.Event.trigger( markers.get(id).marker, 'click' );
	});

	setTimeout( function() {
		$('depthchart-screen').fade( 'out' );
	}, 1000 );
};

var resetMarkers = function() {
	markers.each( function( m, k ) {
		if( m.line == 'offense' ) {
			m.marker.setImage( TSN_BASE_PATH+
				'images/depthChart/scrim-o-icon.png' );
		} else {
			m.marker.setImage( TSN_BASE_PATH+
				'images/depthChart/scrim-x-icon.png' );
		}
	});
}
google.load( 'maps', '2.x' );
google.setOnLoadCallback( initDepthChart );
var markers = $H({});
var items = [

	{
		id: 1,
		position: 'X Receiver',
		line: "offense",
		description: "",
		players: "<?php echo str_replace( "\n", "\\n", $positions['X Receiver'] ) ?>",
		location: [42.728186,-84.484624]
	},
	{
		id: 2,
		position: 'Left Tackle',
		line: 'offense',
		description: "",
		players: "<?php echo str_replace( "\n", "\\n", $positions['Left Tackle'] ) ?>",
		location: [42.728186,-84.484714]
	},
	{
		id: 22,
		position: 'Left Guard',
		line: 'offense',
		description: "",
		players: "<?php echo str_replace( "\n", "\\n", $positions['Left Guard'] ) ?>",
		location: [42.728186,-84.484774]
	},
	{
		id: 3,
		position: 'Center',
		line: 'offense',
		description: "",
		players: "<?php echo str_replace( "\n", "\\n", $positions['Center'] ) ?>",
		location: [42.728186,-84.484839]
	},
	{
		id: 4,
		position: 'Right Guard',
		line: 'offense',
		description: "",
		players: "<?php echo str_replace( "\n", "\\n", $positions['Right Guard'] ) ?>",
		location: [42.728186,-84.484904]
	},
	{
		id: 5,
		position: 'Right Tackle',
		line: 'offense',
		description: "",
		players: "<?php echo str_replace( "\n", "\\n", $positions['Right Tackle'] ) ?>",
		location: [42.728186,-84.484984]
	},
	{
		id: 6,
		position: 'Tight End',
		line: 'offense',
		description: "",
		players: "<?php echo str_replace( "\n", "\\n", $positions['Tight End'] ) ?>",
		location: [42.728186,-84.485054]
	},
	{
		id: 7,
		position: 'Z Receiver',
		line: 'offense',
		description: "",
		players: "<?php echo str_replace( "\n", "\\n", $positions['Z Receiver'] ) ?>",
		location: [42.728186,-84.485129]
	},
	{
		id: 8,
		position: 'Quarterback',
		line: 'offense',
		description: "",
		players: "<?php echo str_replace( "\n", "\\n", $positions['Quarterback'] ) ?>",
		location: [42.728216,-84.484839]
	},
	{
		id: 9,
		position: 'Running Back',
		line: 'offense',
		description: "",
		players: "<?php echo str_replace( "\n", "\\n", $positions['Running Back'] ) ?>",
		location: [42.728236,-84.484774]
	},
	{
		id: 10,
		position: 'Fullback',
		line: 'offense',
		description: "",
		players: "<?php echo str_replace( "\n", "\\n", $positions['Fullback'] ) ?>",
		location: [42.728236,-84.484904]
	},
	{
		id: 11,
		position: 'Defensive End (R)',
		line: 'defense',
		description: "",
		players: "<?php echo str_replace( "\n", "\\n", $positions['Defensive End (R)'] ) ?>",
		location: [42.728146,-84.484774]
	},
	{
		id: 12,
		position: 'Defensive Tackle',
		line: 'defense',
		description: "",
		players: "<?php echo str_replace( "\n", "\\n", $positions['Defensive Tackle'] ) ?>",
		location: [42.728146,-84.484904]
	},
	{
		id: 13,
		position: 'Nose Tackle',
		line: 'defense',
		description: "",
		players: "<?php echo str_replace( "\n", "\\n", $positions['Nose Tackle'] ) ?>",
		location: [42.728146,-84.484839]
	},
	{
		id: 14,
		position: 'Defensive End (L)',
		line: 'defense',
		description: "",
		players: "<?php echo str_replace( "\n", "\\n", $positions['Defensive End (L)'] ) ?>",
		location: [42.728146,-84.484984]
	},
	{
		id: 15,
		position: 'SAM Linebacker',
		line: 'defense',
		description: "",
		players: "<?php echo str_replace( "\n", "\\n", $positions['SAM Linebacker'] ) ?>",
		location: [42.728116,-84.484939]
	},
	{
		id: 16,
		position: 'MIKE Linebacker',
		line: 'defense',
		description: "",
		players: "<?php echo str_replace( "\n", "\\n", $positions['MIKE Linebacker'] ) ?>",
		location: [42.728116,-84.484869]
	},
	{
		id: 17,
		position: 'WILL Linebacker',
		line: 'defense',
		description: "",
		players: "<?php echo str_replace( "\n", "\\n", $positions['WILL Linebacker'] ) ?>",
		location: [42.728116,-84.484809]
	},
	{
		id: 18,
		position: 'Front Cornerback',
		line: 'defense',
		description: "",
		players: "<?php echo str_replace( "\n", "\\n", $positions['Front Cornerback'] ) ?>",
		location: [42.728146,-84.485129]
	},
	{
		id: 19,
		position: 'Free Safety',
		line: 'defense',
		description: "",
		players: "<?php echo str_replace( "\n", "\\n", $positions['Free Safety'] ) ?>",
		location: [42.728086,-84.484959]
	},
	{
		id: 20,
		position: 'Strong Safety',
		line: 'defense',
		description: "",
		players: "<?php echo str_replace( "\n", "\\n", $positions['Strong Safety'] ) ?>",
		location: [42.728086,-84.484774]
	},
	{
		id: 21,
		position: 'Back Cornerback',
		line: "defense",
		description: "",
		players: "<?php echo str_replace( "\n", "\\n", $positions['Back Cornerback'] ) ?>",
		location: [42.728146,-84.484624]
	}


];