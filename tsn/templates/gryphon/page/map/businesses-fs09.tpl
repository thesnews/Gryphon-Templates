<?php
	Foundry_Registry::set( 'gfn:include.scripts', array(
		'http://www.google.com/jsapi?key='.
			Foundry_Registry::get( 'gmap:apiKey' ),
		'http://gmaps-utility-library.googlecode.com/svn/trunk/mapiconmaker/1.1/src/mapiconmaker_packed.js',
	));
	
	Foundry_Registry::set( 'gfn:include.styles', array(
		Foundry::path( 'style/screen/crimeMap.css' )
	));
	
	Foundry_Registry::set( 'gfn:template.title', 'Lansing and East Lansing Businesses' );
	Foundry_Registry::set( 'gfn:template.activeNav', 'frontpage' );
?>

<script type="text/javascript">
//window.addEvent( 'domready', function() {

var addMarker = function( info ) {

	if( info.color ) {
		var baseIcon = MapIconMaker.createMarkerIcon({
			width: 30,
			height: 30,
			primaryColor: info.color
		});
	} else {
		var baseIcon = MapIconMaker.createMarkerIcon({
			width: 30,
			height: 30
		});
	}
		
	var newMarker = new google.maps.Marker(
		new google.maps.LatLng( info.latLng[0], info.latLng[1] ), {icon: baseIcon});

	map.addOverlay( newMarker );
	
	new google.maps.Event.addListener( newMarker, 'click', function() {
		map.openInfoWindowHtml( newMarker.getPoint(), '<div style="width:200px;">'+info.infoWindow.get( 'html' )+'</div>' );
	});
	
	if( $('marker_'+info.id) ) {
		$('marker_'+info.id).addEvent( 'click', function(e) {
			e.stop();
			
			google.maps.Event.trigger( newMarker, 'click' );
		});
	}
};

var map = false;

google.load( "maps", "2.x" );

