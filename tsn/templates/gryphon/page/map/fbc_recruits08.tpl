{% extends "gryphon/base.tpl" %}
{% block title %}:: Interactive Map - New Recruits{% endblock %}

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
			border: 1px solid #ccc;
			border-left: 0;
			margin-left: 160px !important;
			margin-left: 150px;
		}
	
		#list-container {
			background: #f1f1f1;
			border: 1px solid #ccc;
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
		}
	
		#list-container li img {
			padding-right: 10px;
		}
		
		#intro {
			position: absolute;
			width: 225px;
			height: 225px;
			background: #fff;
			border: 1px solid #999;
		}
			#intro div {
				padding: .5em;
				text-align: left;
			}
	</style>
	<div class="grid_8">
		<script type="text/javascript">
		eval(function(p,a,c,k,e,r){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('2Y.1S(\'2Z\',1n(){19 a={\'31\':[{v:1,w:"1T 1U, 1o, 1a",x:[39.32,-1f.33],y:\'z\',A:g h(\'j\',{\'k\':{\'n-B\':\'C, D, E-F\'}}).m(g h(\'G\',{\'i\':\'1T 1U\'}),g h(\'H\',{\'i\':\'1p\'}),g h(\'j\',{\'k\':{\'n-I\':\'J\',\'K-L\':\'M\'}}).m(g h(\'o\',{\'i\':\'6-N, 34 q\'}),g h(\'O\'),g h(\'o\',{\'i\':\'3-P\'})),g h(\'j\',{\'k\':{\'r\':Q},\'i\':\'R 1o S l 1o, X ... T 35 p 1V 1q l W s 1W p V l X U t.u ... 1X 40-1g 1h l 4.56 1i\'}))},{v:2,w:"1Y 1Z, 1r 1s, Y",x:[42.36,-1b.37],y:\'z\',A:g h(\'j\',{\'k\':{\'n-B\':\'C, D, E-F\'}}).m(g h(\'G\',{\'i\':\'1Y 1Z\'}),g h(\'H\',{\'i\':\'20 1c\'}),g h(\'j\',{\'k\':{\'n-I\':\'J\',\'K-L\':\'M\'}}).m(g h(\'o\',{\'i\':\'5-N-10, 38 q\'}),g h(\'O\'),g h(\'o\',{\'i\':\'4-P\'})),g h(\'j\',{\'k\':{\'r\':Q},\'i\':\'R 1r 1s S l 1r 1s, 1j. ... T 1t p 21 1c s 3a p V l W U t.u ... 1X 40-1g 1h l 4.4 1i\'}))},{v:3,w:"22 23, 1u 1v, 3b",x:[41.3c,-3d.3e],y:\'z\',A:g h(\'j\',{\'k\':{\'n-B\':\'C, D, E-F\'}}).m(g h(\'G\',{\'i\':\'22 23\'}),g h(\'H\',{\'i\':\'1k 24\'}),g h(\'j\',{\'k\':{\'n-I\':\'J\',\'K-L\':\'M\'}}).m(g h(\'o\',{\'i\':\'6-N-8, 3f q\'}),g h(\'O\'),g h(\'o\',{\'i\':\'4-P\'})),g h(\'j\',{\'k\':{\'r\':Q},\'i\':\'R 3g 1u 1v 3h S l 1u 1v, 25 ... T 3i p 3j 3k s 26 p 1l 24 l W U t.u ... 1w V l 25 3l 3m t.u ... 3n 30 3o 28 3p\'}))},{v:4,w:"29 2a, 1x 1y, Y",x:[42.3q,-2b.3r],y:\'z\',A:g h(\'j\',{\'k\':{\'n-B\':\'C, D, E-F\'}}).m(g h(\'G\',{\'i\':\'29 2a\'}),g h(\'H\',{\'i\':\'20 1c\'}),g h(\'j\',{\'k\':{\'n-I\':\'J\',\'K-L\':\'M\'}}).m(g h(\'o\',{\'i\':\'5-N-10, 3s q\'}),g h(\'O\'),g h(\'o\',{\'i\':\'4-P\'})),g h(\'j\',{\'k\':{\'r\':Q},\'i\':\'R 1x 1y 2c S l 1x 1y, 1j. ... T 3t p 21 1c l W s 26 p V l Z U t.u ... 3.8 3u 3v 3w\'}))},{v:5,w:"2d 2e, 17, Y",x:[42.1z,-1b.1A],y:\'z\',A:g h(\'j\',{\'k\':{\'n-B\':\'C, D, E-F\'}}).m(g h(\'G\',{\'i\':\'2d 2e\'}),g h(\'H\',{\'i\':\'2f 1c\'}),g h(\'j\',{\'k\':{\'n-I\':\'J\',\'K-L\':\'M\'}}).m(g h(\'o\',{\'i\':\'6-N-2, 3x q\'}),g h(\'O\'),g h(\'o\',{\'i\':\'3-P\'})),g h(\'j\',{\'k\':{\'r\':Q},\'i\':\'R 2g S l 17 ... T 3y p 3z l 2h 3A s 3B p V l Z U t.u ... 3C 3D 3E 1B 3F 1m 3G 1C 1D\'}))},{v:6,w:"2i 2j, 17, Y",x:[42.1z,-1b.1A],y:\'z\',A:g h(\'j\',{\'k\':{\'n-B\':\'C, D, E-F\'}}).m(g h(\'G\',{\'i\':\'2i 2j\'}),g h(\'H\',{\'i\':\'1E 18\'}),g h(\'j\',{\'k\':{\'n-I\':\'J\',\'K-L\':\'M\'}}).m(g h(\'o\',{\'i\':\'6-N-2, 3H q\'}),g h(\'O\'),g h(\'o\',{\'i\':\'3-P\'})),g h(\'j\',{\'k\':{\'r\':Q},\'i\':\'R 3I 3J S l 17 ... T 3K p 1F 18 l W s 3L p V l Z U t.u ... 3M 1m 2k 3N 2l 2m 3O 3P 3Q 1G s Z\'}))},{v:7,w:"2n 2o, 1H 1I, 1a",x:[41.3R,-2p.3S],y:\'z\',A:g h(\'j\',{\'k\':{\'n-B\':\'C, D, E-F\'}}).m(g h(\'G\',{\'i\':\'2n 2o\'}),g h(\'H\',{\'i\':\'2f 1J\'}),g h(\'j\',{\'k\':{\'n-I\':\'J\',\'K-L\':\'M\'}}).m(g h(\'o\',{\'i\':\'6-N-6, 3T q\'}),g h(\'O\'),g h(\'o\',{\'i\':\'3-P\'})),g h(\'j\',{\'k\':{\'r\':Q},\'i\':\'R 1H 1I S l 1H 1I, X ... T 3U 3V 1J l W s 3W 3X V l X U t.u ... 40-1g 1h 2q 2r 4.9 1i\'}))},{v:8,w:"2s 2t, 2u 2v, 3Y",x:[41.3Z,-2b.44],y:\'z\',A:g h(\'j\',{\'k\':{\'n-B\':\'C, D, E-F\'}}).m(g h(\'G\',{\'i\':\'2s 2t\'}),g h(\'H\',{\'i\':\'1p\'}),g h(\'j\',{\'k\':{\'n-I\':\'J\',\'K-L\':\'M\'}}).m(g h(\'o\',{\'i\':\'6-N-1, 45 q\'}),g h(\'O\'),g h(\'o\',{\'i\':\'3-P\'})),g h(\'j\',{\'k\':{\'r\':Q},\'i\':\'R 46 47 S l 2u 2v, 48. ... T 1W p 49 1q l W s 1t p V l 1G U t.u ... 4a-4b 2w 4c\'}))},{v:9,w:"2x 2y, 1K, 1a",x:[40.4d,-2z.4e],y:\'z\',A:g h(\'j\',{\'k\':{\'n-B\':\'C, D, E-F\'}}).m(g h(\'G\',{\'i\':\'2x 2y\'}),g h(\'H\',{\'i\':\'4f 1J\'}),g h(\'j\',{\'k\':{\'n-I\':\'J\',\'K-L\':\'M\'}}).m(g h(\'o\',{\'i\':\'6-N-6, 4g q\'}),g h(\'O\'),g h(\'o\',{\'i\':\'2-P\'})),g h(\'j\',{\'k\':{\'r\':Q},\'i\':\'R 1K S l 1K, X ... T 4h p V l X U t.u ... 1L 3.7 2A\'}))},{v:10,w:"2B 2C, 2D 2E, 1a",x:[40.4i,-2p.4j],y:\'z\',A:g h(\'j\',{\'k\':{\'n-B\':\'C, D, E-F\'}}).m(g h(\'G\',{\'i\':\'2B 2C\'}),g h(\'H\',{\'i\':\'1k 1M\'}),g h(\'j\',{\'k\':{\'n-I\':\'J\',\'K-L\':\'M\'}}).m(g h(\'o\',{\'i\':\'6-N-4, 4k q\'}),g h(\'O\'),g h(\'o\',{\'i\':\'4-P\'})),g h(\'j\',{\'k\':{\'r\':Q},\'i\':\'R 4l S l 2D 2E, X ... T 2F p 1M l W s 4m p V l X U t.u ... 1L 4.0 2A\'}))},{v:11,w:"2G 2H, 1N, Y",x:[43.4n,-1f.4o],y:\'z\',A:g h(\'j\',{\'k\':{\'n-B\':\'C, D, E-F\'}}).m(g h(\'G\',{\'i\':\'2G 2H\'}),g h(\'H\',{\'i\':\'2I\'}),g h(\'j\',{\'k\':{\'n-I\':\'J\',\'K-L\':\'M\'}}).m(g h(\'o\',{\'i\':\'6-N-3, 4p q\'}),g h(\'O\'),g h(\'o\',{\'i\':\'4-P\'})),g h(\'j\',{\'k\':{\'r\':Q},\'i\':\'R 1N S l 1N, 1j. ... T 4q p 4r-4s 4t l W s 2F p V l Z U t.u ... 4u 4v 4w 4x 11 2I 4y\'}))},{v:12,w:"1C 1D, 17, Y",x:[42.1z,-1b.1A],y:\'z\',A:g h(\'j\',{\'k\':{\'n-B\':\'C, D, E-F\'}}).m(g h(\'G\',{\'i\':\'1C 1D\'}),g h(\'H\',{\'i\':\'1p\'}),g h(\'j\',{\'k\':{\'n-I\':\'J\',\'K-L\':\'M\'}}).m(g h(\'o\',{\'i\':\'6-N-2, 4z q\'}),g h(\'O\'),g h(\'o\',{\'i\':\'4-P\'})),g h(\'j\',{\'k\':{\'r\':Q},\'i\':\'R 2g S l 17 ... T 1t p 1V 1q l W s 1O p V l Z U t.u ... 2w 4A 4B 2r 4C q\'}))},{v:13,w:"2J 2K, 1d, Y",x:[42.4D,-1f.4E],y:\'z\',A:g h(\'j\',{\'k\':{\'n-B\':\'C, D, E-F\'}}).m(g h(\'G\',{\'i\':\'2J 2K\'}),g h(\'H\',{\'i\':\'1k 2L\'}),g h(\'j\',{\'k\':{\'n-I\':\'J\',\'K-L\':\'M\'}}).m(g h(\'o\',{\'i\':\'6-N-5, 4F q\'}),g h(\'O\'),g h(\'o\',{\'i\':\'3-P\'})),g h(\'j\',{\'k\':{\'r\':Q},\'i\':\'R 4G S l 1d ... T 4H p 1l 2L l 2h W s 4I p V l Z U t.u ... 4J 1m 2k 2l 2m 4K 1G\'}))},{v:14,w:"2M 2N, 1P, Y",x:[42.4L,-1b.4M],y:\'z\',A:g h(\'j\',{\'k\':{\'n-B\':\'C, D, E-F\'}}).m(g h(\'G\',{\'i\':\'2M 2N\'}),g h(\'H\',{\'i\':\'1E 18\'}),g h(\'j\',{\'k\':{\'n-I\':\'J\',\'K-L\':\'M\'}}).m(g h(\'o\',{\'i\':\'6-N-4, 4N q\'}),g h(\'O\'),g h(\'o\',{\'i\':\'4-P\'})),g h(\'j\',{\'k\':{\'r\':Q},\'i\':\'R 1P S l 1P, 1j. ... T 4O p 1F 18 l W s 4P p V l Z U t.u ... 4Q 27 4R, 4S 4T s 4U 4V 28 4W 4X\'}))},{v:15,w:"2O 1Q, 1R 1d, Y",x:[42.4Y,-1f.4Z],y:\'z\',A:g h(\'j\',{\'k\':{\'n-B\':\'C, D, E-F\'}}).m(g h(\'G\',{\'i\':\'2O 1Q\'}),g h(\'H\',{\'i\':\'1k 2P\'}),g h(\'j\',{\'k\':{\'n-I\':\'J\',\'K-L\':\'M\'}}).m(g h(\'o\',{\'i\':\'6-N-2, 50 q\'}),g h(\'O\'),g h(\'o\',{\'i\':\'4-P\'})),g h(\'j\',{\'k\':{\'r\':Q},\'i\':\'R 1R 1d S l 1R 1d ... T 1O p 1M s 1O "51 52" 1l 2P l W U t.u ... 53 1B 1m 1l 54 55 1Q\'}))},{v:16,w:"2Q 2R, 2S, 1a",x:[39.57,-2z.58],y:\'z\',A:g h(\'j\',{\'k\':{\'n-B\':\'C, D, E-F\'}}).m(g h(\'G\',{\'i\':\'2Q 2R\'}),g h(\'H\',{\'i\':\'1E 18\'}),g h(\'j\',{\'k\':{\'n-I\':\'J\',\'K-L\':\'M\'}}).m(g h(\'o\',{\'i\':\'5-N-11, 59 q\'}),g h(\'O\'),g h(\'o\',{\'i\':\'3-P\'})),g h(\'j\',{\'k\':{\'r\':Q},\'i\':\'R 2c S l 2S, X ... T 5a p 1F 18 l W s 5b p V l X U t.u ... 1L 40-1g 1h 2q 1B 4.4 1i\'}))}],\'5c\':5};19 b=5d(a);19 c=b[0];19 d=b[1];19 f=$(\'2T\').5e();$(5f.5g).m($(\'1e\'));$(\'1e\').5h({\'1w\':f.1w+(f.5i-2U)/2,\'2V\':f.2V+(f.r-2U)/2});$(\'5j\').1S(\'2W\',1n(e){$(\'1e\').2X();5k 5l});5m.5n(c.2T,\'2W\',1n(){5o($(\'1e\')){$(\'1e\').2X()}})});',62,335,'||||||||||||||||new|Element|text|div|styles|in|adopt|font|span|best|pounds|width|and|Rivals|com|id|name|latLng|type|fbc|infoWindow|family|Helvetica|Arial|sans|serif|h3|h4|weight|bold|margin|bottom|1em|foot|br|star|250|Attends|High|ranked|by|player|nation|Ohio|MI|Michigan||||||||Detroit|receiver|var|OH|83|back|Lansing|intro|84|yard|dash|seconds|Mich|Offensive|offensive|MSU|function|Hamilton|Linebacker|linebacker|Oak|Park|fifth|Des|Moines|top|Battle|Creek|329108|044968|of|Chris|Norman|Wide|wide|Indiana|North|Royalton|end|Vermillion|has|center|Midland|third|Ypsilanti|Treadwell|East|addEvent|Denicos|Allen|outside|33rd|runs|Edwin|Baker|Running|running|David|Barrent|tackle|Iowa|ninth||his|Larry|Caper|85|Central|Dana|Dixon|Defensive|Renaissance|the|Bennie|Fowler|over|Big|Ten|Dan|France|81|time|is|TyQuan|Hammock|Fort|Wayne|max|Derek|Hoebing|82|GPA|Nate|Klatt|Canal|Fulton|sixth|Andrew|Maxwell|Quarterback|Micajah|Reynolds|guard|Donald|Spencer|Blake|lineman|Patrick|White|Pickerington|map|225|left|click|destroy|window|domready||locations|399326|560051|210|35th|466272|18161|204||41st|IA|588743|93|620682|290|West|Valley|second|pass|blocker|according|to|scored|on|ACT|29712|22953|215|25th|grade|point|average|171|71st|safety|country|24th|high|school|teammate|fellow|recruit|185|Country|Day|99th|30th|Chose|other|schools|such|as|312629|744804|275|21st|defensive|23rd|overall|IN|082974|||||133743|220|Bishop|Luers|Ind|inside|450|pound|squat|75792|280045|Tight|245|72nd|89457|591425|286|Northwest|17th|626135|2272|192|eighth|pro|style|quarterback|attended|EA|Sports|Elite|Camp|207|bench|press|325|732892|543915|310|Sexton|56th|20th|chose|rival|2411|619089|197|34th|10th|had|receptions|303|yards|four|touchdowns|senior|season|735035|483833|270|most|agile|son|coordinator|Don||886689|771168|172|53rd|28th|zoomLevel|initMap|getCoordinates|document|body|setStyles|height|hide_intro|return|false|GEvent|addListener|if'.split('|'),0,{}))
		</script> 
		<a href="/section/2008_football_recruits"><img src="<?php echo __FOUNDRY_WEBPATH__ ?>/images/fbc_recruits_header.gif" alt="More football coverage" border="0" style="border:0;" /></a>
		<div class="row no-border" style="position: relative;top:-1px !important;top:-3px;">
			<div id="map" style="width:450px !important;width:450px;height:620px;"></div>
			<div style="font-size:.8em;"><!--Source: <a href="http://www.rivals.com">Rivals.com</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;-->Produced by State News Sports Desk and Online Design &amp; Development</div>
			<ul id="list-container"></ul>
		</div>
		<div id="intro">
			<div>
				<h3>The New Recruits</h3>
				
				Scan the map to learn more about the MSU football team's 18 verbal commitments
				<br /><br />
				<a href="#" id="hide_intro">Show me the map! &#187;</a>
			</div>
		</div>
		{% include 'gryphon/page/interactive/footer.tpl' %}

	</div>
	<div class="grid_4">
		{% include 'gryphon/main/sidebar-standard.tpl' %}
	</div>
	
	<hr class="spacer" />

{% endblock %}