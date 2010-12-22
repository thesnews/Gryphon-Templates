{% extends "gryphon/base.tpl" %}

{% block title %} :: Poll Archive {% endblock %}
{% block active %}opinion{% endblock %}

{% block content %}


<div class="grid_8">
	
	<div class="pagination">
		<h1>Poll Archive</h1>
		<span>
		{% for page in pagination %}
			{% if page.isCurrent %}
				<strong>{{ page.label }}</strong>
			{% else %}
				<a href="{{ page.url }}">{{ page.label }}</a>
			{% endif %}
		{% endfor %}
		</span>
	</div>
	
	<ul class="search-results">
	{% for poll in polls %}
		<li><a href="{{ poll.url }}">{{ poll.title }}</a><br />
		{{ poll.question }}</a></li>
	{% endfor %}
	</ul>

	<hr class="spacer" />
	
	<div class="pagination">
		<h1>&nbsp;</h1>
		<span>
		{% for page in pagination %}
			{% if page.isCurrent %}
				<strong>{{ page.label }}</strong>
			{% else %}
				<a href="{{ page.url }}">{{ page.label }}</a>
			{% endif %}
		{% endfor %}
		</span>
	</div>

</div>

<div class="grid_4">
	{% include "gryphon/main/sidebar-standard.tpl" %}
</div>

<hr class="spacer" />

{% endblock content %}