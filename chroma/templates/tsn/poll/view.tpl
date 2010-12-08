{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ poll.title }} {% endblock %}
{% block active %}opinion{% endblock %}

{% block scripts %}
	<script src="{{ 'javascript/vendor/bluff/js-class.js'|url }}" type="text/javascript"></script>
	<script src="{{ 'javascript/vendor/bluff/bluff-min.js'|url }}" type="text/javascript"></script>
{% endblock %}

{% block content %}


<div class="grid_8">
	
	<h2>{{ poll.title }}</h2>
	
	<h4>{{ poll.question }}</h4>
	
	<table class="standard graphable-pie">
		<thead>
			<tr>
				<th>Response</th>
				<th>Percent</th>
			</tr>
		</thead>
		<tbody>
		{% for response in poll.getResponses() %}
			<tr>
				<th>{{ response.answer }}</th>
				<td>{{ response.percent }}%</td>
			</tr>
		{% endfor %}
		</tbody>
	</table>

</div>

<div class="grid_4">
	{% include "gryphon/main/sidebar-short.tpl" %}
</div>

<hr class="spacer" />

{% endblock content %}