var initCrimeMap = function() {
	map = new google.maps.Map2( $('map') );

	map.setCenter( new google.maps.LatLng( 42.735555, -84.488189 ), 14 );
	map.addControl( new google.maps.SmallMapControl() );
	map.addControl( new google.maps.MapTypeControl() );

	var markers = [
		{
			id:		1,
			name:	"Abbott Place Apts",
			latLng:	[42.759743,-84.48364],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>Abbott Place Apts</strong><br />2501 Abbott Rd East Lansing, MI 48823' } )
		},
		{
			id:		2,
			name:	"Campus Scooter, LLC",
			latLng:	[42.734941,-84.479177],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>Campus Scooter, LLC</strong><br />420 Albert, East Lansing, MI 48823' } )
		},
		{
			id:		3,
			name:	"Clara's Restaurant",
			latLng:	[42.733601,-84.543207],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>Clara\'s Restaurant</strong><br />637 E Michigan Ave, Lansing, MI 48823' } )
		},
		{
			id:		4,
			name:	"Cold Stone Creamery",
			latLng:	[42.734594,-84.481473],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>Cold Stone Creamery</strong><br />200 MAC Ave East Lansing MI 48823' } )
		},
		{
			id:		5,
			name:	"Collegeville Textbook Company",
			latLng:	[42.734531,-84.481087],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>Collegeville Textbook Company</strong><br />321 E Grand River Ave, East Lansing, MI 48823' } )
		},
		{
			id:		6,
			name:	"MSU Counseling Center/Testing Office",
			latLng:	[42.732419,-84.475411],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>MSU Counseling Center/Testing Office</strong><br />207 Student Services East Lansing MI 48823' } )
		},
		{
			id:		7,
			name:	"Curious Book Shop",
			latLng:	[42.734657,-84.48143],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>Curious Book Shop</strong><br />307 E Grand River Ave, East Lansing, MI 48823' } )
		},
		{
			id:		8,
			name:	"Douglas J Salon",
			latLng:	[42.734578,-84.481033],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>Douglas J Salon</strong><br />331 E Grand River Ave, East Lansing, MI 48823' } )
		},
		{
			id:		9,
			name:	"Taco Bell",
			latLng:	[42.733302,-84.476269],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>Taco Bell</strong><br />601 E Grand River Ave, East Lansing, MI 48823' } )
		},
		{
			id:		10,
			name:	"Great Clips",
			latLng:	[42.72769,-84.45611],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>Great Clips</strong><br />2843 E Grand River Ave # 195, East Lansing 48823' } )
		},
		{
			id:		11,
			name:	"Lansing Community College",
			latLng:	[42.71675,-84.454812],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>Lansing Community College</strong><br />2827 Eyde Parkway East Lansing, MI 48823' } )
		},
		{
			id:		12,
			name:	"Martin Luther Chapel",
			latLng:	[42.737454,-84.483715],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>Martin Luther Chapel</strong><br />444 Abbott Rd East Lansing, MI 48823' } )
		},
		{
			id:		13,
			name:	"MSU Computer Store",
			latLng:	[42.730354,-84.479606],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>MSU Computer Store</strong><br />110 Computer Center East Lansing MI 48823' } )
		},
		{
			id:		14,
			name:	"MSU Federal Credit Union",
			latLng:	[42.73379,-84.478179],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>MSU Federal Credit Union</strong><br />523 E. Grand River Ave East Lansing MI, 48823' } )
		},
		{
			id:		15,
			name:	"Ned's Bookstore",
			latLng:	[42.735165,-84.483302],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>Ned\'s Bookstore</strong><br />135 E Grand River Ave East Lansing, MI 48823' } )
		},
		{
			id:		16,
			name:	"Nogginz",
			latLng:	[42.733617,-84.477675],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>Nogginz</strong><br />545 E Grand River Ave East Lansing, MIÊ 48823' } )
		},
		{
			id:		17,
			name:	"Olin Health Center",
			latLng:	[42.729771,-84.479499],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>Olin Health Center</strong><br />Olin Health Center East lansing MI 48823' } )
		},
		{
			id:		18,
			name:	"Potbelly Sandwich Works",
			latLng:	[42.734555,-84.481773],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>Potbelly Sandwich Works</strong><br />233 E Grand River Ave East Lansing, MI 48823' } )
		},
		{
			id:		19,
			name:	"Prime Student Housing",
			latLng:	[42.729716,-84.469028],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>Prime Student Housing</strong><br />1128 Victor Street  East Lansing, MI  48823' } )
		},
		{
			id:		20,
			name:	"Rum Runners",
			latLng:	[42.73364,-84.544623],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>Rum Runners</strong><br />601 E Michigan Ave Lansing, MI 48912' } )
		},
		{
			id:		21,
			name:	"Sparrow Hospital (Okemos Urgent Care)",
			latLng:	[42.711918,-84.432646],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>Sparrow Hospital (Okemos Urgent Care)</strong><br />2248 Mount Hope Rd # 106, Okemos, MI 48864' } )
		},
		{
			id:		22,
			name:	"Spartan Bookstore",
			latLng:	[42.72676,-84.47893],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>Spartan Bookstore</strong><br />1 International Ctr, East Lansing, MI 48823' } )
		},
		{
			id:		23,
			name:	"St. John Student Parish",
			latLng:	[42.736131,-84.4807],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>St. John Student Parish</strong><br />327 M.A.C. Ave East Lansing, MI 48823' } )
		},
		{
			id:		24,
			name:	"State News",
			latLng:	[42.734137,-84.479392],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>State News</strong><br />435 E Grand River Ave East Lansing, MI 48823' } )
		},
		{
			id:		25,
			name:	"Student Book Store",
			latLng:	[42.734145,-84.479563],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>Student Book Store</strong><br />421 E Grand River Ave East Lansing, MI 48823' } )
		},
		{
			id:		26,
			name:	"Study Abroad",
			latLng:	[42.726374,-84.479027],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>Study Abroad</strong><br />109 International Center East Lansing MI 48823' } )
		},
		{
			id:		27,
			name:	"Subway",
			latLng:	[42.731142,-84.468931],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>Subway</strong><br />1100 E Grand River Ave, East Lansing, MI 48823' } )
		},
		{
			id:		28,
			name:	"Super 8 Hotel",
			latLng:	[42.726949,-84.453138],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>Super 8 Hotel</strong><br />2736 East Grand River Ave., East Lansing 48823' } )
		},
		{
			id:		29,
			name:	"The College Store",
			latLng:	[42.718035,-84.462054],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>The College Store</strong><br />4790 S Hagadorn Rd # 138, East Lansing, MI 48823' } )
		},
		{
			id:		30,
			name:	"The Club at Chandler Crossings",
			latLng:	[42.775385,-84.429717],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>The Club at Chandler Crossings</strong><br />3850 Coleman Rd, East Lansing, MI 48823' } )
		},
		{
			id:		31,
			name:	"The Landings at Chandler Crossings",
			latLng:	[42.771195,-84.483662],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>The Landings at Chandler Crossings</strong><br />16789 Chandler Road, East Lansing, MI 48823' } )
		},
		{
			id:		32,
			name:	"The Refinery",
			latLng:	[42.73606,-84.483683],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>The Refinery</strong><br />115 Albert Ave East Lansing, MI 48823' } )
		},
		{
			id:		33,
			name:	"The Village at Chandler Crossings",
			latLng:	[42.773597,-84.486065],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>The Village at Chandler Crossings</strong><br />3839 Hunsaker Street, East Lansing, MI 48823' } )
		},
		{
			id:		34,
			name:	"Value City Furniture",
			latLng:	[42.724955,-84.60302],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>Value City Furniture</strong><br />800 S Waverly Rd Lansing, MI 48917' } )
		},
		{
			id:		35,
			name:	"VIP Tanning",
			latLng:	[42.730709,-84.466828],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>VIP Tanning</strong><br />1215 E Grand River Ave East Lansing, MI 48823' } )
		},
		{
			id:		36,
			name:	"Whiskey Barrel Saloon",
			latLng:	[42.72981,-84.508413],
			color: "#3366cc",
			infoWindow: new Element( 'div', { 'html': '<strong>Whiskey Barrel Saloon</strong><br />410 S Clippert St East Lansing, MI 48912' } )
		}
	];
	
	markers.each( function( marker ) {
		addMarker( marker );
	});

};

