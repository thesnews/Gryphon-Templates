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
	<a href="{{ 'google:calendar'|url }}"><img src="{{ 'style/gryphon/images/calendar-header.png'|url }}" style="border:0;" border="0" /></a>
	<div class="clear"></div>

	<table id="calendar-single">
		<tr>
			<td class="type">Event:</td>
			<td><h2>{{ event.title }}</h2></td>
		</tr>
		<tr>
			<td class="type">Date/time:</td>
			{% if event.allDay %}
				<td><h4>{{ event.start_time|date('l, F jS, Y') }}</h4></td>
			{% else %}
				<td><h4>{{ event.start_time|date('l, g:ia, F jS, Y') }}</h4></td>
			{% endif %}
		</tr>
		<tr>
			<td class="type">Location:</td>
			<td><h4>{{ event.location }}</h4></td>
		</tr>
		<tr>
			<td class="type">Categories:</td>
			<td><a href="{{ event.calendar.url }}">{{ event.calendar.title }}</td>
		</tr>
		<tr>
			<td class="type">Detail:</td>
			<td>{{ event.content_formatted }}</td>
		</tr>
		<tr>
			<td class="type maptag">Map:</td>
					<td><img src=' http://maps.google.com/maps/api/staticmap?center={{ event.coordinates }}&markers={{ event.coordinates }}|color:{{ event.category.color }}&zoom=12&size=500x300&sensor=false'/></td>
		</tr>
	</table>
	
		<hr/>
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