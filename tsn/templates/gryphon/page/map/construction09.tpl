{% extends "gryphon/base.tpl" %}
{% block title %}:: Interactive Map - Campus Construction{% endblock %}

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
	
	<script type="text/javascript">
eval(function(p,a,c,k,e,r){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('25.26(\'27\',X(){s f={\'28\':14,\'29\':[42.2a,-C.2b],\'2c\':[20,20],\'2d\':2e.2f()+\'2g/2h/2i.2j\',\'2k\':[5,15],\'2l\':[]};s g=2m(f);s h=g[0];s i=g[1];s j=$(\'12\').2n();$(2o.2p).N($(\'S-1s\'));$(\'S-1s\').2q({\'2r\':\'2s\',\'13\':j.13,\'16\':j.16-2t});s k=h.12;s l=1t;s m=X(a){1u(!a.u||!a.w){s b=p F(\'1v\').N(p F(\'q\',{\'17\':a.z}));$(\'S-19\').N(b);1a}s c=2u.2v({1w:30,2w:30,2x:a.v.x,2y:a.v.D});s d=p 2z(p 2A(a.w[0],a.w[1]),{2B:c});d.2C(p F(\'2D\',{\'1x\':{\'1w\':\'2E\'}}).N(p F(\'1b\',{\'2F\':a.E})));k.2G(d);o.2H(a.u,d);s b=p F(\'1v\').N(p F(\'1b\',{\'17\':\'-\',\'1x\':{\'2I\':a.v.x,\'2J\':a.v.x,\'2K\':\'0 .1y\',\'1z-2L\':\'2M\',\'1z-2N\':\'.1y\',\'2O\':\'16\'}}),p F(\'a\',{\'2P\':\'#\',\'17\':a.z,\'u\':\'12-2Q-\'+a.u,\'2R\':{\'1A\':X(e){2S.2T(o[a.u],\'1A\');1a 1t}}}));1u(1B[1]&&1B[1]==2U){$(\'S-19\').2V(b,\'13\')}2W{$(\'S-19\').N(b)}1a d};s n=[{u:1,z:\'1c\',w:[42.2X,-C.2Y],v:{x:"#G",D:"#H"},E:"<q>1c</q><I />O r 8 1c y r 1d, 2Z 1e 1f J 1g 1C. 32 r 8 33 9 1D 1E B 8 1F 34 P t K 1h J 1G T 1H. Q 35 Y 1I U 36 B 8 1F y P t 37 V 38 8 39 3a 1i L W."},{u:2,z:\'1j R\',w:[42.3b,-C.3c],v:{x:"#G",D:"#H"},E:"<q>1j 3d</q><I />O r 1j R, 3e y P t 3f J 8 3g 3h 3i, 3j 1k Z r 8 3k B 8 1l. A 3l 3m M K 3n t 1J 1i L W."},{u:3,z:\'1m Y\',w:[42.3o,-C.3p],v:{x:"#G",D:"#H"},E:"<q>1m Y</q><I />1m Y y P t 1h t 1K T 3q. 22. 1L L r 8 3r 1M 3s Z 9 Z r 3t 3u 3v 9 1K. 1N r 1O y P t 3w 3x 3y."},{u:4,z:\'1n 1o\',w:[42.3z,-C.3A],v:{x:"#G",D:"#H"},E:"<q>1n 1o</q><I />O r 1n 1o y r 1d 9 P t K 3B 1P T 8 3C B 1H. O r a p 3D 1Q y 1P 9 8 1Q y 1h 9 U 1G. 1N W r 8 p 3E 3F 9 r 8 1D 1E."},{u:5,z:\'10 11\',w:[42.3G,-C.3H],v:{x:"#G",D:"#H"},E:"<q>10 11</q><I />O 1k 8 3I B 3J 9 3K 1p U 10 11 9 M 1b 1R 1S 1T t 3L 1C. Q 1U 1M 3M B 3N 1O, 8 L B a p 1I 9 8 3O B a p 3P 3Q. Q 3R 3S t 10 11 M K V t 3T 1R 1S 18 t 1g 31."},{u:6,z:\'1V 1W R\',w:[42.3U,-C.3V],v:{x:"#G",D:"#H"},E:"<q>1V 1W R</q><I />Q 1U y r 1d 9 1f J 3W 1e T 1g 31. 1L L Z 1k 3X 1X 3Y U J 8 p 3Z. Q 1Y 1Z 9 23 9 8 24 23 40 B 8 1l M K V 41 43. 21. Q 1l 44 V t 1J 1i L W, 45 M 46 J 8 47 48."},{u:7,z:\'1q 9 1r 1p\',w:[42.49,-C.4a],v:{x:"#G",D:"#H"},E:"<q>1q 9 1r 1p</q><I />O y 1f J 1e T 4b 1T. 4c L W, 4d M K 4e 4f 1X r 1q 4g 9 24 U 8 1r R 9 4h R 1Y 1Z 4i M K V."}];s o=p 4j;n.4k(X(a){m(a)})});',62,269,'||||||||the|and||||||||||||||||new|strong|on|var|to|id|colors|latLng|primary|is|title||of|84|corner|content|Element|FF6600|FF9900|br|for|be|construction|will|adopt|Construction|expected|The|Hall|comment|by|in|closed|continues|function|Lane|work|Spartan|Village|map|top|||left|text||list|return|span|Cyclotron|schedule|completion|slated|July|open|as|Brody|involves|hall|Farm|Wharton|Center|roads|Birch|Wilson|container|false|if|li|width|styles|5em|margin|click|arguments|2010|second|floor|building|use|September|sidewalk|students|traffic|Current|includes|Work|sidewalks|complete|office|from|May|2009|project|Owen|Graduate|service|loading|dock||||lot|parking|window|addEvent|domready|zoomLevel|center|725925|480314|iconSize|baseIcon|TSN|path|images|markers|marker_c_blue|gif|iconAnchor|locations|initMap|getCoordinates|document|body|setStyles|position|absolute|150|MapIconMaker|createMarkerIcon|height|primaryColor|cornerColor|GMarker|GLatLng|icon|bindInfoWindow|div|200px|html|addOverlay|set|color|background|padding|right|1em|bottom|float|href|item|events|GEvent|trigger|true|grab|else|724341|473019|with|||Offices|first|are|Shaw|front|remain|through|fall|semester|731615|495635|Hally|which|continue|next|two|years|currently|faces|temporary|kitchen|provided|71448|478168|Sept|bridge|masonry|walls|separating|pedestrians|begin|this|week|723694|470658|substantially|end|ticket|gift|shop|716214|497137|rebuilding|Crescent|Middlevale|March|replacement|broken|installation|water|line|southernmost|entrance|motorists|726161|47024|final|moving|equipment|servery|south|until||Aug|remains|but|reopen|school|year|722023|490356|August|As|there|no|bus|Road|Holden|areas|Hash|each'.split('|'),0,{}))	</script> 
	
	<img src="http://www.statenews.com/images/maps/map_header_construction08.gif" alt="Campus Construction" height="70" style="height:70px" />
	<div class="row">
		<div id="map" style="width:450px;height:500px;"></div>
		<div style="font-size:.8em;">
			Source: MSU Construction Alerts and Detours | Produced by State News Online Design &amp; Development
		</div>
		<br /><br />
		<div id="comment-container"><div>
			<ul id="comment-list">
			
			</ul>
			
		</div></div>
		{% include 'gryphon/page/interactive/footer.tpl' %}

	</div>
	<div class="grid_4">
		{% include 'gryphon/main/sidebar-standard.tpl' %}
	</div>
	
	<hr class="spacer" />

{% endblock %}