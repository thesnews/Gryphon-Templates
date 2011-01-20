{% extends "gryphon/base.tpl" %}
{% block title %}:: Interactive - 2009 Year in review{% endblock %}

{% block active %}multimedia{% endblock %}
{% block subActive %}Interactives{% endblock %}

{% block content %}

	<div class="grid_8">

		<img src="{{ 'images/timelines/yearreview09.gif'|url }}" alt="Year in review" />
	
		<div class="dipity_embed" style="width:620px"><iframe width="620"
		height="445" src="http://www.dipity.com/skrzypcz/personal/embed_tl?"
		style="border:1px solid #CCC;"></iframe><p
		style="margin:0;font-family:Arial,sans;font-size:13px;text-align:center"><a
		href="http://www.dipity.com/skrzypcz/personal">Meredith S.</a> on <a
		href="http://www.dipity.com/" />Dipity</a>.</p></div>


		{% include 'gryphon/page/interactive/footer.tpl' %}

	</div>
	<div class="grid_4">
		
		{% include 'gryphon/main/sidebar-standard.tpl' %}
		
	</div>
	
	<hr class="spacer" />
	
{% endblock %}