{% extends "gryphon/base.tpl" %}
{% block title %}:: Interactive Map - Rylan Cotter{% endblock %}

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
		eval(function(p,a,c,k,e,r){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('10.K(\'11\',F(){9 a={\'12\':14,\'13\':[g.L,-h.M],\'16\':[20,20],\'17\':18.N()+\'19/1a/1b.1c\',\'1d\':[5,15],\'1e\':[{m:1,n:"i o 1",p:[g.L,-h.M],q:\'1f\',r:6 7(\'8\',{\'u\':{\'v-w\':\'x, y, z-A\',\'j\':\'B\'}}).k(6 7(\'8\',{\'C\':\'1g O\\\'s 1h D G P a 1i 1j a 1k 1l H 1m 1n I D G P i.\'}))},{m:2,n:"i o 2",p:[g.1o,-h.1p],q:\'1q\',r:6 7(\'8\',{\'u\':{\'v-w\':\'x, y, z-A\',\'j\':\'B\'}}).k(6 7(\'8\',{\'C\':\'1r D 1s 1t 1u a N Q E 1v J 1w 1x R S H.\'}))},{m:3,n:"i o 3",p:[g.1y,-h.1z],q:\'1A\',r:6 7(\'8\',{\'u\':{\'v-w\':\'x, y, z-A\',\'j\':\'B\'}}).k(6 7(\'8\',{\'C\':\'1B I D G 1C E 1D 1E 1F E 1G 1H 1I Q E J.\'}))},{m:4,n:"i o 4",p:[g.1J,-h.1K],q:\'1L\',r:6 7(\'8\',{\'u\':{\'v-w\':\'x, y, z-A\',\'j\':\'B\'}}).k(6 7(\'8\',{\'C\':\'1M 1N 1O 1P O 1Q\\\'t 1R S H a 1S J T R 1T 1U 1V.\'}))}]};9 b=1W(a);9 c=b[0];9 d=b[1];9 f=$(\'U\').1X();$(1Y.I).k($(\'l\'));$(\'l\').1Z({\'V\':f.V+(f.21-W)/2,\'X\':f.X+(f.j-W)/2});$(\'22\').K(\'Y\',F(e){$(\'l\').Z();23 24});25.26(c.U,\'Y\',F(){T($(\'l\')){$(\'l\').Z()}})});',62,131,'||||||new|Element|div|var|||||||41|87|Chesterton|width|adopt|intro|id|name|Marker|latLng|type|infoWindow|||styles|font|family|Helvetica|Arial|sans|serif|250px|html|was|the|function|found|from|body|tower|addEvent|597176|105263|path|Cotter|in|near|she|jumped|if|map|top|225|left|click|destroy|window|domready|zoomLevel|center|||iconSize|baseIcon|TSN|images|markers|marker_c20x20_base|gif|iconAnchor|locations|c1|Rylan|car|parking|lot|half|mile|where|her|598644|101551|c2|She|seen|walking|along|electrical|police|said|597208|099427|c3|Her|by|maintenance|staff|of|Brassie|Golf|Club|599944|099545|c4|One|mystery|is|why|wouldn|have|closer|intended|to|jump|initMap|getCoordinates|document|setStyles||height|hide_intro|return|false|GEvent|addListener'.split('|'),0,{}))
		</script> 
		
		<img src="/images/specials/cotter_map_header.gif" alt="Rylan Cotter" />
		<div class="row" style="position: relative;top:-1px !important;top:-3px;">
			<div id="map" style="width:600px;height:400px;"></div>
			<div style="font-size:.8em;">Source: The State News&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;Produced by State News Online Design &amp; Development</div>
			<br /><br />
			<h3><a href="http://www.statenews.com/index.php/article/2009/01/a_mothers_search">&#171; Return to: A mother's search</a></h3>
		</div>
		
		<div id="intro">
			<div>
				<h3>Rylan Cotter's whereabouts on her final day</h3>
		
				For reasons unknown to police or her family, Rylan Cotter left East Lansing for Chesterton, Ind. on Jan. 7, 2008. Two days later, Cotter's body was found on a Chesterton golf course after police say she jumped from a tower to her death. Here is a map of the places Cotter was known to have stopped Jan. 7, 2008 the last day she was seen alive.
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