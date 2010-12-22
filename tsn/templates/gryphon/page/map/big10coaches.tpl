{% extends "gryphon/base.tpl" %}
{% block title %}:: Interactive Map - Big 10 Coaches{% endblock %}

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
		<script type="text/javascript">
		eval(function(p,a,c,k,e,r){e=function(c){return(c<62?'':e(parseInt(c/62)))+((c=c%62)>35?String.fromCharCode(c+29):c.toString(36))};if('0'.replace(0,e)==0){while(c--)r[e(c)]=k[c];k=[function(e){return r[e]||e}];e=function(){return'[g-zA-C]'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('window.r(\'domready\',p(){m c={\'zoomLevel\':5,\'center\':[s.830686,-t.887924],\'infoWindowURL\':\'/interactive/coach_chart/index.php\',\'infoWindowType\':\'iframe\',\'infoWindowWidth\':425,\'autoHide\':true,\'iconSize\':[20,20],\'baseIcon\':TSN.path()+\'images/markers/marker_c_blue.gif\',\'iconAnchor\':[5,15],\'locations\':[{g:1,h:"MSU",i:[q.735350,-t.489498],j:\'k\',l:\'msu\'},{g:2,h:"Northwestern",i:[q.056558,-87.675233],j:\'k\',l:\'northwestern\'},{g:3,h:"Purdue",i:[o.431645,-u.914043],j:\'k\',l:\'purdue\'},{g:4,h:"Illinois",i:[o.109604,-88.22485],j:\'k\',l:\'illinois\'},{g:5,h:"Iowa",i:[41.662461,-91.547012],j:\'k\',l:\'iowa\'},{g:6,h:"Indiana",i:[s.166612,-u.524383],j:\'k\',l:\'indiana\'},{g:7,h:"Wisconsin",i:[43.075902,-89.411309],j:\'k\',l:\'wisconsin\'},{g:8,h:"Michigan",i:[q.277515,-v.738158],j:\'k\',l:\'michigan\'},{g:9,h:"Penn w",i:[o.803155,-77.859936],j:\'k\',l:\'pennstate\'},{g:10,h:"Ohio w",i:[o.008338,-v.026621],j:\'k\',l:\'ohiostate\'},{g:11,h:"Minnesota",i:[44.975485,-93.233038],j:\'k\',l:\'minnesota\'}]};m b=initMap(c);m d=b[0];m e=b[1];m a=$(\'x\').getCoordinates();$$(document.body).adopt($(\'n\'));$(\'n\').setStyles({\'y\':a.y+(a.height-z)/2,\'A\':a.A+(a.width-z)/2});$(\'hide_intro\').r(\'B\',p(f){$(\'n\').C();return false});GEvent.addListener(d.x,\'B\',p(){if($(\'n\')){$(\'n\').C()}})});',[],39,'||||||||||||||||id|name|latLng|type|16_c_790000|tpl|var|intro|40|function|42|addEvent|39|84|86|83|State|map|top|225|left|click|destroy'.split('|'),0,{}))
		</script> 
		
		<img src="/interactive/coach_chart/big10_coach_map_header.gif" alt="Black coaches in the Big Ten" />
		<div class="row" style="position: relative;top:-1px !important;top:-3px;">
			<div id="map" style="width:600px;height:700px;"></div>
			<div style="font-size:.8em;">Source: The State News&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;Produced by State News Online Design &amp; Development</div>
			<br /><br />
			<h3><a href="http://www.statenews.com/index.php/article/2009/02/above_the_racial_curve">&#171; Return to: Above the racial curve</a></h3>
		</div>
		
		<div id="intro">
			<div>
				<h4>Black coaches in the Big Ten</h4>
		
				The following map outlines the number of black coaches at each of the Big Ten universities, including the sports they coach and the makeup of the universities' coaching staffs. Click on each university to see a bar graph representation of coaching staff statistics.
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