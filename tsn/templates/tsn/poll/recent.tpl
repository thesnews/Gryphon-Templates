{% fetch poll from tsn:poll with [
	'where': 'status = 1',
	'order': 'created desc',
	'limit': 1
] %}
<h5>SN POLLS YOU:</h5>

<p>{{ poll[0].question }}</p>
{% if poll[0].userHasVoted %}

	<ul>
	{% for response in poll[0].responses %}
		<li>{{ response.percent }}%: {{ response.answer }}</li>
	{% endfor %}
	</ul>

	<span class="small"><a href="{{ poll[0].url }}">View results</a> | <a href="{{ 'tsn:poll/archive'|url }}">Poll archive</a></span>

{% else %}

	<form method="post" action="{{ poll[0].urlSubmit }}">
		<ul>
		{% for id,response in poll[0].answers %}
			<li><input type="radio" name="answer" value="{{ id }}" id="{{ id }}"> <label for="{{ id }}">{{ response }}</label></li>
		{% endfor %}
		</ul>
		
		<input type="submit" value="Vote" />
		&nbsp;&nbsp;&nbsp;&nbsp;
		<span class="small"><a href="{{ poll[0].url }}">View results</a> | <a href="{{ 'tsn:poll/archive'|url }}">Poll archive</a></span>
	</form>
{% endif %}
