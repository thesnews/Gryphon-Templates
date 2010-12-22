{% extends "gryphon/base.tpl" %}
{% block title %}:: Interactive Map - Tom Page's Top 10 Travel Destinations{% endblock %}

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
		#map {
			margin-left: 160px !important;
			margin-left: 150px;
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
			width: 225px;
			height: 225px;
			background: #fff;
			border: 1px solid #e1e1e1;
		}
			#intro div {
				padding: .5em;
				text-align: left;
			}
	</style>
	
	<script type="text/javascript">
	eval(function(p,a,c,k,e,r){e=function(c){return(c<62?'':e(parseInt(c/62)))+((c=c%62)>35?String.fromCharCode(c+29):c.toString(36))};if('0'.replace(0,e)==0){while(c--)r[e(c)]=k[c];k=[function(e){return r[e]||e}];e=function(){return'([g-zA-Z]|1\\w)'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('window.I(\'domready\',G(){D c={\'zoomLevel\':5,\'iconSize\':[20,20],\'baseIcon\':TSN.path()+\'images/markers/marker_c_blue.gif\',\'iconAnchor\':[5,15],\'locations\':[{n:1,o:"J",p:[-80.474065,24.257813],q:\'r\',s:g h(\'i\',{\'t\':{\'u-v\':\'w, x, y-z\',\'l\':\'A\'}}).m(g h(\'i\',{\'B\':\'<j>J</j> <k>C:</k> Just for K E L.\'}))},{n:2,o:"Tahiti",p:[-17.657108,-149.422302],q:\'r\',s:g h(\'i\',{\'t\':{\'u-v\':\'w, x, y-z\',\'l\':\'A\'}}).m(g h(\'i\',{\'B\':\'<j>Thiti</j> <k>C:</k> Suba H.\'}))},{n:3,o:"M",p:[-24.886436,133.769531],q:\'r\',s:g h(\'i\',{\'t\':{\'u-v\':\'w, x, y-z\',\'l\':\'A\'}}).m(g h(\'i\',{\'B\':\'<j>M</j> <k>C:</k> N H E K in the Outback.\'}))},{n:4,o:"O",p:[26.470573,29.750977],q:\'r\',s:g h(\'i\',{\'t\':{\'u-v\':\'w, x, y-z\',\'l\':\'A\'}}).m(g h(\'i\',{\'B\':\'<j>O</j> <k>C:</k> P.\'}))},{n:5,o:"Q, R",p:[41.011641,28.976097],q:\'r\',s:g h(\'i\',{\'t\':{\'u-v\':\'w, x, y-z\',\'l\':\'A\'}}).m(g h(\'i\',{\'B\':\'<j>Q, R</j> <k>C:</k> S E L.\'}))},{n:6,o:"T U V",p:[19.320215,-81.23909],q:\'r\',s:g h(\'i\',{\'t\':{\'u-v\':\'w, x, y-z\',\'l\':\'A\'}}).m(g h(\'i\',{\'B\':\'<j>T U V</j> <k>C:</k> N H.\'}))},{n:7,o:"W. X, Y",p:[-3.06921,37.359009],q:\'r\',s:g h(\'i\',{\'t\':{\'u-v\':\'w, x, y-z\',\'l\':\'A\'}}).m(g h(\'i\',{\'B\':\'<j>W. X, Y</j> <k>C:</k> Z.\'}))},{n:8,o:"11 12 13",p:[85,24],q:\'r\',s:g h(\'i\',{\'t\':{\'u-v\':\'w, x, y-z\',\'l\':\'A\'}}).m(g h(\'i\',{\'B\':\'<j>11 12 13</j> <k>C:</k> Z.\'}))},{n:9,o:"16, 18",p:[59.914074,10.739822],q:\'r\',s:g h(\'i\',{\'t\':{\'u-v\':\'w, x, y-z\',\'l\':\'A\'}}).m(g h(\'i\',{\'B\':\'<j>16, 18</j> <k>C:</k> S E 1a 1b of 1d 1e cites.\'}))},{n:10,o:"1f, 1g 1h",p:[50.087988,14.418182],q:\'r\',s:g h(\'i\',{\'t\':{\'u-v\':\'w, x, y-z\',\'l\':\'A\'}}).m(g h(\'i\',{\'B\':\'<j>1f, 1g 1h</j> <k>C:</k> P E 1a another 1b of 1d 1e cities.\'}))}]};D b=initMap(c);D d=b[0];D e=b[1];D a=$(\'1i\').getCoordinates();$(document.body).m($(\'F\'));$(\'F\').setStyles({\'1j\':a.1j+(a.height-1k)/2,\'1l\':a.1l+(a.l-1k)/2});$(\'hide_intro\').I(\'1m\',G(f){$(\'F\').1n();return false});GEvent.addListener(d.1i,\'1m\',G(){if($(\'F\')){$(\'F\').1n()}})});',[],86,'||||||||||||||||new|Element|div|h2|strong|width|adopt|id|name|latLng|type|c_blue|infoWindow|styles|font|family|Helvetica|Arial|sans|serif|250px|html|Reason|var|and|intro|function|diving|addEvent|Antarctica|adventure|sightseeing|Australia|Scuba|Egypt|Sightseeing|Istanbul|Turkey|Conference|Grand|Cayman|Island|Mt|Kilimanjaro|Tanzania|Adventure||The|North|Pole|||Oslo||Norway||just|one||his|favorite|Prague|Czech|Republic|map|top|225|left|click|destroy'.split('|'),0,{}))
	</script> 
	
	<a href="http://www.statenews.com/index.php/article/2009/02/beyond_the_books"><img src="<?php echo __FOUNDRY_WEBPATH__ ?>/images/maps/travel_map_header.gif" alt="Tom Page Top 10 Travel Destinations" border="0" style="border:0;" /></a>
	<div class="row no-border" style="position: relative;top:-1px !important;top:-3px;">
		<div id="map" style="width:450px;height:620px;"></div>
		<div style="font-size:.8em;">Source: Tom Page&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;Produced by State News Online Design &amp; Development</div>
		<ul id="list-container"></ul>
		<br /><br />
		<h3><a href="http://www.statenews.com/index.php/article/2009/02/beyond_the_books">&#171; Return to: Beyond the books</a></h3>
	</div>
	
	<div id="intro">
		<div>
			<h3>Tom Page's Top 10 Travel Destinations</h3>
			The associate professor of marketing says he starts to get a sense of wanderlust about every three months. He and his wife like to take at least a couple trips a year.
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