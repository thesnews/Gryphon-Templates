{% helper calendar %}
<div class="box gray">

	{{ calendar.setTime(timestamp) }}
	<table id="calendar" cellspacing="0">
		<tbody>
			<tr class="month">
				<td><a href="{{ 'google:calendar'|url(['time': calendar.previousTime]) }}">&#171;</a></td>
				<td colspan="5">{{ calendar.name }}</td>
				<td><a href="{{ 'google:calendar'|url(['time': calendar.nextTime]) }}">&#187;</a></td>
			</tr>
			<tr class="day">
			{% for day in ['Su', 'M', 'Tu', 'W', 'Th', 'F', 'Sa'] %}
				<th{% if loop.index0 == calendar.now|date('w') %} class="selected"{% endif %}>{{ day }}</th>
			{% endfor %}
			</tr>
			{% for week in calendar.weeks %}
				<tr{% if week.isCurrent() %} class="selected"{% endif %}>
				{% for day in week.days %}
					{% if day.isCurrentMonth() %}
						<td><a href="{{ 'google:calendar'|url(['time':day.time]) }}"{% if day.isCurrent() %} class="selected"{% endif %}>{{ day.date }}</a></td>
					{% else %}
						<td>&nbsp;</td>
					{% endif %}
				{% endfor %}
				</tr>
			{% endfor %}
		</tbody>
	</table>
	

	<h5>Show me:</h5>		
	<ul class="bullet">
		<li><a href="{{ 'google:calendar'|url }}">Most Recent</a></li>
		<li><a href="{{ 'google:calendar'|url(['range':'week']) }}">This Week</a></li>
		<li><a href="{{ 'google:calendar'|url(['range':'month']) }}">This Month</a></li>
	</ul>
	
	<hr class="spacer" />

	<h5>Categories:</h5>
	<ul class="bullet">
		{% fetch calendars from google:calendar with [
			'order': 'title asc'
		] %}
	{% for calendar in calendars %}
		<li><a href="{{ calendar.url }}?time={{ timestamp }}">{{ calendar.name }}</a></li>
	{% endfor %}
	</ul>
</div>