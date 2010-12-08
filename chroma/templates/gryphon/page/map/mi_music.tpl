{% extends "gryphon/base.tpl" %}
{% block title %}:: Interactive Map - Michigan Music{% endblock %}

{% block active %}multimedia{% endblock %}
{% block subActive %}Interactives{% endblock %}

{% block scripts %}
	<script type="text/javascript" src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAOAJJSVnRhiCfDawwOL-wDxTTK3WMb6Y_3oBU9NJeBkSCoFhVMhSAjX2xNFBXWPNSCKDIqwceDiNWtA"></script>
	<script type="text/javascript" src="http://gmaps-utility-library.googlecode.com/svn/trunk/mapiconmaker/1.1/src/mapiconmaker_packed.js"></script>
	
	<script type="text/javascript" src="{{ 'javascript/attic/tsn.compressed.js'|url }}"></script>
	
	<script type="text/javascript" src="{{ 'javascript/attic/map-legacy.js'|url }}"></script>

{% endblock %}


{% block content %}

	<style type="text/css">
		
			.message {
				background:#FFFFCC;
			}
			
			#comment-container {
				width: 150px;
				height: 500px;
				background: #f1f1f1;
				overflow: auto;
			}
				#comment-container > div {
					padding: 10px;
				}
				#comment-container ul {
					margin: 1em 0;
					text-align: left;
					font-size: .9em;
				}
					#comment-container li {
						margin: 1em 0;
					}
			#map { 
				margin-left: 150px;
			}
	</style>
	
	<div class="grid_8">
	<script type="text/javascript">
	
	window.addEvent( 'domready', function() {
	
	var mapData = {
		'zoomLevel': 7,
		'center': [44.323848,-84.759521],
		'iconSize': [20,20],
		'baseIcon': TSN.path()+'images/markers/marker_c_blue.gif',
		'iconAnchor': [5,15],
		'locations': []
	};
	
	var returnData = initMap( mapData );
	var map = returnData[0];
	var markers = returnData[1];
	
	var coords = $('map').getCoordinates();
	
	var screen = new Element( 'div', {
		'styles': {
			'position': 'absolute',
			'top': coords.top,
			'left': coords.left - 175,
			'width': coords.width + 175,
			'height': coords.height,
			'opacity': .9,
			'z-index': 10,
			'background': 'url('+TSN.path()+'/kAssets/image/spinner_new.gif) no-repeat center center'
		}
	});
	$(document.body).adopt( screen );
	
	
	$(document.body).adopt( $('comment-container') );
	
	$('comment-container').setStyles({
		'position': 'absolute',
		'top': coords.top,
		'left': coords.left - 150
	});
	
	var actualMap = map.map;
	var placedMarker = false;
	
	var createMarker = function( data ) {
		
		if( !data.id || !data.latLng ) {
			var listItem =  new Element( 'li' ).adopt(
				new Element( 'strong', {
					'text': data.title
				})
			);
			
			$('comment-list').adopt( listItem );
	
			return;
		}
	
		var baseIcon = MapIconMaker.createMarkerIcon({
			width: 30,
			height: 30,
			primaryColor: data.colors.primary,
			cornerColor: data.colors.corner
		});
		
		width = 200;
		if( data.width && parseInt( data.width ) > 1 ) {
			width = parseInt( data.width );
		}
	
		var newMarker = new GMarker(
			new GLatLng( data.latLng[0], data.latLng[1] ),
			{icon: baseIcon});
	
		if( data.content ) {
			newMarker.bindInfoWindow( new Element( 'div', {
				'styles': {
					'width': width+'px',
					'font-size': '12px'
				}
			}).adopt( new Element( 'span', {
					'html': data.content
				})
			));
		}
		
		actualMap.addOverlay( newMarker );
		allMarkers.set( data.id, newMarker );
		
		var listItem =  new Element( 'li' ).adopt(
			new Element( 'span', {
				'text': '-',
				'styles': {
					'color': data.colors.primary,
					'background': data.colors.primary,
					'padding': '0 .5em',
					'margin-right': '1em',
					'margin-bottom': '.5em',
					'float': 'left'
				}
			}),
			new Element( 'a', {
				'href': '#',
				'text': data.title,
				'id': 'map-item-'+data.id,
				'events': {
					'click': function(e) {
						GEvent.trigger( allMarkers[data.id], 'click' );
						return false;
					}
				}
			})
		);
		
		if( arguments[1] && arguments[1] == true ) {
			$('comment-list').grab( listItem, 'top' );
		} else {
			$('comment-list').adopt( listItem );
		}
	
		
		return newMarker;
	
	};
	
	var items = [
		{
			id: false,
			title: "Detroit"
		},
		{
			id:			1,
			title:		'Movement',
			latLng:		[42.327807,-83.044667],
			colors:		{
				primary:	"#0066CC",
				corner:		"#3399FF"
			},
			width: 350,
			content: "<h4>Movement</h4>Beginning in 2000 and held in downtown Detroit, this festival celebrates all that is techno music.<br /><br />James Canning, spokesman for Paxahau Event Productions, which has been putting on the festival since 2006, said Detroit's role in the creation and evolution of techno is an important part of the festival.<br /><br />\"Detroit is considered the birthplace of techno, therefore there is a lot of nostalgia and history here that people come to enjoy,\" Canning said.<br /><br />Held in Hart Plaza, Canning said the music as well as the location on the Detroit riverfront draws a variety of festivalgoers.<br /><br />\"There is a really strong demographic across cultures, across races and even ages,\" Canning said. \"I mean there's some longtime techno heads that come out every year and they can be 40, 50 years old.\"<br /><br /> <strong>When:</strong> May 23-25<br><br /><strong>Where:</strong> Detroit, located about one and half hours southeast of East Lansing.<br><br /><strong>Featured artists:</strong> <a href=\"http://www.youtube.com/watch?v=GO79SfV5-Ig&feature=related\">Derrick May</a>, <a href=\"http://www.youtube.com/watch?v=vt-mDVvrNu8&feature=related\">Afrika Bambaataa</a> and <a href=\"http://www.youtube.com/watch?v=ISL_zO6Q-OA\">RJD2</a><br><br /><strong>Cost:</strong> A weekend passes is $40.<br><br /><strong>More information:</strong> <a href=\"http://www.paxahau.com\">www.paxahau.com</a>"
		},
		{
			id: false,
			title: "Rothbury"
		},
		{
			id:			2,
			title:		'Rothbury Festival',
			latLng:		[43.519676,-86.373825],
			colors:		{
				primary:	"#CC0000",
				corner:		"#FF0000"
			},
			width: 350,
			content: "<h4>Rothbury</h4>Focusing on environmental sustainability, this festival was first held in 2008, featuring musicians from a variety of genres and offering campsites for festivalgoers to set up tents, RVs or stay in other established accommodations. The festival is a joint production between Madison House Publicity and AEG Live.<br /><br />Jake Bo-Min Yaeger, an interdisciplinary humanities sophomore, attended the festival and said its diverse roster introduced him to new music.<br /><br />\"There's a lot to do, there's a lot to see and the lineup was just phenomenal,\" Yaeger said.<br /><br />He said he valued the fact that such a large festival was located in his home state.<br /><br />\"Just being in Michigan. I love my state, Michigan, and I like being here in the summer,\" Yaeger said. \"I love having a great, huge music festival that's nationally renowned just being right in our backyard basically.\"<br /><br /><strong>When:</strong> July 2-5<br /><br /><strong>Where:</strong> Rothbury, located about two hours northwest of East Lansing<br /><br /><strong>Featured artists:</strong> <a href=\"http://www.youtube.com/watch?v=cEksWb8J96Q&feature=related\">Bob Dylan</a> and his band, <a href=\"http://www.youtube.com/watch?v=_e_rxsxcMjg&feature=related\">Girl Talk</a> and <a href=\"http://www.youtube.com/watch?v=yvQc31eknRk&feature=related\">The Hold Steady</a><br /><br /><strong>Cost:</strong> A weekend ticket is $249.50 (plus fees), an RV pass is an additional $125 and Good Life passes also are available at a variety of prices. Good Life passes allow access to VIP areas such as campsites and other accommodations as well as amenities including better seating and air-conditioned bathrooms based on ticket price.<br /><br /><strong>More information:</strong> <a href=\"http://www.rothburyfestival.com\">www.rothburyfestival.com</a>"
		},
		{
			id: false,
			title: "Harbor Springs"
		},
		{
			id:			3,
			title:		'Blissfest 2009',
			latLng:		[45.435503,-84.990406],
			colors:		{
				primary:	"#336600",
				corner:		"#339900"
			},
			width: 350,
			content: "<h4>Blissfest 2009</h4>Jim Gillespie, executive director of the Blissfest Music Organization, founded Blissfest 29 years ago and said the music festival has grown and developed into a community.<br /><br />\"The fact that we've been around so long, it's become a real tradition for a lot of people,\" Gillespie said.<br /><br />He said the festival also celebrates issues like environmentalism and features local products, such as food and microbrews.<br /><br />\"Not only is it music oriented, but the people that started it are kind of the hippies from the early '70s who -- are the organic farmers and things like that,\" Gillespie said. \"So, we have a lot of that going on.\"<br /><br />Blissfest has even become a time of year to commemorate another monumental moment.<br /><br />\"We have 2 or 3 weddings every year,\" Gillespie said.<br /><br /><strong>When:</strong> July 10-12<br /><br /><strong>Where:</strong> Harbor Springs, located about four hours north of East Lansing<br /><br /><strong>Featured artists:</strong> <a href=\"http://www.youtube.com/watch?v=ekJEoSf-ACs\">Kathy Mattea</a>, <a href=\"http://www.youtube.com/watch?v=Nzk8cR_tRt0\">Mountain Heart</a> and <a href=\"http://www.youtube.com/watch?v=3wGMsOhaPJs\">That 1 Guy</a><br /><br /><strong>Cost:</strong> Advanced weekend passes are available at $78 for adults, $35 for teens and $70 for seniors. Tickets purchased at the gate are $90 for adults, $45 for teens and $80 for seniors. Camping passes are $20 in advance or $25 at the gate. Daily ticket prices for adults are $30 for Friday, $40 for Saturday and $25 for Sunday. Teen day passes are $15 on all days.<br /><br /><strong>More information:</strong> <a href=\"http://www.blissfest.org\">www.blissfest.org</a>"
		},
		{
			id: false,
			title: "Johannesburg"
		},
		{
			id:			4,
			title:		'Farmfest',
			latLng:		[44.985928,-84.456024],
			colors:		{
				primary:	"#006699",
				corner:		"#3399CC"
			},
			width: 350,
			content: "<h4>Farmfest</h4>This annual festival is held on Stacy Jo Schiller's 40-acre farm near Johannesburg. Schiller, the festival's founder, said her festival began as a way to give back to her community, a welcoming environment typical of early music festivals.<br /><br />\"At Farmfest, you can literally let your children go just to have a good time. The people take care of each other. There's never been any issues with safety,\" Schiller said.<br /><br />Schiller said many festival attendees return year after year.<br /><br />\"It's almost like a family reunion with a big backyard party,\" she said.<br /><br />Farmfest does not have an a fixed ticket price, admission is based on donation.<br /><br />\"It's affordable for everybody, that's the main thing,\" Schiller said. \"They're coming for the community, and they're coming for the music. And I knew that if people were giving from the heart, it would all take care of itself.\"<br /><br /><strong>When:</strong> Aug. 13-16<br /><br /><strike>Where:</strike> Johannesburg, located about three hours north of East Lansing, east of Gaylord<br /><br /><strong>Featured artists:</strong> <a href=\"http://www.youtube.com/watch?v=-gWfOhhUJ2c\">Seth Bernard and Daisy May Erlewine</a>, <a href=\"http://www.myspace.com/medcrow\">Medicine Crow</a> and <a href=\"http://www.myspace.com/bobmarshallmusic\">Bob Marshall</a><br /><br /><strong>Cost:</strong> Admission is by donation, with the suggested amount at $50.<br /><br /><strong>More information:</strong> <a href=\"http://www.farm-fest.com\">www.farm-fest.com</a>"
		},
		{
			id: false,
			title: "Porcupine Mountains Wilderness State Park"
		},
		{
			id:			5,
			title:		'Porcupine Mountains Music Festival',
			latLng:		[46.815099,-89.296875],
			colors:		{
				primary:	"#6600FF",
				corner:		"#9900FF"
			},
			width: 350,
			content: "<h4>Porcupine Mountains Music Festival</h4> Don Kermeen, founder and booking coordinator of the Porcupine Mountains Music Festival, said the natural beauty of the festival's Upper Peninsula setting is what makes this musical event one of a kind.<br /><br />\"I think the things that make it stand out is the setting it's in,\" Kermeen said. \"It's beautiful. The stages overlook Lake Superior, you have them as a backdrop,\" Kermeen said.<br /><br />The festival is not limited to any particular genre, and it hosts a variety of independent artists.<br /><br />\"We're not a blues festival, we're not a folk festival, we're not a bluegrass festival,\" Kermeen said. \"We are a music festival and we continue to provide a wide variety of music for people to listen to.\"<br /><br /><strong>When:</strong> Aug. 28-30<br /><br /><strong>Where:</strong> Porcupine Mountains Wilderness State Park, located about 10 hours northwest of East Lansing<br /><br /><strong>Featured artists:</strong> <a href=\"http://www.youtube.com/watch?v=cRG64fUkywA\">Cadillac Sky</a>, <a href=\"http://www.youtube.com/watch?v=4VETTtCmkEs&feature=related\">Gandalf Murphy and the Slambovian Circus of Dreams</a> and <a href=\"http://www.youtube.com/watch?v=fxooTHQEKVI\">Pieta Brown</a><br /><br /><strong>Cost:</strong> Tickets bought before Aug. 14 are discounted, with three-day passes available for $76.50 and one-day passes for $29.75. Tickets bought from Aug. 15 onward are sold at full price, with three-day passes available for $90 and one-day passes for $35.<br /><br /><strong>More information:</strong> <a href=\"http://www.porkiesfestival.org\">www.porkiesfestival.org</a>"
		}
	];
	var allMarkers = new Hash;
	
	items.each( function( item ) {
		createMarker( item );
	});
	
	screen.setStyle( 'opacity', 0 );
	
	});
	</script> 
	
	<img src="/images/maps/map_header_mi_movies.gif" alt="Michigan Movies" height="70" />
	<div class="row">
		<div id="map" style="width:450px;height:550px;"></div>
		<div style="font-size:.8em;">
			Source: <a href="http://www.imdb.com">IMDB</a>, The State News | Produced by State News Online Design &amp; Development
		</div>
		<br /><br />
		<div id="comment-container"><div>
			<ul id="comment-list">
			
			</ul>
			
		</div></div>
	</div>
		
		{% include 'gryphon/page/interactive/footer.tpl' %}

	</div>
	<div class="grid_4">
		{% include 'gryphon/main/sidebar-standard.tpl' %}
	</div>
	
	<hr class="spacer" />

{% endblock %}