{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ form.subject }} {% endblock %}

{% block scripts %}
{% endblock %}

{% block content %}


<div class="grid_8">
	
	<h1>Feedback: {{ form.subject }}</h1>
	
	<form method="post" action="{{ form.urlSubmit }}" enctype="multipart/form-data">
		{# this is required for mail sending to work #}
		<input type="hidden" name="mailkey" value="{{ key }}" />
		
		{% if status == 'error' %}
			<div class="box gray">
				<h3>Oops!</h3>
				
				<p>There appears to have been an error sending your message. Please make sure you've filled the form out completely and try again.</p>
			</div>
		{% elseif status == 'success' %}
			<div class="box gray">
				<h3>Success</h3>
				
				<p>Your message has been added to the outgoing mail queue.</p>
			</div>
		{% endif %}
		
		{% if form.instructions %}
			<p>{{ form.instructions }}</p>
		{% endif %}
		
		<label>Your name:</label>
		<input type="text" name="sender_name" value="{{ message.sender_name }}" />

		<label>To:</label>
		{% if form.receiver %}
			{{ form.receiver }}
		{% else %}
			<input type="text" name="receiver" value="{{ message.receiver }}" />
		{% endif %}

		<label>From:</label>
		{% if form.sender %}
			{{ form.sender }}
		{% else %}
			<input type="text" name="sender" value="{{ message.sender }}" />
		{% endif %}

		<label>Subject:</label>
		{% if form.subject %}
			{{ form.subject }}
		{% else %}
			<input type="text" name="subject" value="{{ message.subject }}" />
		{% endif %}

		<label>Your message:</label>
		<textarea rows="6" cols="40" name="message">{{ message.message }}</textarea>
		
		<hr />
		
		{% if form.allow_uploads %}
			<label>Your can attach a file to your message.</label>
			<input type="file" name="attached" /><br />
			<span class="small">You can attach {{ form.allowed_types|join(', ') }} files.</span>
			
			<hr />
		{% endif %}
		
		<input type="submit" value="Send my message" />

	</form>

</div>

<div class="grid_4">
	{% include "gryphon/main/sidebar-short.tpl" %}
</div>

<hr class="spacer" />

{% endblock content %}