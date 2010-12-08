{% extends "gryphon/base.tpl" %}

{% block content %}
	
	{% for article in articles %}
		{{ article.headline }}<br />
	{% endfor %}
	
{% endblock content %}