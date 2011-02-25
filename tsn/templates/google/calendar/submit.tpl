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
	<div class="grid_3 alpha">
		{% include 'google/calendar/sidebar.tpl' %}
	</div>
	<div class="grid_5 omega">

		<h2>Submit a new calendar event</h2>
		
		<p>If you have a big list of events you'd like considered or you provide a iCalendar based feed that you'd like us to import, send us an email at <a href="mailto:webmaster@statenews.com">webmaster@statenews.com</a>.</p>

		<p><strong>Please note:</strong> Events are edited by actual humans (crazy, right?) and will not appear immediately. Under normal circumstances, your event will appear within 24 hours. Feel free to <a href="mailto:webmaster@statenews.com">contact us</a> with any questions.</p>

		{% if error %}
			<div class="box error">
				<h3>Oops!</h3>
				
				<ul class="bullet">
				{% for item in error %}
					<li>{{ item }}</li>
				{% endfor %}
				</ul>
			</div>
		{% elseif success %}
			<div class="box success">
				<h3>Thanks!</h3>
				This event will be reviewed for addition to the Event Calendar.
			</div>
		{% endif %}
		
		<hr class="spacer" />

		<form method="post" action="{{ 'google:calendar/submit'|url }}">
	
			<fieldset>
				<label for="title">Event title</label>
				<input type="text" name="title" value="{{ posted.title }}" />
	
				<hr class="spacer" />
	
				<label for="start">What day does it start?</label>
				<input name="start" type="text" size="12" id="input_dateStart" class="DatePicker" value="{{ posted.start }}" />
				<span class="small">mm/dd/yyyy</span>

				<hr class="spacer" />

				<label for="end">What day does it end (if different)?</label>
				<input name="end" type="text" size="12" id="input_dateEnd" class="DatePicker" value="{{ posted.end }}" />
				<span class="small">mm/dd/yyyy</span>
				
				<hr class="spacer" />
	
				<label for="starttime">Does start at a specific time?</label>
				<select name="startHour">
					<option value="false"></option>
					{% for i in 1..12 %}
						<option value="{{ i }}"{% if i == posted.startHour %} selected="selected"{% endif %}>{{ i }}</option>
					{% endfor %}
				</select>
				:
				<select name="startMinute">
					<option value="false"></option>
					<option value="00">00</option>
					<option value="15"{% if posted.startMinute == 15 %} selected="selected"{% endif %}>15</option>
					<option value="30"{% if posted.startMinute == 30 %} selected="selected"{% endif %}>30</option>
					<option value="45"{% if posted.startMinute == 45 %} selected="selected"{% endif %}>45</option>
				</select>
				<select name="startAP">
					<option value="false"></option>
					<option value="a"{% if posted.startAP == 'a' %} selected="selected"{% endif %}>am</option>
					<option value="p"{% if posted.AP == 'p' %} selected="selected"{% endif %}>pm</option>
				</select>

				<hr class="spacer" />

				<label for="endtime">How about the end time?</label>
				<select name="endHour">
					<option value="false"></option>
					{% for i in 1..12 %}
						<option value="{{ i }}">{{ i }}</option>
					{% endfor %}
				</select>
				:
				<select name="endMinute">
					<option value="false"></option>
					<option value="00">00</option>
					<option value="15"{% if posted.endMinute == 15 %} selected="selected"{% endif %}>15</option>
					<option value="30"{% if posted.endMinute == 30 %} selected="selected"{% endif %}>30</option>
					<option value="45"{% if posted.endMinute == 45 %} selected="selected"{% endif %}>45</option>
				</select>
				<select name="endAP">
					<option value="false"></option>
					<option value="a"{% if posted.endAP == 'a' %} selected="selected"{% endif %}>am</option>
					<option value="p"{% if posted.endAP == 'p' %} selected="selected"{% endif %}>pm</option>
				</select>
	
			</fieldset>

			<hr class="spacer" />
			
			<fieldset>

				<label for="description">Tell us about it. Does it repeat? How often?</label>
				<textarea rows="5" cols="20" style="width:95%" name="description">{{ posted.description }}</textarea>
	
				<hr class="spacer" />
				
				<label for="location">Where is it?</label><br />
				<textarea rows="5" cols="20" style="width:95%" name="location">{{ posted.location }}</textarea>
	
			</fieldset>

			<hr class="spacer" />
			
			<fieldset class="box gray">
				<label for="sendername">Your name (required)</label>
				<input type="text" name="sendername" value="{{ posted.sendername }}" />
				<span class="small">will not be published</span>
				
				<hr class="spacer" />
				
				<label for="senderemail">Your email address (required)</label>
				<input type="text" name="senderemail" value="{{ posted.senderemail }}" />
				<span class="small">will not be published</span>
			</fieldset>

			<hr class="spacer" />
	
			<fieldset>
				<script type="text/javascript">
				var RecaptchaOptions = {
					theme : 'white'
				};
				</script>
				{% if turing %}
					{{ turing }}
				{% endif %}
			</fieldset>
	
			<input type="submit" value="Send us your listing" />
		</form>	

	</div>
	<div class="clear"></div>
	<div id="grid_8 alpha omega">
		<hr/>
		<p class="small">Continued use of this service implies acceptance of the Terms of Service.</p>
	</div>
</div>

<div class="grid_4">
	{% include "gryphon/main/sidebar-standard.tpl" %}
</div>

<hr class="spacer" />

{% endblock content %}