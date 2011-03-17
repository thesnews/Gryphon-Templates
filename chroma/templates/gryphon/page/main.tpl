{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ page.title }}{% endblock %}

{% block content %}

<div class="grid_12">

	<h1>{{ page.title }}</h1>
	

	
	{{ page.content_formatted }}

</div>

{% endblock content %}
