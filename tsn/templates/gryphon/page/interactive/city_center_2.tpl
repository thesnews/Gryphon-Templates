{% extends "gryphon/base.tpl" %}
{% block title %}:: Interactive - City Center II{% endblock %}

{% block active %}multimedia{% endblock %}
{% block subActive %}Interactives{% endblock %}

{% block content %}

	<div class="grid_8">
	
		<script src="{{ 'interactive/city_center2/AC_RunActiveContent.js'|url }}" language="javascript"></script>
		<script language="javascript">
			if (AC_FL_RunContent == 0) {
				alert("This page requires AC_RunActiveContent.js.");
			} else {
				AC_FL_RunContent(
					'codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0',
					'width', '600',
					'height', '394',
					'src', '{{ 'interactive/city_center2/city_center_2'|url }}',
					'quality', 'high',
					'pluginspage', 'http://www.macromedia.com/go/getflashplayer',
					'align', 'middle',
					'play', 'true',
					'loop', 'true',
					'scale', 'showall',
					'wmode', 'window',
					'devicefont', 'false',
					'id', 'city_center_2',
					'bgcolor', '#ffffff',
					'name', 'city_center_2',
					'menu', 'true',
					'allowFullScreen', 'false',
					'allowScriptAccess','sameDomain',
					'movie', '{{ 'interactive/city_center2/city_center_2'|url }}',
					'salign', ''
					); //end AC code
			}
		</script>
		<noscript>
			<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="600" height="394" id="city_center_2" align="middle">
			<param name="allowScriptAccess" value="sameDomain" />
			<param name="allowFullScreen" value="false" />
			<param name="movie" value="{{ 'interactive/city_center2/city_center_2.swf'|url }}" /><param name="quality" value="high" /><param name="bgcolor" value="#ffffff" />	<embed src="{{ 'interactive/city_center2/city_center_2.swf'|url }}" quality="high" bgcolor="#ffffff" width="640" height="420" name="city_center_2" align="middle" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
			</object>
		</noscript>
		<div style="font-size:.8em;">Produced by Kate Jacobson, Nichole Hoerner &amp; Andrea Zagata. Renderings courtesy of the City of East Lansing.</div>	

		{% include 'gryphon/page/interactive/footer.tpl' %}

	</div>
	<div class="grid_4">
		
		{% include 'gryphon/main/sidebar-standard.tpl' %}
		
	</div>
	
	<hr class="spacer" />
	
{% endblock %}