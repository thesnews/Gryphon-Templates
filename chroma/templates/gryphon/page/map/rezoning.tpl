{% extends "gryphon/base.tpl" %}
{% block title %}:: Interactive Map - Delta Triangle Area that Includes Rezoned Properties{% endblock %}

{% block active %}multimedia{% endblock %}
{% block subActive %}Interactives{% endblock %}

{% block scripts %}
	<script type="text/javascript" src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAOAJJSVnRhiCfDawwOL-wDxTTK3WMb6Y_3oBU9NJeBkSCoFhVMhSAjX2xNFBXWPNSCKDIqwceDiNWtA"></script>
	<script type="text/javascript" src="http://gmaps-utility-library.googlecode.com/svn/trunk/mapiconmaker/1.1/src/mapiconmaker_packed.js"></script>
	
	<script type="text/javascript" src="{{ 'javascript/attic/tsn.compressed.js'|url }}"></script>
	
	<script type="text/javascript" src="{{ 'javascript/attic/map-legacy.js'|url }}"></script>

{% endblock %}


{% block content %}

	<div class="grid_8">
	<style type="text/css">
	
		#info-window {
			background: #fff;
		}
	
		#list-container {
			background: #f1f1f1;
			width: 148px !important;
			width: 150px;
			height: 610px !important;
			height: 620px;
			position: absolute;
			top: 0;
			left: 0;
			padding: 5px;
			overflow: auto;
		}
		
		#list-container li {
			margin: .5em 0;
			padding: 0;
			font-size: 12px;
			list-style-type: none;
			font-weight: bold;
		}
	
		#list-container li img {
			padding-right: 10px;
		}
		
		#intro {
			position: absolute;
			width: 320px;
			height: 250px;
			background: #fff;
			border: 1px solid #e1e1e1;
		}
			#intro div {
				padding: .5em;
				text-align: left;
			}
	</style>
	
	<script type="text/javascript">
	eval(function(p,a,c,k,e,r){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('1p.R(\'1q\',O(){I a={\'1r\':17,\'1s\':[j.1t,-k.1u],\'1v\':[20,20],\'1w\':1x.1y()+\'1z/1A/1B.1C\',\'1D\':[5,15],\'1E\':[{n:1,o:"S T U",p:[j.1F,-k.1G],q:\'E\',r:g h(\'i\',{\'s\':{\'t-u\':\'v, w, x-y\',\'l\':\'z\'}}).m(g h(\'i\',{\'A\':\'S T U\'}))},{n:2,o:"V F D.",p:[j.W,-k.1H],q:\'E\',r:g h(\'i\',{\'s\':{\'t-u\':\'v, w, x-y\',\'l\':\'z\'}}).m(g h(\'i\',{\'A\':\'V F D\'}))},{n:3,o:"X F D.",p:[j.1I,-k.K],q:\'H\',r:g h(\'i\',{\'s\':{\'t-u\':\'v, w, x-y\',\'l\':\'z\'}}).m(g h(\'i\',{\'A\':\'X F D\'}))},{n:4,o:"Y F D.",p:[j.1J,-k.K],q:\'H\',r:g h(\'i\',{\'s\':{\'t-u\':\'v, w, x-y\',\'l\':\'z\'}}).m(g h(\'i\',{\'A\':\'Y F D\'}))},{n:5,o:"Z F D.",p:[j.1K,-k.K],q:\'E\',r:g h(\'i\',{\'s\':{\'t-u\':\'v, w, x-y\',\'l\':\'z\'}}).m(g h(\'i\',{\'A\':\'<G>18 1L 1M 1N</G><L />Z F D\'}))},{n:6,o:"19 F D.",p:[j.1a,-k.K],q:\'E\',r:g h(\'i\',{\'s\':{\'t-u\':\'v, w, x-y\',\'l\':\'z\'}}).m(g h(\'i\',{\'A\':\'19 F D\'}))},{n:7,o:"M B C",p:[j.1b,-k.1c],q:\'E\',r:g h(\'i\',{\'s\':{\'t-u\':\'v, w, x-y\',\'l\':\'z\'}}).m(g h(\'i\',{\'A\':\'M B C\'}))},{n:8,o:"M B C",p:[j.1b,-k.1c],q:\'E\',r:g h(\'i\',{\'s\':{\'t-u\':\'v, w, x-y\',\'l\':\'z\'}}).m(g h(\'i\',{\'A\':\'M B C\'}))},{n:9,o:"1d B C",p:[j.1O,-k.1P],q:\'E\',r:g h(\'i\',{\'s\':{\'t-u\':\'v, w, x-y\',\'l\':\'z\'}}).m(g h(\'i\',{\'A\':\'1d B C\'}))},{n:10,o:"1e B C",p:[j.1Q,-k.1R],q:\'E\',r:g h(\'i\',{\'s\':{\'t-u\':\'v, w, x-y\',\'l\':\'z\'}}).m(g h(\'i\',{\'A\':\'1e B C\'}))},{n:11,o:"1f B C",p:[j.1S,-k.1T],q:\'E\',r:g h(\'i\',{\'s\':{\'t-u\':\'v, w, x-y\',\'l\':\'z\'}}).m(g h(\'i\',{\'A\':\'1f B C\'}))},{n:12,o:"P B C",p:[j.W,-k.1U],q:\'E\',r:g h(\'i\',{\'s\':{\'t-u\':\'v, w, x-y\',\'l\':\'z\'}}).m(g h(\'i\',{\'A\':\'<G>1V 18 1W</G><L />P B C\'}))},{n:13,o:"1X B C",p:[j.1Y,-k.1Z],q:\'H\',r:g h(\'i\',{\'s\':{\'t-u\':\'v, w, x-y\',\'l\':\'z\'}}).m(g h(\'i\',{\'A\':\'<G>21 22 23</G><L />P B C\'}))},{n:14,o:"1g B C",p:[j.1a,-k.Q],q:\'H\',r:g h(\'i\',{\'s\':{\'t-u\':\'v, w, x-y\',\'l\':\'z\'}}).m(g h(\'i\',{\'A\':\'1g B C\'}))},{n:15,o:"1h N D",p:[j.24,-k.Q],q:\'H\',r:g h(\'i\',{\'s\':{\'t-u\':\'v, w, x-y\',\'l\':\'z\'}}).m(g h(\'i\',{\'A\':\'<G>25 26</G><L />1h N D\'}))},{n:16,o:"1i N D",p:[j.27,-k.Q],q:\'H\',r:g h(\'i\',{\'s\':{\'t-u\':\'v, w, x-y\',\'l\':\'z\'}}).m(g h(\'i\',{\'A\':\'1i N D\'}))}]};I b=28(a);I c=b[0];I d=b[1];I f=$(\'1j\').29();$(2a.2b).m($(\'J\'));$(\'J\').2c({\'1k\':f.1k+(f.2d-1l)/2,\'1m\':f.1m+(f.l-1l)/2});$(\'2e\').R(\'1n\',O(e){$(\'J\').1o();2f 2g});2h.2i(c.1j,\'1n\',O(){2j($(\'J\')){$(\'J\').1o()}})});',62,144,'||||||||||||||||new|Element|div|42|84|width|adopt|id|name|latLng|type|infoWindow|styles|font|family|Helvetica|Arial|sans|serif|250px|html|Michigan|Ave|St|c_blue|Louis|strong|c_orange|var|intro|490300|br|424|Delta|function|334|488100|addEvent|321|Elm|Place|134|735050|113|117|123|||||||||Alpha|131|735150|734750|489750|414|404|344|308|223|235|map|top|225|left|click|destroy|window|domready|zoomLevel|center|735555|488189|iconSize|baseIcon|TSN|path|images|markers|marker_c_blue|gif|iconAnchor|locations|735350|489498|489900|734623|734800|734970|Kappa|Psi|Fraternity|734850|489300|734900|489100|734950|488900|488600|Sigma|Sorority|324|735100|488350||Campus|View|Apartments|735450|Studio|House|735650|initMap|getCoordinates|document|body|setStyles|height|hide_intro|return|false|GEvent|addListener|if'.split('|'),0,{}))
	</script> 
	
	<img src="/images/maps/rezone_map_header.gif" alt="Delta Triangle Area that Includes Rezoned Properties" />
	<div class="row" style="position: relative;top:-1px !important;top:-3px;">
		<div id="map" style="width:600px;height:400px;"></div>
		<div style="font-size:.8em;">Source: City of East Lansing&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;Produced by State News Online Design &amp; Development</div>
		<br /><br />
		<h3><a href="http://www.statenews.com/index.php/article/2009/01/plans_for_delta_triangle_wont_oust_students">&#171; Return to: Plans for Delta Triangle won't oust students</a></h3>
	</div>
	<div id="intro">
		<div>
			<h4>Map of the Delta Triangle Area that Includes Rezoned Properties</h4>
	
			A significant portion of the Delta Triangle area of Louis Street, Michigan Avenue, Delta Street and Elm Place was rezoned by the East Lansing City Council at last week's council meeting. The map includes locations that have been rezoned and the locations that are unaffected by last week's passing of the rezoning project. Distinctions of sororities, fraternities and apartments are also included.
			<br /><br />
			<a href="#" id="hide_intro">Show me the map &#187;</a>
		</div>
	</div>
		
		{% include 'gryphon/page/interactive/footer.tpl' %}

	</div>
	<div class="grid_4">
		{% include 'gryphon/main/sidebar-standard.tpl' %}
	</div>
	
	<hr class="spacer" />

{% endblock %}