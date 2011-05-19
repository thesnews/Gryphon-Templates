<div id="calendar">
<h3>Upcoming Events</h3>
<ul class="tab-box">

	<li>
		{% set start = 'Today 00:00:00'|toTime %}
		{% set end = '+0 days'|toTime(start) %}
	
		{% for i in start|range(end, 86400) %}
		{% set events = 'google:calendarEvent'|call('findInRange', [i, (i+86400), 3]) %}
		

		<ul>
			<li class="calendar_date">
			<a href="#" class="tab-header">
			<span class="day">{{ "Today"|date("D") }}</span>
			<span class="num">{{ "Today"|date("j") }}</span>
			</a>
			</li>
		</ul>


 		
 		<ul class="bullet">
 		
 			<li>
 			<br /><br /><br /><br />
 			<h3>Events Scheduled for Today:</h3>
 			</li>
 			
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
					{% endfor %}	
		</ul>
		
	</li>


	<li>
		{% set start = 'Tomorrow 00:00:00'|toTime %}
		{% set end = '+0 days'|toTime(start) %}
	
		{% for i in start|range(end, 86400) %}
		{% set events = 'google:calendarEvent'|call('findInRange', [i, (i+86400), 3]) %}
		

		<ul>
			<li class="calendar_date">
			<a href="#" class="tab-header">
			<span class="day">{{ "+1 days"|date("D") }}</span>
			<span class="num">{{ "+1 days"|date("j") }}</span>
			</a>
			</li>
			</ul>


 		
 		<ul class="bullet">
 		
 			<li>
 			<br /><br /><br /><br />
 			<h3>Events Scheduled for Tomorrow:</h3>
 			</li>

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
					{% endfor %}	
		</ul>
		
	</li>

	<li>
		{% set start = '+2 days 00:00:00'|toTime %}
		{% set end = '0 days'|toTime(start) %}
	
		{% for i in start|range(end, 86400) %}
		{% set events = 'google:calendarEvent'|call('findInRange', [i, (i+86400), 3]) %}
		

		<ul>
			<li class="calendar_date">
			<a href="#" class="tab-header">
			<span class="day">{{ "+2 days"|date("D") }}</span>
			<span class="num">{{ "+2 days"|date("j") }}</span>
			</a>
			</li>
			</ul>


 		
 		<ul class="bullet">
 		
 			<li>
 			<br /><br /><br /><br />
 			<h3>Events Scheduled for  {{ i|date('l') }}:</h3>
 			</li>
 			
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
					{% endfor %}	
		</ul>
		
	</li>

	<li>
		{% set start = '+3 days 00:00:00'|toTime %}
		{% set end = '0 days'|toTime(start) %}
	
		{% for i in start|range(end, 86400) %}
		{% set events = 'google:calendarEvent'|call('findInRange', [i, (i+86400), 3]) %}
		

		<ul>
			<li class="calendar_date">
			<a href="#" class="tab-header">
			<span class="day">{{ "+3 days"|date("D") }}</span>
			<span class="num">{{ "+3 days"|date("j") }}</span>
			</a>
			</li>
			</ul>


 		
 		<ul class="bullet">
 		
 			<li>
 			<br /><br /><br /><br />
 			<h3>Events Scheduled for  {{ i|date('l') }}:</h3>
 			</li>
 			
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
					{% endfor %}	
		</ul>
		
	</li>
	
		<li>
		{% set start = '+4 days 00:00:00'|toTime %}
		{% set end = '0 days'|toTime(start) %}
	
		{% for i in start|range(end, 86400) %}
		{% set events = 'google:calendarEvent'|call('findInRange', [i, (i+86400), 3]) %}
		

		<ul>
			<li class="calendar_date">
			<a href="#" class="tab-header">
			<span class="day">{{ "+4 days"|date("D") }}</span>
			<span class="num">{{ "+4 days"|date("j") }}</span>
			</a>
			</li>
			</ul>


 		
 		<ul class="bullet">
 		
 			<li>
 			<br /><br /><br /><br />
 			<h3>Events Scheduled for  {{ i|date('l') }}:</h3>
 			</li>
 			
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
					{% endfor %}	
		</ul>
		
	</li>
	
</ul>

</div>
