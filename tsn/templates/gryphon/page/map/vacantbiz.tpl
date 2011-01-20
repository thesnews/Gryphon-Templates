{% extends "gryphon/base.tpl" %}
{% block title %}:: Interactive Map - Vacant retail space along Grand River Ave.{% endblock %}

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
	eval(function(p,a,c,k,e,r){e=function(c){return(c<62?'':e(parseInt(c/62)))+((c=c%62)>35?String.fromCharCode(c+29):c.toString(36))};if('0'.replace(0,e)==0){while(c--)r[e(c)]=k[c];k=[function(e){return r[e]||e}];e=function(){return'([g-rt-zA-DF-KM-Z]|1\\w)'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('window.17(\'domready\',13(){W c={\'zoomLevel\':15,\'iconSize\':[20,20],\'center\':[o.732427,-p.473298],\'baseIcon\':TSN.path()+\'images/markers/marker_c_blue.gif\',\'iconAnchor\':[5,15],\'locations\':[{t:1,u:"18 E. h i",v:[o.735209,-p.48364],w:\'x\',y:j k(\'l\',{\'z\':{\'A-B\':\'C, D, F-G\',\'q\':\'H\'}}).r(j k(\'l\',{\'I\':\'<m>18 E. h i n.</m><g /><g /><K M="N://O.P.Q/R/J/J/S/27/32770_UNZ_NEW_101-E.-h-i-T.U" V="" /></g /><g />Johnny\\\'s Lunch<g /><g />Y: Nov. 3 2007.<g /> Z: 19 14.\'}))},{t:2,u:"1a E. h i n.",v:[o.1b,-p.481205],w:\'x\',y:j k(\'l\',{\'z\':{\'A-B\':\'C, D, F-G\',\'q\':\'H\'}}).r(j k(\'l\',{\'I\':\'<m>1a E. h i n.</m><g /><g /><K M="N://O.P.Q/R/J/J/S/27/32768_UNZ_NEW_321-E.-h-i-T.U" V="" /><g /><g />Memo\\\'s<g /><g /> Y: Aug. 22 16.<g />Z: January 14.\'}))},{t:3,u:"1c E. h i n.",v:[o.1b,-p.481173],w:\'x\',y:j k(\'l\',{\'z\':{\'A-B\':\'C, D, F-G\',\'q\':\'H\'}}).r(j k(\'l\',{\'I\':\'<m>1c E. h i n.</m><g /><g /><K M="N://O.P.Q/R/J/J/S/27/32766_UNZ_NEW_325-E.-h-i-T.U" V="" /><g /><g />Ameriquest Mortgage Company\'}))},{t:4,u:"1d E. h i n.",v:[o.733577,-p.477611],w:\'x\',y:j k(\'l\',{\'z\':{\'A-B\':\'C, D, F-G\',\'q\':\'H\'}}).r(j k(\'l\',{\'I\':\'<m>1d E. h i n.</m><g /><g />Fast Repair and Game Center.\'}))},{t:5,u:"1e E. h i n.",v:[o.733475,-p.477396],w:\'x\',y:j k(\'l\',{\'z\':{\'A-B\':\'C, D, F-G\',\'q\':\'H\'}}).r(j k(\'l\',{\'I\':\'<m>1e E. h i n.</m><g /><g /><K M="N://O.P.Q/R/J/J/S/27/32765_UNZ_NEW_551-E.-h-i-T.U" V="flats" /><g /><g />Flats Grille.<g /><g />Y: 1998.<g />Z: 19 14.\'}))},{t:6,u:"1f E. h i n.",v:[o.733443,-p.477106],w:\'x\',y:j k(\'l\',{\'z\':{\'A-B\':\'C, D, F-G\',\'q\':\'H\'}}).r(j k(\'l\',{\'I\':\'<m>1f E. h i n.</m><g /><g /><K M="N://O.P.Q/R/J/J/S/27/32767_UNZ_NEW_565-E.-h-i-T.U" V="" /><g /><g />E.L. Moe\\\'s Firehouse 1g<g />Y: July 16.<g />Z: October 16.\'}))},{t:7,u:"1h E. h i n.",v:[o.733191,-p.476066],w:\'x\',y:j k(\'l\',{\'z\':{\'A-B\':\'C, D, F-G\',\'q\':\'H\'}}).r(j k(\'l\',{\'I\':\'<m>1h E. h i n.</m><g /><g />The h Wazoo record shop<g />Albert Place Condominiums showroom\'}))},{t:8,u:"1i E. h i n.",v:[o.733168,-p.476028],w:\'x\',y:j k(\'l\',{\'z\':{\'A-B\':\'C, D, F-G\',\'q\':\'H\'}}).r(j k(\'l\',{\'I\':\'<m>1i E. h i n.</m><g /><g /><K M="N://O.P.Q/R/J/J/S/27/32769_UNZ_NEW_623-E.-h-i-T.U" V="" /><g /><g />Iggy\\\'s\'}))},{t:9,u:"1j E. h i n.",v:[o.731725,-p.470572],w:\'x\',y:j k(\'l\',{\'z\':{\'A-B\':\'C, D, F-G\',\'q\':\'H\'}}).r(j k(\'l\',{\'I\':\'<m>1j E. h i n.</m><g /><g />Jukebox 1g\'}))},{t:10,u:"1k E. h i n.",v:[o.731095,-p.468142],w:\'x\',y:j k(\'l\',{\'z\':{\'A-B\':\'C, D, F-G\',\'q\':\'H\'}}).r(j k(\'l\',{\'I\':\'<m>1k E. h i n.</m><g /><g />Space within the building housing Starbucks.\'}))},{t:11,u:"1l E. h i n.",v:[o.730118,-p.465154],w:\'x\',y:j k(\'l\',{\'z\':{\'A-B\':\'C, D, F-G\',\'q\':\'H\'}}).r(j k(\'l\',{\'I\':\'<m>1l E. h i n.</m><g /><g />Vacancy\'}))},{t:12,u:"1m E. h i n.",v:[o.73011,-p.464564],w:\'x\',y:j k(\'l\',{\'z\':{\'A-B\':\'C, D, F-G\',\'q\':\'H\'}}).r(j k(\'l\',{\'I\':\'<m>1m E. h i n.</m><g /><g />Country Markett grocery store.\'}))}]};W b=initMap(c);W d=b[0];W e=b[1];W a=$(\'1n\').getCoordinates();$(document.body).r($(\'X\'));$(\'X\').setStyles({\'1o\':a.1o+(a.height-1p)/2,\'1q\':a.1q+(a.q-1p)/2});$(\'hide_intro\').17(\'1r\',13(f){$(\'X\').1s();return false});GEvent.addListener(d.1n,\'1r\',13(){if($(\'X\')){$(\'X\').1s()}})});',[],91,'||||||||||||||||br|Grand|River|new|Element|div|strong|Ave|42|84|width|adopt||id|name|latLng|type|c_orange|infoWindow|styles|font|family|Helvetica|Arial||sans|serif|250px|html|00|img||src|http|www|statenews|com|media|03|Ave_small|jpg|alt|var|intro|Opened|Closed||||function|2009||2008|addEvent|101|February|321|734562|325|543|551|565|Grill|619|623|1017|1141|1316|1367|map|top|225|left|click|destroy'.split('|'),0,{}))
	</script> 
	
	<img src="/images/maps/map_header_vacantbiz.gif" alt="Vacant retail space along Grand River Ave." />
	<div class="row" style="position: relative;top:-1px !important;top:-3px;">
		<div id="map" style="width:600px;height:400px;"></div>
		<div style="font-size:.8em;">Source: The State News&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;Produced by State News Online Design &amp; Development</div>
		<br /><br />
		<h3><a href="http://www.statenews.com/index.php/article/2009/03/downtown_businesses_going_bust">&#171; Return to: Downtown businesses going bust</a></h3>
	</div>
	<div id="intro">
		<div>
			<h4>Vacant retail spaces along Grand River Ave.</h4>
	
			The map shows vacant retail spaces along Grand River Avenue.
			<br /><br />
			The businesses listed were once housed in the vacant spaces, but have since closed.
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