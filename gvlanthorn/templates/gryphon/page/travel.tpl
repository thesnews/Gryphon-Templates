{% extends "gryphon/base.tpl" %}
{% block title %}:: Travel{% endblock %}


{% block active %}travel{% endblock %}
{% block subActive %}Travel{% endblock %}

{% block content %}

<div class="grid_8">
	<div id="Partner_API_CampusHwy" partnerid="93453">
	loading content...
	</div>
	<script type="text/javascript" src="http://www.campushwy.com/includes/api.js"></script>
	<div id="CampusHwyBorder">&nbsp;</div>
	<ul id="CampusHwyLinks" style="margin-bottom:10px">
	<li><a href="http://www.campushwy.com" class="campus_grey" target="_blank" title="Spring Break">Spring Break</a></li> |
	<li><a href="http://www.campushwy.com/spring-break-mexico/" target="_blank" class="campus_grey" title="Spring Break Mexico">Spring Break Mexico</a> |</li>
	
	<li><a href="http://www.campushwy.com/spring-break-mexico/spring-break-cancun.htm" target="_blank" class="campus_grey" title="Spring Break Cancun">Spring Break Cancun</a> |</li>
	<li><a href="http://www.campushwy.com/spring-break-mexico/spring-break-acapulco.htm" target="_blank" class="campus_grey" title="Spring Break Acapulco">Spring Break Acapulco</a> |</li>
	<li><a href="http://www.campushwy.com/spring-break-jamaica/" target="_blank" class="campus_grey" title="Spring Break Jamaica">Spring Break Jamaica</a>  </li>
	
	<br/><li><a href="http://www.campushwy.com/spring-break-bahamas/" class="campus_grey" title="Spring Break Bahamas">Spring Break Bahamas</a> |</li>
	<li><a href="http://www.campushwy.com/spring-break-florida/spring-break-panama-city-beach.htm" class="campus_grey" target="_blank" title="Spring Break Panama City">Spring Break Panama City</a> |</li>
	
	<li><a href="http://www.campushwy.com/spring-break-texas/spring-break-south-padre-island.htm" class="campus_grey" title="Spring Break South Padre Island">Spring Break South Padre Island</a></li>
	</ul>
	
</div>

<div class="grid_4">

	{% include 'gryphon/main/side_bar.tpl' %}


</div>

<div class="clear">&nbsp;</div>


{% endblock content %}