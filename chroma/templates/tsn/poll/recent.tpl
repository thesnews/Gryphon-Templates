{% fetch poll from tsn:poll with [
	'where': 'status = 1',
	'order': 'created desc',
	'limit': 1
] %}

<p>{{ poll[0].question }}</p>
{% if poll[0].userHasVoted %}

	<ul>
Thank you for voting!
	</ul>

{% else %}

	<form method="post" action="{{ poll[0].urlSubmit }}">
		<ul>
		{% for id,response in poll[0].answers %}
			<li><input type="radio" name="answer" value="{{ id }}" id="{{ id }}"> <label for="{{ id }}">{{ response }}</label></li>
		{% endfor %}
		</ul>
		<br />
		<input type="submit" value="Submit" />
		
	</form>
{% endif %}

		<p style="text-align:right;"><a href="{{ poll[0].url }}">View results</a> | <a href="{{ 'tsn:poll/archive'|url }}">Poll archive</a></p>