google.setOnLoadCallback(initCrimeMap);

//}); // end domready
</script> 

<div class="grid_8">

	<img src="<?php echo Foundry::path( 'images/busfs09_map_header.gif' ) ?>" alt="Lansing area businesses" />

	<div id="map" style="width:620px;height:400px;"></div>
	<div style="font-size:.8em;">Produced by State News Online Design &amp; Development</div>

	<hr class="spacer" />
	
	<div class="grid_4 alpha">
		<h5 class="bordered">Apartments/Housing</h5>
		<ul>
			<li>
				<a href="#" id="marker_1">Abbott Place Apts</a>
			</li>
			<li>
				<a href="#" id="marker_19">Prime Student Housing</a>
			</li>
			<li>
				<a href="#" id="marker_30">The Club at Chandler Crossings</a>
			</li>
			<li>
				<a href="#" id="marker_31">The Landings at Chandler Crossings</a>
			</li>
			<li>
				<a href="#" id="marker_33">The Village at Chandler Crossings</a>
			</li>
		</ul>		
		<h5 class="bordered">Services &amp; Misc</h5>
		<ul>
			<li>
				<a href="#" id="marker_2">Campus Scooter, LLC</a>
			</li>
			<li>
				<a href="#" id="marker_14">MSU Federal Credit Union</a>
			</li>
			<li>
				<a href="#" id="marker_24">State News</a>
			</li>
		</ul>
		
		<h5 class="bordered">Restaurants &amp; Bars</h5>
		<ul>
			<li>
				<a href="#" id="marker_3">Clara's Restaurant</a>
			</li>
			<li>
				<a href="#" id="marker_4">Cold Stone Creamery</a>
			</li>
			<li>
				<a href="#" id="marker_9">Taco Bell</a>
			</li>
			<li>
				<a href="#" id="marker_18">Potbelly Sandwich Works</a>
			</li>
			<li>
				<a href="#" id="marker_20">Rum Runners</a>
			</li>
			<li>
				<a href="#" id="marker_27">Subway</a>
			</li>
			<li>
				<a href="#" id="marker_36">Whiskey Barrel Saloon</a>
			</li>
		</ul>		

		<h5 class="bordered">Books &amp; Supplies</h5>
		<ul>
			<li>
				<a href="#" id="marker_5">Collegeville Textbook Company</a>
			</li>
			<li>
				<a href="#" id="marker_7">Curious Book Shop</a>
			</li>
			<li>
				<a href="#" id="marker_15">Ned's Bookstore</a>
			</li>
			<li>
				<a href="#" id="marker_22">Spartan Bookstore</a>
			</li>
			<li>
				<a href="#" id="marker_25">Student Book Store</a>
			</li>
			<li>
				<a href="#" id="marker_29">The College Store</a>
			</li>
		</ul>

	</div>
	<div class="grid_4 omega">
		<h5 class="bordered">Health</h5>
		<ul>
			<li>
				<a href="#" id="marker_6">MSU Counseling Center/Testing Office</a>
			</li>
			<li>
				<a href="#" id="marker_17">Olin Health Center</a>
			</li>
			<li>
				<a href="#" id="marker_21">Sparrow Hospital (Okemos Urgent Care)</a>
			</li>
		</ul>

		<h5 class="bordered">Hair &amp; Tanning<h5>
		<ul>
			<li>
				<a href="#" id="marker_8">Douglas J Salon</a>
			</li>
			<li>
				<a href="#" id="marker_10">Great Clips</a>
			</li>
			<li>
				<a href="#" id="marker_16">Nogginz</a>
			</li>
			<li>
				<a href="#" id="marker_35">VIP Tanning</a>
			</li>
		</ul>

		<h5 class="bordered">University &amp; Education</h5>
		<ul>
			<li>
				<a href="#" id="marker_13">MSU Computer Store</a>
			</li>
			<li>
				<a href="#" id="marker_11">Lansing Community College</a>
			</li>
			<li>
				<a href="#" id="marker_26">Study Abroad</a>
			</li>
		</ul>

		<h5 class="bordered">Religious</h5>
		<ul>
			<li>
				<a href="#" id="marker_12">Martin Luther Chapel</a>
			</li>
			<li>
				<a href="#" id="marker_23">St. John Student Parish</a>
			</li>
		</ul>

		<h5 class="bordered">Lodging</h5>
		<ul>
			<li><a href="#" id="marker_28">Super 8 Hotel</a></li>
		</ul>

		<h5 class="bordered">Retail</h5>
		<ul>
			<li>
				<a href="#" id="marker_32">The Refinery</a>
			</li>
			<li>
				<a href="#" id="marker_34">Value City Furniture</a>
			</li>
		</ul>	
	</div>
	
	<hr class="spacer" />

</div>
<div class="grid_4">
	<?php Foundry::import( 'global:sidebar-medium' ) ?>
</div>
<hr class="spacer" />
