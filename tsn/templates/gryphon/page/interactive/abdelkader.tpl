{% extends "gryphon/base.tpl" %}
{% block title %}:: Interactive - Abdelkader{% endblock %}

{% block active %}multimedia{% endblock %}
{% block subActive %}Interactives{% endblock %}

{% block content %}

	<div class="grid_8">

		<h1>Interactive - Justin Abdelkader</h1>
	
		<script language="javascript">AC_FL_RunContent = 0;</script>
		<script src="{{ 'interactive/abdelkader/AC_RunActiveContent.js'|url }}" language="javascript"></script>
		<script language="javascript">
			if (AC_FL_RunContent == 0) {
				alert("This page requires AC_RunActiveContent.js.");
			} else {
				AC_FL_RunContent(
					'codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0',
					'width', '600',
					'height', '375',
					'src', '<?php Foundry::path( "interactive/abdelkader/abdelkader_interactive" ) ?>',
					'quality', 'high',
					'pluginspage', 'http://www.macromedia.com/go/getflashplayer',
					'align', 'middle',
					'play', 'true',
					'loop', 'true',
					'scale', 'showall',
					'wmode', 'window',
					'devicefont', 'false',
					'id', 'abdelkader_interactive',
					'bgcolor', '#ffffff',
					'name', 'abdelkader_interactive',
					'menu', 'true',
					'allowFullScreen', 'false',
					'allowScriptAccess','sameDomain',
					'movie', '{{ 'interactive/abdelkader/abdelkader_interactive'|url }}',
					'salign', ''
					); //end AC code
			}
		</script>
		<noscript>
			<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="600" height="375" id="abdelkader_interactive" align="middle">
			<param name="allowScriptAccess" value="sameDomain" />
			<param name="allowFullScreen" value="false" />
			<param name="movie" value="{{ 'interactive/abdelkader/abdelkader_interactive.swf'|url }}" /><param name="quality" value="high" /><param name="bgcolor" value="#ffffff" />	<embed src="{{ 'interactive/abdelkader/abdelkader_interactive.swf'|url }}" quality="high" bgcolor="#ffffff" width="640" height="400" name="abdelkader_interactive" align="middle" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
			</object>
		</noscript>
		<div style="font-size:.8em;">Produced by Zack Colman, Andrea Zagata &amp; Hailey Schaldach</div>

		{% include 'gryphon/page/interactive/footer.tpl' %}

	</div>
	<div class="grid_4">
		
		{% include 'gryphon/main/sidebar-standard.tpl' %}
		
	</div>
	
	<hr class="spacer" />
	
{% endblock %}