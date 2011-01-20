{% extends "gryphon/base.tpl" %}
{% block title %}:: Interactive Map - Michigan Movies{% endblock %}

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
		
	eval(function(p,a,c,k,e,r){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('4V.4W(\'4X\',1Z(){Y f={\'4Y\':7,\'2y\':[44.4Z,-1F.55],\'56\':[20,20],\'57\':2T.2U()+\'58/59/5a.2V\',\'5b\':[5,15],\'5c\':[]};Y g=5d(f);Y h=g[0];Y i=g[1];Y j=$(\'2z\').5e();Y k=1k 1o(\'2W\',{\'2A\':{\'2X\':\'2Y\',\'1N\':j.1N,\'1O\':j.1O-2Z,\'C\':j.C+2Z,\'I\':j.I,\'3a\':.9,\'z-5f\':10,\'3b\':\'5g(\'+2T.2U()+\'/5h/5i/5j.2V) 5k-5l 2y 2y\'}});$(3c.3d).1v(k);$(3c.3d).1v($(\'1P-3e\'));$(\'1P-3e\').5m({\'2X\':\'2Y\',\'1N\':j.1N,\'1O\':j.1O-5n});Y l=h.2z;Y m=W;Y n=1Z(a){2a(!a.t||!a.y){Y b=1k 1o(\'3f\').1v(1k 1o(\'q\',{\'2B\':a.u}));$(\'1P-2C\').1v(b);2D}Y c=5o.5p({C:30,I:30,5q:a.w.A,5r:a.w.D});C=5s;2a(a.C&&3g(a.C)>1){C=3g(a.C)}Y d=1k 5t(1k 5u(a.y[0],a.y[1]),{5v:c});2a(a.B){d.5w(1k 1o(\'2W\',{\'2A\':{\'C\':C+\'5x\'}}).1v(1k 1o(\'3h\',{\'5y\':a.B})))}l.5z(d);p.5A(a.t,d);Y b=1k 1o(\'3f\').1v(1k 1o(\'3h\',{\'2B\':\'-\',\'2A\':{\'5B\':a.w.A,\'3b\':a.w.A,\'5C\':\'0 .3i\',\'3j-5D\':\'5E\',\'3j-5F\':\'.3i\',\'5G\':\'1O\'}}),1k 1o(\'a\',{\'5H\':\'#\',\'2B\':a.u,\'t\':\'2z-5I-\'+a.t,\'5J\':{\'3k\':1Z(e){5K.5L(p[a.t],\'3k\');2D W}}}));2a(3l[1]&&3l[1]==J){$(\'1P-2C\').5M(b,\'1N\')}5N{$(\'1P-2C\').1v(b)}2D d};Y o=[{t:W,u:\'3m 1j 3n (3o)\'},{t:1,u:\'3p 2b\',y:[45.5O,-1F.5P],w:{A:"#5Q",D:"#5R"},C:G,B:"<q>3m 1j 3n (3o)</q><s />3p 2b<s /><s /><K C=\\"G\\" I=\\"V\\"><r E=\\"Z\\" F=\\"L://M.N.O/v/3q&P=Q&R=1\\"></r><r E=\\"1a\\" F=\\"J\\"></r><r E=\\"S\\" F=\\"T\\"></r><U 1b=\\"L://M.N.O/v/3q&P=Q&R=1\\" 1c=\\"1d/x-1e-1f\\" S=\\"T\\" 1g=\\"J\\" C=\\"G\\" I=\\"V\\"></U></K>"},{t:W,u:\'3r 2c 3s (3t)\'},{t:2,u:\'3u\',y:[42.5S,-H.5T],w:{A:"#5U",D:"#3v"},C:G,B:"<q>3r 2c 3s (3t)</q><s />3u<s /><s /><K C=\\"G\\" I=\\"V\\"><r E=\\"Z\\" F=\\"L://M.N.O/v/3w&P=Q&R=1\\"></r><r E=\\"1a\\" F=\\"J\\"></r><r E=\\"S\\" F=\\"T\\"></r><U 1b=\\"L://M.N.O/v/3w&P=Q&R=1\\" 1c=\\"1d/x-1e-1f\\" S=\\"T\\" 1g=\\"J\\" C=\\"G\\" I=\\"V\\"></U></K>"},{t:W,u:\'2d 2e 2f (2g)\'},{t:3,u:\'X\',y:[42.1Q,-H.2h],w:{A:"#2E",D:"#2F"},C:G,B:"<q>2d 2e 2f (2g)</q><s />X<s /><s /><K C=\\"G\\" I=\\"V\\"><r E=\\"Z\\" F=\\"L://M.N.O/v/3x&P=Q&R=1\\"></r><r E=\\"1a\\" F=\\"J\\"></r><r E=\\"S\\" F=\\"T\\"></r><U 1b=\\"L://M.N.O/v/3x&P=Q&R=1\\" 1c=\\"1d/x-1e-1f\\" S=\\"T\\" 1g=\\"J\\" C=\\"G\\" I=\\"V\\"></U></K>"},{t:4,u:\'1G\',y:[43.2G,-H.2H],w:{A:"#2E",D:"#2F"},B:"<q>2d 2e 2f (2g)</q><s />1G"},{t:5,u:\'3y\',y:[43.5V,-H.5W],w:{A:"#2E",D:"#2F"},B:"<q>2d 2e 2f (2g)</q><s />3y"},{t:W,u:\'2I 2J 2i (2K)\'},{t:6,u:\'3z\',y:[45.5X,-H.5Y],w:{A:"#3A",D:"#3B"},C:G,B:"<q>2I 2J 2i (2K)</q><s />3z<s /><s /><K C=\\"G\\" I=\\"V\\"><r E=\\"Z\\" F=\\"L://M.N.O/v/3C&P=Q&R=1\\"></r><r E=\\"1a\\" F=\\"J\\"></r><r E=\\"S\\" F=\\"T\\"></r><U 1b=\\"L://M.N.O/v/3C&P=Q&R=1\\" 1c=\\"1d/x-1e-1f\\" S=\\"T\\" 1g=\\"J\\" C=\\"G\\" I=\\"V\\"></U></K>"},{t:7,u:\'3D\',y:[46.5Z,-1F.60],w:{A:"#3A",D:"#3B"},B:"<q>2I 2J 2i (2K)</q><s />3D"},{t:W,u:"2L 2M (2N)"},{t:8,u:\'X\',y:[42.1Q,-H.61],w:{A:"#3E",D:"#3F"},B:"<q>2L 2M (2N)</q><s />X"},{t:9,u:\'3G 3H\',y:[42.62,-2O.63],w:{A:"#3E",D:"#3F"},B:"<q>2L 2M (2N)</q><s />3G 3H"},{t:W,u:"2P 2Q 2R (2S)"},{t:10,u:\'3I 3J\',y:[42.64,-1R.65],w:{A:"#3K",D:"#3L"},B:"<q>2P 2Q 2R (2S)</q><s />3I 3J"},{t:11,u:\'3M\',y:[42.66,-1R.67],w:{A:"#3K",D:"#3L"},B:"<q>2P 2Q 2R (2S)</q><s />3M"},{t:W,u:"2j 1j 3N 3O (2k)"},{t:12,u:\'2j\',y:[45.68,-69.6a],w:{A:"#6b",D:"#6c"},B:"<q>2j 1j 3N 3O (2k)</q><s />2j"},{t:W,u:\'3P (2k)\'},{t:13,u:\'X (3Q 3R)\',y:[42.6d,-H.6e],w:{A:"#6f",D:"#6g"},C:1m,B:"<q>3P (2k)</q><s />X (3Q 3R)<s /><s /><K C=\\"1m\\" I=\\"1H\\"><r E=\\"Z\\" F=\\"L://M.N.O/v/3S-3T&P=Q&R=1\\"></r><r E=\\"1a\\" F=\\"J\\"></r><r E=\\"S\\" F=\\"T\\"></r><U 1b=\\"L://M.N.O/v/3S-3T&P=Q&R=1\\" 1c=\\"1d/x-1e-1f\\" S=\\"T\\" 1g=\\"J\\" C=\\"1m\\" I=\\"1H\\"></U></K>"},{t:W,u:\'3U 3V 2i (1h)\'},{t:14,u:\'1I 3W\',y:[43.6h,-1S.6i],w:{A:"#1T",D:"#6j"},C:G,B:"<q>3U 3V (1h)</q><s />1I 3W<s /><s /><K C=\\"G\\" I=\\"V\\"><r E=\\"Z\\" F=\\"L://M.N.O/v/3X&P=Q&R=1\\"></r><r E=\\"1a\\" F=\\"J\\"></r><r E=\\"S\\" F=\\"T\\"></r><U 1b=\\"L://M.N.O/v/3X&P=Q&R=1\\" 1c=\\"1d/x-1e-1f\\" S=\\"T\\" 1g=\\"J\\" C=\\"G\\" I=\\"V\\"></U></K>"},{t:W,u:\'1U 1V 1W (1h)\'},{t:15,u:\'1I 2l\',y:[42.3Y,-1R.3Z],w:{A:"#2m",D:"#2n"},C:G,B:"<q>1U 1V 1W (1h)</q><s />1I 2l<s /><s /><K C=\\"G\\" I=\\"V\\"><r E=\\"Z\\" F=\\"L://M.N.O/v/4a&P=Q&R=1\\"></r><r E=\\"1a\\" F=\\"J\\"></r><r E=\\"S\\" F=\\"T\\"></r><U 1b=\\"L://M.N.O/v/4a&P=Q&R=1\\" 1c=\\"1d/x-1e-1f\\" S=\\"T\\" 1g=\\"J\\" C=\\"G\\" I=\\"V\\"></U></K>"},{t:16,u:\'4b\',y:[42.6k,-1S.6l],w:{A:"#2m",D:"#2n"},B:"<q>1U 1V 1W (1h)</q><s />4b"},{t:17,u:\'4c 4d\',y:[42.6m,-1S.6n],w:{A:"#2m",D:"#2n"},B:"<q>1U 1V 1W (1h)</q><s />4c 4d"},{t:18,u:\'4e\',y:[42.6o,-1S.6p],w:{A:"#2m",D:"#2n"},B:"<q>1U 1V 1W (1h)</q><s />4e"},{t:W,u:\'8 1w (1h)\'},{t:19,u:\'X\',y:[42.1Q,-H.6q],w:{A:"#1x",D:"#1J"},C:1m,B:"<q>8 1w (1h)</q><s />X<s /><s /><K C=\\"1m\\" I=\\"1H\\"><r E=\\"Z\\" F=\\"L://M.N.O/v/4f&P=Q&R=1\\"></r><r E=\\"1a\\" F=\\"J\\"></r><r E=\\"S\\" F=\\"T\\"></r><U 1b=\\"L://M.N.O/v/4f&P=Q&R=1\\" 1c=\\"1d/x-1e-1f\\" S=\\"T\\" 1g=\\"J\\" C=\\"1m\\" I=\\"1H\\"></U></K>"},{t:20,u:\'2o 1p\',y:[42.4g,-H.4h],w:{A:"#1x",D:"#1J"},B:"<q>8 1w (1h)</q><s />2o 1p"},{t:21,u:\'4i\',y:[42.6r,-H.6s],w:{A:"#1x",D:"#1J"},B:"<q>8 1w (1h)</q><s />4i"},{t:22,u:\'4j\',y:[42.6t,-H.6u],w:{A:"#1x",D:"#1J"},B:"<q>8 1w (1h)</q><s />4j"},{t:23,u:\'4k 4l\',y:[42.6v,-H.6w],w:{A:"#1x",D:"#1J"},B:"<q>8 1w (1h)</q><s />4k 4l"},{t:24,u:\'2p\',y:[42.4m,-H.4n],w:{A:"#1x",D:"#1J"},B:"<q>8 1w (1h)</q><s />2p"},{t:W,u:\'4o 4p (1n)\'},{t:54,u:\'2q\',y:[42.4q,-1F.4r],w:{A:"#6x",D:"#6y"},B:"<q>4o 4p (1n)</q><s />2q"},{t:W,u:\'1y 1z 1A (1n)\'},{t:25,u:\'4s 2c\',y:[42.6z,-H.6A],w:{A:"#1K",D:"#1L"},C:G,B:"<q>1y 1z 1A (1n)</q><s />4s 2c<s /><s /><K C=\\"G\\" I=\\"V\\"><r E=\\"Z\\" F=\\"L://M.N.O/v/4t&P=Q&R=1\\"></r><r E=\\"1a\\" F=\\"J\\"></r><r E=\\"S\\" F=\\"T\\"></r><U 1b=\\"L://M.N.O/v/4t&P=Q&R=1\\" 1c=\\"1d/x-1e-1f\\" S=\\"T\\" 1g=\\"J\\" C=\\"G\\" I=\\"V\\"></U></K>"},{t:26,u:\'4u\',y:[43.6B,-H.6C],w:{A:"#1K",D:"#1L"},B:"<q>1y 1z 1A (1n)</q><s />4u"},{t:27,u:\'4v\',y:[42.6D,-H.6E],w:{A:"#1K",D:"#1L"},B:"<q>1y 1z 1A (1n)</q><s />4v"},{t:28,u:\'1G\',y:[43.2G,-H.2H],w:{A:"#1K",D:"#1L"},B:"<q>1y 1z 1A (1n)</q><s />1G"},{t:29,u:\'4w\',y:[42.6F,-H.6G],w:{A:"#1K",D:"#1L"},B:"<q>1y 1z 1A (1n)</q><s />4w"},{t:30,u:\'4x\',y:[44.6H,-H.6I],w:{A:"#1K",D:"#1L"},B:"<q>1y 1z 1A (1n)</q><s />4x"},{t:W,u:\'4y 2b (4z)\'},{t:31,u:\'X\',y:[42.6J,-H.2h],w:{A:"#6K",D:"#6L"},C:G,B:"<q>4y 2b (4z)</q><s />X<s /><s /><K C=\\"G\\" I=\\"V\\"><r E=\\"Z\\" F=\\"L://M.N.O/v/4A&P=Q&R=1\\"></r><r E=\\"1a\\" F=\\"J\\"></r><r E=\\"S\\" F=\\"T\\"></r><U 1b=\\"L://M.N.O/v/4A&P=Q&R=1\\" 1c=\\"1d/x-1e-1f\\" S=\\"T\\" 1g=\\"J\\" C=\\"G\\" I=\\"V\\"></U></K>"},{t:W,u:\'4B 4C (2r)\'},{t:32,u:\'X\',y:[42.1Q,-H.6M],w:{A:"#6N",D:"#6O"},C:G,B:"<q>4B 4C (2r)</q><s />X<s /><s /><K C=\\"G\\" I=\\"V\\"><r E=\\"Z\\" F=\\"L://M.N.O/v/4D&P=Q&R=1\\"></r><r E=\\"1a\\" F=\\"J\\"></r><r E=\\"S\\" F=\\"T\\"></r><U 1b=\\"L://M.N.O/v/4D&P=Q&R=1\\" 1c=\\"1d/x-1e-1f\\" S=\\"T\\" 1g=\\"J\\" C=\\"G\\" I=\\"V\\"></U></K>"},{t:W,u:\'4E (2r)\'},{t:33,u:\'X\',y:[42.6P,-H.2h],w:{A:"#6Q",D:"#6R"},C:G,B:"<q>4E (2r)</q><s />X<s /><s /><K C=\\"G\\" I=\\"V\\"><r E=\\"Z\\" F=\\"L://M.N.O/v/4F&P=Q&R=1\\"></r><r E=\\"1a\\" F=\\"J\\"></r><r E=\\"S\\" F=\\"T\\"></r><U 1b=\\"L://M.N.O/v/4F&P=Q&R=1\\" 1c=\\"1d/x-1e-1f\\" S=\\"T\\" 1g=\\"J\\" C=\\"G\\" I=\\"V\\"></U></K>"},{t:W,u:\'4G (2s)\'},{t:34,u:\'1l 1M\',y:[42.6S,-H.6T],w:{A:"#3v",D:"#6U"},C:G,B:"<q>4G (2s)</q><s />1l 1M<s /><s /><K C=\\"G\\" I=\\"V\\"><r E=\\"Z\\" F=\\"L://M.N.O/v/4H&P=Q&R=1\\"></r><r E=\\"1a\\" F=\\"J\\"></r><r E=\\"S\\" F=\\"T\\"></r><U 1b=\\"L://M.N.O/v/4H&P=Q&R=1\\" 1c=\\"1d/x-1e-1f\\" S=\\"T\\" 1g=\\"J\\" C=\\"G\\" I=\\"V\\"></U></K>"},{t:W,u:\'4I 4J (2s)\'},{t:35,u:\'1G\',y:[43.2G,-H.2H],w:{A:"#6V",D:"#1x"},C:G,B:"<q>4I 4J (2s)</q><s />1G<s /><s /><K C=\\"G\\" I=\\"V\\"><r E=\\"Z\\" F=\\"L://M.N.O/v/4K&P=Q&R=1\\"></r><r E=\\"1a\\" F=\\"J\\"></r><r E=\\"S\\" F=\\"T\\"></r><U 1b=\\"L://M.N.O/v/4K&P=Q&R=1\\" 1c=\\"1d/x-1e-1f\\" S=\\"T\\" 1g=\\"J\\" C=\\"G\\" I=\\"V\\"></U></K>"},{t:W,u:\'1q 1r (1s)\'},{t:36,u:\'X\',y:[42.1Q,-H.6W],w:{A:"#1B",D:"#1C"},C:1m,B:"<q>1q 1r (1s)</q><s />X<s /><s /><K C=\\"1m\\" I=\\"1H\\"><r E=\\"Z\\" F=\\"L://M.N.O/v/4L&P=Q&R=1\\"></r><r E=\\"1a\\" F=\\"J\\"></r><r E=\\"S\\" F=\\"T\\"></r><U 1b=\\"L://M.N.O/v/4L&P=Q&R=1\\" 1c=\\"1d/x-1e-1f\\" S=\\"T\\" 1g=\\"J\\" C=\\"1m\\" I=\\"1H\\"></U></K>"},{t:37,u:\'1I 2l\',y:[42.3Y,-1R.3Z],w:{A:"#1B",D:"#1C"},B:"<q>1q 1r (1s)</q><s />1I 2l"},{t:38,u:\'2t 2u\',y:[42.6X,-2O.6Y],w:{A:"#1B",D:"#1C"},B:"<q>1q 1r (1s)</q><s />2t 2u"},{t:39,u:\'2t 2u 1p\',y:[42.6Z,-2O.70],w:{A:"#1B",D:"#1C"},B:"<q>1q 1r (1s)</q><s />2t 2u 1p"},{t:40,u:\'2o 1p\',y:[42.4g,-H.4h],w:{A:"#1B",D:"#1C"},B:"<q>1q 1r (1s)</q><s />2o 1p"},{t:41,u:\'2v 2w\',y:[42.4M,-H.4N],w:{A:"#1B",D:"#1C"},B:"<q>1q 1r (1s)</q><s />2v 2w"},{t:42,u:\'2p\',y:[42.4m,-H.4n],w:{A:"#1B",D:"#1C"},B:"<q>1q 1r (1s)</q><s />2p"},{t:W,u:"1t 1j 1u (1i)"},{t:43,u:\'1l 1M\',y:[42.4O,-H.71],w:{A:"#1D",D:"#1E"},B:"<q>1t 1j 1u (1i)</q><s />1l 1M"},{t:44,u:\'X\',y:[42.72,-H.2h],w:{A:"#1D",D:"#1E"},B:"<q>1t 1j 1u (1i)</q><s />X"},{t:45,u:\'4P\',y:[42.73,-H.74],w:{A:"#1D",D:"#1E"},B:"<q>1t 1j 1u (1i)</q><s />4P"},{t:46,u:\'4Q\',y:[44.75,-1S.76],w:{A:"#1D",D:"#1E"},B:"<q>1t 1j 1u (1i)</q><s />4Q"},{t:47,u:\'4R 1p\',y:[42.77,-H.78],w:{A:"#1D",D:"#1E"},B:"<q>1t 1j 1u (1i)</q><s />4R 1p"},{t:48,u:\'4S 79\',y:[44.7a,-1R.7b],w:{A:"#1D",D:"#1E"},B:"<q>1t 1j 1u (1i)</q><s />4S 7c"},{t:49,u:\'2v 2w\',y:[42.4M,-H.4N],w:{A:"#1D",D:"#1E"},B:"<q>1t 1j 1u (1i)</q><s />2v 2w"},{t:W,u:"1X 1l 1Y (1i)"},{t:50,u:\'1l 1M\',y:[42.4O,-H.7d],w:{A:"#1T",D:"#2x"},B:"<q>1X 1l 1Y (1i)</q><s />1l 1M"},{t:51,u:\'4T\',y:[42.7e,-1F.7f],w:{A:"#1T",D:"#2x"},B:"<q>1X 1l 1Y (1i)</q><s />4T"},{t:52,u:\'4U\',y:[42.7g,-H.7h],w:{A:"#1T",D:"#2x"},B:"<q>1X 1l 1Y (1i)</q><s />4U"},{t:53,u:\'2q\',y:[42.4q,-1F.4r],w:{A:"#1T",D:"#2x"},B:"<q>1X 1l 1Y (1i)</q><s />2q"}];Y p=1k 7i;o.7j(1Z(a){n(a)});k.7k(\'3a\',0)});',62,455,'||||||||||||||||||||||||||strong|param|br|id|title||colors||latLng||primary|content|width|corner|name|value|320|83|height|true|object|http|www|youtube|com|hl|en|fs|allowscriptaccess|always|embed|265|false|Detroit|var|movie|||||||||||allowFullScreen|src|type|application|shockwave|flash|allowfullscreen|2001|2009|in|new|Ann|480|2002|Element|Park|Gran|Torino|2008|Youth|Revolt|adopt|Mile|CC0000|Bowling|for|Columbine|6666CC|CC99FF|669933|66CC00|84|Flint|295|Grand|FF3333|330066|663399|Arbor|top|left|comment|335707|85|86|996699|Road|to|Perdition|Betty|Waters|function|||||||||||if|Island|Hills|Roger|and|Me|1988|051147|II|Escanaba|2000|Rapids|6600FF|9900FF|Highland|Warren|Jackson|2005|2007|Grosse|Pointe|Royal|Oak|CC99CC|center|map|styles|text|list|return|CC0033|FF0033|02222|694534|Die|Hard|1990|Renaissance|Man|1994|82|Flirting|with|Disaster|1995|TSN|path|gif|div|position|absolute|175|||||||||||opacity|background|document|body|container|li|parseInt|span|5em|margin|click|arguments|Somewhere|Time|1979|Mackinac|FrEhKxYnKGs|Beverly|Cop|1984|Dearborn|006600|XQGi4eB3RZI|xPNmHPjkxdk|Frankenmuth|Alpena|0000CC|0033CC|cpnvi5Jvt1Y|Kincheloe|6699CC|99CCFF|Port|Huron|Battle|Creek|006633|009933|Kalamazoo|da|Moonlight|Hardball|Tiger|Staidum|ae|uDFOXoyM|American|Pie|Haven|_wRxtLKy90A|970994|670013|||||||||||IjbSYkY5hVA|Saugatuck|West|Olive|Zeeland|1uvBr5ubtWo|403369|095865|Southfield|Southgate|Sterling|Heights|506528|028145|Super|Sucker|244531|404869|Auburn|kSn5UEiovxo|Decker|Fenton|Troy|Oscoda|The|2004|q_nQUIOhRdM|Four|Brothers|nLbEGkjmTxg|Transformers|jkNmwrTgWdI|Jumper|2PQi5ueqig4|Semi|Pro|tNGqlzoHrrI|sSqQUWez1aU|499947|146248|277309|Ferndale|Frankfort|Hazel|Lake|Chelsea|Dexter|window|addEvent|domready|zoomLevel|323848||||||759521|iconSize|baseIcon|images|markers|marker_c_blue|iconAnchor|locations|initMap|getCoordinates|index|url|kAssets|image|spinner_new|no|repeat|setStyles|150|MapIconMaker|createMarkerIcon|primaryColor|cornerColor|200|GMarker|GLatLng|icon|bindInfoWindow|px|html|addOverlay|set|color|padding|right|1em|bottom|float|href|item|events|GEvent|trigger|grab|else|844586|616699|0066CC|3399FF|310831|214912|003300|331546|738136|073157|436527|26773|462504|061147|984056|443123|29712|22953|292294|593452|747402|87|091026|333399|666699|332535|0687|FF6600|FF9900|059733|221218|FF66FF|648165|198816|921408|148326|812466|012049|055147|477415|261948|203726|205986|565219|030205|660033|990066|671834|245811|4589|050826|798046|714447|591511|169937|420785|330441|336707|663300|993300|041147|993399|CC0066|334707|0033FF|3366FF|276309|73333|33CC33|990000|05647|391769|913303|378583|928925|73233|335807|46051|134661|636109|234264|461397|097754|Leelanau|98095|715353|Leeanau|74333|314322|020605|3319|878555|Hash|each|setStyle'.split('|'),0,{}))	</script> 
		
		<img src="/images/maps/map_header_mi_movies.gif" alt="Michigan Movies" height="70" />
		<div class="row">
			<div id="map" style="width:450px;height:500px;"></div>
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