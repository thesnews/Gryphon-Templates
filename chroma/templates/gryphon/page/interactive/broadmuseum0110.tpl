{% extends "gryphon/base.tpl" %}
{% block title %}:: Interactive - Interactive - Eli and Edythe Broad Art Museum{% endblock %}

{% block active %}multimedia{% endblock %}
{% block subActive %}Interactives{% endblock %}

{% block content %}

	<div class="grid_8">
	
		<h1>Eli and Edythe Broad Art Museum</h1>
	
		<div class="dipity_embed" style="width:600px"><iframe width="600" height="400" src="http://www.dipity.com/statenews/personal/embed_tl?" style="border:1px solid #CCC;"></iframe><p style="margin:0;font-family:Arial,sans;font-size:13px;text-align:center"><a href="http://www.dipity.com/statenews/personal">Ursula Z.</a> on <a href="http://www.dipity.com/" />Dipity</a>.</p></div>
	

		{% include 'gryphon/page/interactive/footer.tpl' %}

	</div>
	<div class="grid_4">
		
		{% include 'gryphon/main/sidebar-standard.tpl' %}
		
	</div>
	
	<hr class="spacer" />
	
{% endblock %}