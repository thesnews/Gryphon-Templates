{% extends "gryphon/base.tpl" %}
{% block title %}:: Interactive - Moving money{% endblock %}

{% block active %}multimedia{% endblock %}
{% block subActive %}Interactives{% endblock %}

{% block content %}

	<div class="grid_8">

		<script language="javascript">AC_FL_RunContent = 0;</script>
		<script src="{{ 'interactive/abdelkader/AC_RunActiveContent.js'|url }}" language="javascript"></script>
		<script language="javascript">
			if (AC_FL_RunContent == 0) {
				alert("This page requires AC_RunActiveContent.js.");
			} else {
				AC_FL_RunContent(
					'codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0',
					'width', '600',
					'height', '891',
					'src', '{{ 'interactive/tuition080209/tuition080209'|url }}',
					'quality', 'high',
					'pluginspage', 'http://www.macromedia.com/go/getflashplayer',
					'align', 'middle',
					'play', 'true',
					'loop', 'true',
					'scale', 'showall',
					'wmode', 'window',
					'devicefont', 'false',
					'id', 'tuition080209',
					'bgcolor', '#ffffff',
					'name', 'tuition080209',
					'menu', 'true',
					'allowFullScreen', 'false',
					'allowScriptAccess','sameDomain',
					'movie', '{{ 'interactive/tuition080209/tuition080209'|url }}',
					'salign', ''
					); //end AC code
			}
		</script>
		<noscript>
			<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="600" height="891" id="tuition080209" align="middle">
			<param name="allowScriptAccess" value="sameDomain" />
			<param name="allowFullScreen" value="false" />
			<param name="movie" value="{{ 'interactive/tuition080209/tuition080209.swf'|url }}" /><param name="quality" value="high" /><param name="bgcolor" value="#ffffff" />	<embed src="{{ 'interactive/tuition080209/tuition080209.swf'|url }}" quality="high" bgcolor="#ffffff" width="600" height="891" name="tuition080209" align="middle" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
			</object>
		</noscript>

		{% include 'gryphon/page/interactive/footer.tpl' %}

	</div>
	<div class="grid_4">
		
		{% include 'gryphon/main/sidebar-standard.tpl' %}
		
	</div>
	
	<hr class="spacer" />
	
{% endblock %}