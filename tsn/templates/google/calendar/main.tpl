{% extends "gryphon/base.tpl" %}

{% block title %} :: Event Calendar {% endblock %}
{% block active %}features{% endblock %}

{% block scripts %}
{% endblock %}

{% block styles %}
<link rel="stylesheet" type="text/css" media="screen, projection" href="{{ 'style/gryphon/screen/calendar.css'|url }}" />
{% endblock %}

{% block content %}

<div class="grid_8">
	<img src="{{ 'style/gryphon/images/calendar-header.png'|url }}" />
	<div class="grid_3 alpha">
		{% include 'google/calendar/sidebar.tpl' %}
	</div>
	<div class="grid_5 omega">
		<div id="calendar-results">
			
			{% if events.length %}
			
				<div class="pagination">
					<h4 class="calendar">{% if timestamp %}{{ timestamp|date('m/d/y') }}{% else %}Most Recent Events{% endif %}</h4>
					<span class="calendar">
					{% for page in pagination %}
						{% if page.isCurrent %}
							<strong>{{ page.label }}</strong>
						{% else %}
							<a href="{{ page.url }}">{{ page.label }}</a>
						{% endif %}						
					{% endfor %}
					</span>
				</div>
				<ul class="calendar">
				{% set currentDate = events[0].start_time|date('M dS, l') %}
				<li><h5>{{ currentDate }}</h5>
				{% for event in events %}
				
					{% set thisDate = event.start_time|date('M dS, l') %}
					{% if currentDate != thisDate %}
						{% set currentDate = thisDate %}
						</li>
						<li><h5>{{ thisDate }}</h5>
					{% endif %}
					<div>
						<h3><a href="{{ event.url }}">{{ event.title }}</a></h3>
						<a href="{{ event.urlMap }}"><img src=" http://maps.google.com/maps/api/staticmap?center={{ event.coordinates }}&zoom=12&size=92x92&sensor=false" /></a>
						<em>{% if not event.allDay %}{{ event.start_time|date('g:i a') }}<br/>{% endif %}{{ event.location }}</em> 
						<p>{{ event.abstract }} <a href="{{ event.url }}">More»	</a></p>
						<span>Calendar: <a href="{{ event.calendar.url }}">{{ event.calendar.name }}</a></span>
					</div>	
				{% endfor %}
				</li>
				</ul>
	
				<div class="pagination">
					<span class="calendar">
					{% for page in pagination %}
						{% if page.isCurrent %}
							<strong>{{ page.label }}</strong>
						{% else %}
							<a href="{{ page.url }}">{{ page.label }}</a>
						{% endif %}						
					{% endfor %}
					</span>
				</div>
				
			{% else %}
			
				<h5>Hmmm... no events found for this day and/or category.</h5>
				
				{% fetch next from google:calendarEvent with [
					'where': 'start_time > :ts',
					'limit': 1,
					'order': 'start_time asc',
					'bind': [':ts': timestamp]
				] %}
				
				{% if next %}
					Looks like the next date we have events for is <a href="{{ 'google:calendar'|url(['time':next[0].start_time]) }}">{{ next[0].start_time|date('m/d/Y') }}</a>.
				{% endif %}
			{% endif %}
		</div>
	</div>
	<div class="clear"></div>
	<div id="grid_8 alpha omega">
		<h4>Want to get listed?</h4>
		<p><a href="{{ 'google:calendar/submit'|url }}">Tell is about your event</a> to be listed in the Happenings Event Calendar.</p>
		<hr/>
		<p class="small">Continued use of this service implies acceptance of the <a href="{{ 'google:calendar/tos'|url }}">Terms of Service</a>.</p>
	</div>
</div>

<div class="grid_4">
	{% include "gryphon/main/sidebar-standard.tpl" %}
</div>

<hr class="spacer" />

{% endblock content %}