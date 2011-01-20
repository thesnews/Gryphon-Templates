{% extends "gryphon/base.tpl" %}
{% block title %}:: Interactive - Africa study abroad{% endblock %}

{% block active %}multimedia{% endblock %}
{% block subActive %}Interactives{% endblock %}

{% block content %}

	<div class="grid_8">
		
		<h1>Africa study abroad</h1>
	
		<script language="javascript">AC_FL_RunContent = 0;</script>
		<script src="{{ 'interactive/africa_interactive/AC_RunActiveContent.js'|url }}" language="javascript"></script>
	
		<script language="javascript">
			if (AC_FL_RunContent == 0) {
				alert("This page requires AC_RunActiveContent.js.");
			} else {
				AC_FL_RunContent(
					'codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0',
					'width', '600',
					'height', '435',
					'src', '{{ 'interactive/africa_interactive/africa_interactive'|url }}',
					'quality', 'high',
					'pluginspage', 'http://www.macromedia.com/go/getflashplayer',
					'align', 'middle',
					'play', 'true',
					'loop', 'true',
					'scale', 'showall',
					'wmode', 'window',
					'devicefont', 'false',
					'id', 'africa_interactive',
					'bgcolor', '#ffffff',
					'name', 'africa_interactive',
					'menu', 'true',
					'allowFullScreen', 'false',
					'allowScriptAccess','sameDomain',
					'movie', '{{ 'interactive/africa_interactive/africa_interactive'|url }}',
					'salign', ''
					); //end AC code
			}
		</script>
		<noscript>
			<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="600" height="435" id="africa_interactive" align="middle">
			<param name="allowScriptAccess" value="sameDomain" />
			<param name="allowFullScreen" value="false" />
			<param name="movie" value="{{ 'interactive/africa_interactive/africa_interactive.swf'|url }}" /><param name="quality" value="high" /><param name="bgcolor" value="#ffffff" />	<embed src="{{ 'interactive/africa_interactive/africa_interactive.swf'|url }}" quality="high" bgcolor="#ffffff" width="640" height="465" name="springbreak-Lipowski" align="middle" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
			</object>
		</noscript>
	
	
		<div style="font-size:.8em;">Source: The State News&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;Produced by Kayla Habermehl, Ken Hansen &amp; Andrea Zagata</div>
		
		{% include 'gryphon/page/interactive/footer.tpl' %}
		
	</div>
	<div class="grid_4">
		
		{% include 'gryphon/main/sidebar-standard.tpl' %}
		
	</div>
	
	<hr class="spacer" />
	
{% endblock %}
