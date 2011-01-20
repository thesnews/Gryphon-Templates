{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ page.title }}{% endblock %}

{% block content %}

<div class="grid_8">

	<h1>{{ page.title }}</h1>
	
	<hr class="spacer" />
	
	{{ page.content_formatted }}

</div>

<div class="grid_4">

	{% include 'gryphon/main/sidebar-standard.tpl' %}
	
</div>

{% endblock content %}
