<h5>EVENT CALENDAR <span><a href="{{ 'google:calendar'|url }}">More Events &#187;</a></span></h5>

<ul class="tab-box box gray">
	{% set start = 'Today 00:00:00'|toTime %}
	{% set end = '+3 days'|toTime(start) %}
	
	{% for i in start|range(end, 86400) %}
		{% set events = 'google:calendarEvent'|call('findInRange', [i, (i+86400), 3]) %}

		<li><a href="#" class="tab-header">{{ i|date('D jS') }}</a>
			<ul>
				{% if events.length %}
					{% for event in events %}
						<li>
							<a href="{{ event.url }}">{{ event.title }}</a><br />
							<div class="small">
								{% if event.allday %}
									All day
								{% else %}
									starts at {{ event.start_time|date('g:ia') }}
								{% endif %}
							</div>
						</li>
					{% endfor %}
				{% else %}
					<li>Sorry, no events for this day</li>
				{% endif %}
				<li><a href="{{ 'google:calendar/submit'|url }}">Submit your events &#187;</a></li>
			</ul>
		</li>
	{% endfor %}
</ul>
