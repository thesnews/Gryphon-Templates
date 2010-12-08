{% extends "gryphon/base.tpl" %}
{% block title %}:: Interactive - Lion King{% endblock %}

{% block active %}multimedia{% endblock %}
{% block subActive %}Interactives{% endblock %}

{% block content %}

	<div class="grid_8">
	
		<script src="/interactive/lion_king/AC_RunActiveContent.js" language="javascript"></script>
	
		<script language="javascript">
			if (AC_FL_RunContent == 0) {
				alert("This page requires AC_RunActiveContent.js.");
			} else {
				AC_FL_RunContent(
					'codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0',
					'width', '640',
					'height', '465',
					'src', '/interactive/lion_king/Lionking-Lipowski',
					'quality', 'high',
					'pluginspage', 'http://www.macromedia.com/go/getflashplayer',
					'align', 'middle',
					'play', 'true',
					'loop', 'true',
					'scale', 'showall',
					'wmode', 'window',
					'devicefont', 'false',
					'id', 'Lionking-Lipowski',
					'bgcolor', '#ffffff',
					'name', 'Lionking-Lipowski',
					'menu', 'true',
					'allowFullScreen', 'false',
					'allowScriptAccess','sameDomain',
					'movie', '/interactive/lion_king/Lionking-Lipowski',
					'salign', ''
					); //end AC code
			}
		</script>
		<noscript>
			<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="640" height="465" id="springbreak-Lipowski" align="middle">
			<param name="allowScriptAccess" value="sameDomain" />
			<param name="allowFullScreen" value="false" />
			<param name="movie" value="/interactive/spring_break09/springbreak-Lipowski.swf" /><param name="quality" value="high" /><param name="bgcolor" value="#ffffff" />	<embed src="/interactive/spring_break09/springbreak-Lipowski.swf" quality="high" bgcolor="#ffffff" width="640" height="465" name="springbreak-Lipowski" align="middle" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
			</object>
		</noscript>
	
		<div><strong>Rollover the image above to learn more</strong></div>
		<div style="font-size:.8em;">Source: The State News&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;Produced by Jessica Lipowski</div>

		{% include 'gryphon/page/interactive/footer.tpl' %}

	</div>
	<div class="grid_4">
		
		{% include 'gryphon/main/sidebar-standard.tpl' %}
		
	</div>
	
	<hr class="spacer" />
	
{% endblock %}