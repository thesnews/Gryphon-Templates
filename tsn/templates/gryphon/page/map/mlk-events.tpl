{% extends "gryphon/base.tpl" %}
{% block title %}:: Interactive Map - 2009 Martin Luther King, Jr. Day Events{% endblock %}

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
	<div class="grid_8">
	<script type="text/javascript">
	eval(function(p,a,c,k,e,r){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('2J.1H(\'2K\',1h(){16 a={\'2L\':[{v:1,w:"1I 1d 17. R T q, Z. 1i",x:[42.2M,-y.2N],z:\'A\',B:g h(\'l\',{\'C\':{\'D-F\':\'G, H, I-L\',\'r\':\'M\'}}).t(g h(\'O\',{\'i\':\'1I 1d 17. R T q, Z. 1i\'}),g h(\'n\',{\'i\':\'1j 12, 2O 2P 1k.\'}),g h(\'j\'),g h(\'n\',{\'i\':\'11 a.m. 18\'}),g h(\'j\'),g h(\'j\'),g h(\'l\',{\'P\':\'1l 1m u $25 2Q 2R 1J $1K V a 2S U 2T. 2U 1L W 2V u (1M) 2W-2X 1J W 2Y 2Z. 31 32 1n <a 1o="1p://33.34/35/1N/">1m 1O</a>. 1P 1Q U 17. q\\\'s 36 o 1R, k R T q, Z. 1i X 37 38. 39 J. 3a 13 a 1q 1r o Y 3b\\\'s 3c 3d 3e 3f 13 3g U 3h.\'}))},{v:2,w:"1S 1d 1s 1t 1u",x:[42.3i,-y.3j],z:\'A\',B:g h(\'l\',{\'C\':{\'D-F\':\'G, H, I-L\',\'r\':\'M\'}}).t(g h(\'O\',{\'i\':\'1S 1d 1s 1t 1u\'}),g h(\'n\',{\'i\':\'3k 3l 3m 1v\'}),g h(\'j\'),g h(\'n\',{\'i\':\'4:30 p.m. 18\'}),g h(\'j\'),g h(\'j\'),g h(\'l\',{\'P\':\'3n Q 3o 3p 3q 1w 3r Y 3s, 3t 1L 1n $9.50. 3u 1n 1T Q 3v-3w <a 1o="1p://1U.3x.3y.1x/1N/1y">1O</a>. 3z Y 1V 3A Q 3B 19 3C 3D k 1W, k  1s 1t 1u X 3E 3F o 1V 3G V a 3H 3I 14 1X Q R T q, Z.\'}))},{v:3,w:"1e 1z 1A",x:[42.1Y,-y.1Z],z:\'A\',B:g h(\'l\',{\'C\':{\'D-F\':\'G, H, I-L\',\'r\':\'M\'}}).t(g h(\'O\',{\'i\':\'1e 1z 1A\'}),g h(\'n\',{\'i\':\'3J u k 1B\'}),g h(\'j\'),g h(\'n\',{\'i\':\'3:30 p.m. 18\'}),g h(\'j\'),g h(\'j\'),g h(\'l\',{\'P\':\'3K X 3L 14 k 3M 3N U k 1B o 3O Q k 3P 3Q. 1P 3R U 17. R T q Z.\\\'s 1R o 14 3S U 3T 3U\\\'s 3V, k 1e 1z 1A X 20 3W W 21 3X 21 3Y, U 3Z 17. q 40 a 41.\'}))},{v:4,w:"R T q: 22 23 Q 1C 1f",x:[42.43,-y.44],z:\'A\',B:g h(\'l\',{\'C\':{\'D-F\':\'G, H, I-L\',\'r\':\'M\'}}).t(g h(\'O\',{\'i\':\'R T q: 22 23 Q 1C 1f\'}),g h(\'n\',{\'i\':\'15 1a 1b 24 26, 45 S. 1D 1k.\'}),g h(\'j\'),g h(\'n\',{\'i\':\'27 u 1:1g p.m. 46 W 28 o 47 29 u 3 p.m., 18\'}),g h(\'j\'),g h(\'j\'),g h(\'l\',{\'P\':\'27 u 15 1a 1b 24 26, 28 14 k 1D 48 1v 49 4a 4b 4c 4d\\\'s 29  4e 2a "4f 1C: 4g k 4h U 19." 2b 4i 2a 2c W k 15 1a 1b 1E 4j 4k o 4l.\'}))},{v:5,w:"15 1a 1b\'s 2d 19 1f 2e",x:[42.4m,-y.4n],z:\'A\',B:g h(\'l\',{\'C\':{\'D-F\':\'G, H, I-L\',\'r\':\'M\'}}).t(g h(\'O\',{\'i\':\'15 1a 1b\\\'s 2d 19 1f 2e\'}),g h(\'n\',{\'i\':\'1v 4o, 15 12, 2f S. 1D 1k.\'}),g h(\'j\'),g h(\'n\',{\'i\':\'4p - 4q, 2g 4r\'}),g h(\'j\'),g h(\'j\'),g h(\'l\',{\'P\':\'4s 4t 1y 2c W 2h 4u. 4v 4w 2i 4x 4y Q 4z 4A. 4B 4C 4D, 13 2j 13 4E 4F o 2g, 4G 20 4H u <a 1o="1p://1U.2k.1x/4I/1y/4J.4K">2k.1x</a>.\'}))},{v:6,w:"\\"2l\\" u Y",x:[42.4L,-y.4M],z:\'A\',B:g h(\'l\',{\'C\':{\'D-F\':\'G, H, I-L\',\'r\':\'M\'}}).t(g h(\'O\',{\'i\':\'"2l" u Y\'}),g h(\'n\',{\'i\':\'4N 12 4O 4P\'}),g h(\'j\'),g h(\'n\',{\'i\':\'9:1g p.m., 4Q\'}),g h(\'j\'),g h(\'j\'),g h(\'l\',{\'P\':\'1l 4R 1T. Y\\\'s 1e 2h 4S 4T 4U k 19 1Q 4V o X 4W a $4X 2m 2n 2o V k 4Y-1F 1G, a $2f 2m 4Z V k 51 1F-1G, o a $1K 52 53 12 2n 2o V k 54-1F 1G 13 2j 13 55 V k 56.\'}))},{v:7,w:"2p: 2q, 2r & 2s 2t",x:[42.57,-y.58],z:\'A\',B:g h(\'l\',{\'C\':{\'D-F\':\'G, H, I-L\',\'r\':\'M\'}}).t(g h(\'O\',{\'i\':\'2p: 2q, 2r & 2s 2t\'}),g h(\'n\',{\'i\':\'2u 12\'}),g h(\'j\'),g h(\'n\',{\'i\':\'3 p.m. & 7 p.m. 59\'}),g h(\'j\'),g h(\'j\'),g h(\'l\',{\'P\':\'1l 1m u k 2u 12 5a 5b: (1M) 5c-5d.\'}))},{v:8,w:"1E 2v 2w 1w 1q 1r 2x E. K. 2y",x:[42.1Y,-y.1Z],z:\'A\',B:g h(\'l\',{\'C\':{\'D-F\':\'G, H, I-L\',\'r\':\'M\'}}).t(g h(\'O\',{\'i\':\'1E 2v 2w 1w 1q 1r 2x E. K. 2y\'}),g h(\'n\',{\'i\':\'Y 1B\'}),g h(\'j\'),g h(\'n\',{\'i\':\'9:1g a.m. 18\'}),g h(\'j\'),g h(\'j\'),g h(\'l\',{\'P\':\'2b 5e X 5f 5g 5h 5i W k 5j o 5k.\'}))},{v:9,w:"\\"2z k 2A\\" 2B 2C",x:[42.5l,-y.5m],z:\'A\',B:g h(\'l\',{\'C\':{\'D-F\':\'G, H, I-L\',\'r\':\'M\'}}).t(g h(\'O\',{\'i\':\'"2z k 2A" 2B 2C\'}),g h(\'n\',{\'i\':\'N-5n 5o 5p\'}),g h(\'j\'),g h(\'n\',{\'i\':\'5q 2i 9:1g a.m.- 10 a.m. 5r\'}),g h(\'j\'),g h(\'j\'),g h(\'l\',{\'P\':\'5s X 5t k 1W 5u V 5v 5w 14 1j o 5x 1j 14 1X Q R T q, Z.\'}))}]};16 b=5y(a);16 c=b[0];16 d=b[1];16 f=$(\'2D\').5z();$(5A.5B).t($(\'1c\'));$(\'1c\').5C({\'2E\':f.2E+(f.5D-2F)/2,\'2G\':f.2G+(f.r-2F)/2});$(\'5E\').1H(\'2H\',1h(e){$(\'1c\').2I();5F 5G});5H.5I(c.2D,\'2H\',1h(){5J($(\'1c\')){$(\'1c\').2I()}})});',62,356,'||||||||||||||||new|Element|text|br|the|div||strong|and||King|width||adopt|at|id|name|latLng|84|type|star|infoWindow|styles|font||family|Helvetica|Arial|sans|||serif|250px||h3|html|to|Martin||Luther|of|for|by|will|MSU|Jr|||Center|as|in|Cooley|var|Dr|Monday|MLK|Law|School|intro|annual|Annual|Day|00|function|Luncheon|Lansing|Ave|Tickets|available|are|href|http|keynote|speaker|Community|Celebration|Dinner|Room|with|edu|events|Commemorative|March|Union|Justice|Capitol|Student|place|winner|addEvent|24th|or|200|tickets|517|mlk|online|In|celebration|legacy|6th|required|www|staff|day|tribute|734208|482846|be|Alpha|Equal|Access|Temple||Building|Speech|reception|presentation|is|The|hosted|2009|program|300|times|student|from|well|cooley|Showtyme|VISA|gift|card|Jazz|Spirituals|Prayer|Protest|Concert|Wharton|Leadership|Conference|James|Hildreth|Into|Street|Service|Project|map|top|225|left|click|destroy|window|domready|locations|734027|548078|333|Michigan|per|person|table|eight|Purchase|phone|483|7637|mail|order||Order|forms|lansingmi|gov|mayor|life|feature|Rev|Kenneth|Flowers|men|basketball|coach|Tom|Izzo|master|ceremonies|724207|464779|Akers|Hall|Dining|Free|all|community|members|an|ID|additional|Attendees|pre|register|inclusion|msu|For|unable|attend|celebrations|during|bring|students|together|buffet|dinner|Starts|Participants|meet|main|lobby|march|Beaumont|Tower|honor|acknowledgment|Barack|Obama|election|led|Phi|fraternity|which|was|member||732923|553914|217|followed|cultural|View|Keynote|Speaker|Judge|Joe|Brown|theme|Advancing|Celebrating|Legacy|event|Diversity|Committee|BLSA|731599|553957|911|Tuesday|Thursday|vary|Features|four|organizations|Subjects|range|gay|rights|African|culture|More|complete|descriptions|specific|dates|can|found|newsevents|2009MLKDayProgramofEvents|pdf|726461|480486|International|Food|Court|Saturday|not|talent|show|launches|weekend|include|500|first|giftcard||second|Eastwood|Town|third|prizes|audience|723694|47098|Sunday|Ticket|office|432|2000|conference|focus|on|issues|faced|nation|world|726973|472611|130|Business|Complex|Registration|Wednesday|Students|spend|volunteering|various|agencies|East|initMap|getCoordinates|document|body|setStyles|height|hide_intro|return|false|GEvent|addListener|if'.split('|'),0,{}))
	</script> 
	
	<a href="/section/mlk"><img src="<?php echo __FOUNDRY_WEBPATH__ ?>/images/specials/mlk-09/mlk2009_map_header.gif" alt="2009 MLK Day" border="0" style="border:0;" /></a>
	<div class="row no-border" style="position: relative;top:-1px !important;top:-3px;">
		<div id="map" style="width:450px !important;width:450px;height:620px;"></div>
		<div style="font-size:.8em;">Source: The State News&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;Produced by State News Online Design &amp; Development</div>
		<ul id="list-container"></ul>
	</div>
	<div id="intro">
		<div>
			<h3>What's going on?</h3>
			Would you like to take part in MLK events? Check out the map for a variety of festivities honoring the civil rights leader happening throughout the week.
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