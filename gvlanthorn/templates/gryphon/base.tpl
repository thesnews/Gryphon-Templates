{% import "macros/render.tpl" as render %}
{% helper config %}
{% helper weather %}

{% set title %}{% block title %}{% endblock %}{% endset %}

{% if not active %}
	{% set active %}{% block active %}{% endblock %}{% endset %}
{% endif %}

{% set subActive %}{% block subActive %}{% endblock %}{% endset %}

{% set description %}{% block description %}{% endblock %}{% endset %}

<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<meta name="generator" content="Gryphon {{ config.appVersion }} (Foundry {{ config.foundryVersion }})" />


	<link rel="stylesheet" type="text/css" media="screen, projection" href="{{ 'style/css/master.css'|url }}" />
		
	<link rel="shortcut icon" href="{{ 'favicon.ico'|url }}" />
	
	<link rel="alternate" type="application/rss+xml" title="{{ 'gfn:publication.name'|url }} : Top Stories" href="{{ 'section/pageOne.xml'|url }}" />
		
	<script type="text/javascript" src="{{ 'style/js/vendor/mootools/mootools-1.2-min.js'|url }}"></script>
	<script type="text/javascript" src="{{ 'style/js/rosewood.js'|url }}"></script>
	<script type="text/javascript" src="{{ 'style/js/main.js'|url }}"></script>
 
	<title>Grand Valley Lanthorn</title>

</head>
<body>
			
	{% include 'gryphon/main/header.tpl' %}

	<div id="main" class="container_12">

			
				{# THIS IS THE MAIN CONTENT BLOCK #}
				{% block content %}{% endblock %}
				
	</div><!-- #main -->

	{% include 'gryphon/main/footer.tpl' %}
	
</body>
</html>