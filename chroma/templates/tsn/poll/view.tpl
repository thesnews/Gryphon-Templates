{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ poll.title }} {% endblock %}
{% block active %}opinion{% endblock %}

{% block scripts %}
	<script src="{{ 'javascript/vendor/bluff/js-class.js'|url }}" type="text/javascript"></script>
	<script src="{{ 'javascript/vendor/bluff/bluff-min.js'|url }}" type="text/javascript"></script>
{% endblock %}

{% block content %}

<div class="grid_12">

<div class="grid_8 alpha">
	
	<h1>{{ poll.title }}</h1>
	
	<br />
	
	<h3>{{ poll.question }}</h3>
	
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

<div class="grid_4 omega">
		<img src="{{ 'style_chroma/images/ads/square.png'|url }}" alt="advertisement" />
</div>

</div>

{% endblock content %}