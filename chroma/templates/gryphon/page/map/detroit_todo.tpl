<?php
	Foundry_Registry::set( 'gfn:include.scripts', array(
		'http://maps.google.com/maps?file=api&amp;v=2&amp;key='.
			Foundry_Registry::get( 'gmap:apiKey' ),
		'http://gmaps-utility-library.googlecode.com/svn/trunk/mapiconmaker/1.1/src/mapiconmaker_packed.js',
		Foundry::path( 'javascript/vendor/tsn/tsn.compressed.js' ),
		Foundry::path( 'javascript/map-legacy.js' )
	));
	
	Foundry_Registry::set( 'gfn:include.styles', array(
		Foundry::path( 'style/screen/crimeMap.css' )
	));

	Foundry_Registry::set( 'gfn:template.title', 'Interactive Map - Motown Guide' );
	Foundry_Registry::set( 'gfn:template.activeNav', 'multimedia' );
	Foundry_Registry::set( 'gfn:template.subActiveNav', 'Interactives' );

?>


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
	
eval(function(p,a,c,k,e,r){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('2y.2z(\'2A\',M(){w f={\'2B\':14,\'12\':[42.2C,-F.2D],\'2E\':[20,20],\'2F\':1z.1A()+\'2G/2H/2I.1B\',\'2J\':[5,15],\'2K\':[]};w g=2L(f);w h=g[0];w i=g[1];w j=$(\'1g\').2M();w k=D J(\'1h\',{\'13\':{\'1i\':\'1j\',\'N\':j.N,\'K\':j.K-1C,\'O\':j.O+1C,\'1k\':j.1k,\'P\':.9,\'z-1D\':10,\'1E\':\'2N(\'+1z.1A()+\'/2O/2P/2Q.1B) 2R-2S 12 12\'}});$(1l.1m).L(k);X(1F.1G.2T&&1F.1G.2U<5){1n=j.O}1H{1n=j.O-20}w l=D J(\'1h\',{\'2V\':\'2W\',\'13\':{\'1i\':\'1j\',\'N\':j.N,\'K\':j.K,\'O\':1n,\'1I\':\'2X\',\'Y-2Y\':\'K\',\'2Z\':\'31\',\'z-1D\':10},\'1J\':{\'16\':M(e){1K.17(\'P\',0)}},\'Y\':\'32 U 33 1o 34 U 35 36 37 t.\'});$(1l.1m).L(l);$(1l.1m).L($(\'Z-1L\'));$(\'Z-1L\').38({\'1i\':\'1j\',\'N\':j.N,\'K\':j.K-39});w m=h.1g;w n=11;1p.1M(m,\'16\',M(){X(l.1N(\'P\')==1){l.17(\'P\',0)}});1p.1M(m,\'3a\',M(){X(l.1N(\'P\')==1){l.17(\'P\',0)}});w o=M(a){X(!a.v||!a.B){w b=D J(\'1O\').L(D J(\'u\',{\'Y\':a.x}));$(\'Z-1q\').L(b);1r}w c=3b.3c({O:30,1k:30,3d:a.y.C,3e:a.y.G});w d=D 3f(D 3g(a.B[0],a.B[1]),{3h:c});d.3i(D J(\'1h\',{\'13\':{\'O\':\'3j\'}}).L(D J(\'1P\',{\'3k\':a.H})));m.3l(d);q.3m(a.v,d);w b=D J(\'1O\').L(D J(\'1P\',{\'Y\':\'-\',\'13\':{\'3n\':a.y.C,\'1E\':a.y.C,\'1I\':\'0 .1Q\',\'1R-3o\':\'3p\',\'1R-3q\':\'.1Q\',\'3r\':\'K\'}}),D J(\'a\',{\'3s\':\'#\',\'Y\':a.x,\'v\':\'1g-3t-\'+a.v,\'1J\':{\'16\':M(e){1p.3u(q[a.v],\'16\');1r 11}}}));X(1S[1]&&1S[1]==3v){$(\'Z-1q\').3w(b,\'N\')}1H{$(\'Z-1q\').L(b)}1r d};w p=[{v:11,x:\'3x-1T 3y\'},{v:1,x:\'1s 1t\',B:[42.3z,-F.3A],y:{C:"#1a",G:"#1b"},H:"<u>1s 1t</u><r />3B 1U 3C., t, I V<r /><r />3D 1V Q 1W 1X 1Y 1Z 21 1K 22, 1s 1t 23 3E 3F 3G 3H 24 1u 3I 25 3J 3K. 3L 3M 26 1o 3N U Q 3O."},{v:2,x:\'t 27 S\',B:[42.3P,-F.3Q],y:{C:"#1a",G:"#1b"},H:"<u>t 27 S</u><r />3R 3S R 3T. t, I 3U<r /><r />T 3V 12 23 3W a 28 29 3X 3Y 3Z 40 1V 1u Q 41 28 29 43."},{v:3,x:\'1c S\',B:[42.44,-F.45],y:{C:"#1a",G:"#1b"},H:"<u>1c S</u><r />46 1c 48, t, I, 49<r /><r />4a 4b 4c 1v 1w 1Z 21 4d Q t 4e, 4f 4g 2a Q 1c S 1u 22 4h."},{v:4,x:\'2b S\',B:[42.4i,-F.4j],y:{C:"#1a",G:"#1b"},H:"<u>2b S</u><r />2c 4k 4l. t, I V<r /><r />4m 1v 1w 4n U 4o 4p 1Y 1o 4q 1v 1w 4r 4s."},{v:11,x:\'4t U 2d 1T 4u\'},{v:5,x:\'2e\\\'s 2f\',B:[42.4v,-F.4w],y:{C:"#1d",G:"#1e"},H:"<u>2e\'s 2f</u><r />47 E. 4x, t, I V<r /><r />T 4y 1x 24 4z\'s 1W 1X 4A. T 4B 4C 25 4D 4E 4F 4G 4H."},{v:6,x:\'T t 1f\',B:[42.4I,-F.4J],y:{C:"#1d",G:"#1e"},H:"<u>T t 1f</u><r />4K 1U, @2g, t, I, V<r /><r />4L 19 4M\'s U 2d Q 4N 2h 4O."},{v:7,x:\'T 2i 2j 2k\',B:[42.4P,-F.4Q],y:{C:"#1d",G:"#1e"},H:"<u>T 2i 2j 2k</u><r />4R W. 4S, t, I 4T<r /><r />t 1x 2l 18 4U 2h 4V."},{v:8,x:\'2m 2n 1y 1f\',B:[42.4W,-F.4X],y:{C:"#1d",G:"#1e"},H:"<u>2m 2n 1y 1f</u><r />4Y 4Z, t, I<r /><r />t\'s 2o 50 1y 1x."},{v:11,x:\'51 52\'},{v:9,x:\'2p 2q 2r t 2s\',B:[42.53,-F.54],y:{C:"#2t",G:"#2u"},H:"<u>2p 2q 2r t 2s</u><r />55 2g 56, t, I V<r /><r />2c 2a Q 57\'s 2o 58 59."},{v:10,x:\'2v 2w 2x\',B:[42.5a,-F.5b],y:{C:"#2t",G:"#2u"},H:"<u>2v 2w 2x</u><r />5c 5d 5e 5f, t, I V<r /><r />A 5g t 5h 2l 26, 5i-5j 5k 5l."}];w q=D 5m;p.5n(M(a){o(a)});k.17(\'P\',0)});',62,334,'|||||||||||||||||||||||||||br||Detroit|strong|id|var|title|colors|||latLng|primary|new||83|corner|content|MI|Element|left|adopt|function|top|width|opacity|the||Center|The|to|48226||if|text|comment||false|center|styles|||click|setStyle|||0066CC|3399FF|Renaissance|990000|CC0000|Pub|map|div|position|absolute|height|document|body|messageWidth|and|GEvent|list|return|Ford|Field|all|will|be|bar|Irish|TSN|path|gif|175|index|background|Browser|Engine|else|padding|events|this|container|addListener|getStyle|li|span|5em|margin|arguments|game|Brush|from|Final|Four|games|taking||place|weekend|is|for|teams|free|Science|Star|Trek|of|Cobo|One|watch|Cheli|Chilli|Gratiot|on|Town|Pump|Tavern|with|Old|Shillelagh|most|Hilton|Garden|Inn|Downtown|336600|669933|Courtyard|by|Marriott|window|addEvent|domready|zoomLevel|335707|051147|iconSize|baseIcon|images|markers|marker_c_blue|iconAnchor|locations|initMap|getCoordinates|url|kAssets|image|spinner_new|no|repeat|trident|version|class|message|10px|align|cursor||pointer|What|do|where|go|while|in|setStyles|150|dragstart|MapIconMaker|createMarkerIcon|primaryColor|cornerColor|GMarker|GLatLng|icon|bindInfoWindow|200px|html|addOverlay|set|color|right|1em|bottom|float|href|item|trigger|true|grab|Pre|activities|339427|046974|2000|St|Aside|hosting|individual|team|practices|four|Friday|afternoon|They|are|open|public|358417|061962|5020|John|Street|48202|science|running|exhibition|featuring|replica|ships|different||series|330695|03838|400||Ctr|48243|Free|music|performances|along|Riverfront|just|east|long|327395|048723|Washington|Blvd|Visitors|able|play|basketball|clinics|offered|here|Bars|at|337563|050375|Adams|official|MSU|run|other|three|have|participating|bars|as|well|335691|044302|1326|Features|LCD|action|TV|338261|054302|100|Montcalm|48201|beers|tap|334541|043981|349|Monroe|famous|Lodging|options|335382|045021|351|Avenue|city|luxurious|hotels|330124|041749|333|East|Jefferson|Ave|stylish|hotel|high|speed|internet|access|Hash|each'.split('|'),0,{}))	
	</script> 
	
	<img src="/images/maps/detroit_map_header.gif" alt="Motown Guide" height="70"/>
	<div class="row">
		<div id="map" style="width:455px;height:500px;"></div>
		<div style="font-size:.8em;">
			Source: The State News | Produced by State News Online Design &amp; Development
		</div>
		<br /><br />
		<div id="comment-container"><div>
			<ul id="comment-list">
			
			</ul>
			
		</div></div>
	</div>
</div>
<div class="grid_4">
	<?php Foundry::import( 'global:sidebar-medium' ) ?>
</div>

<hr class="spacer" />