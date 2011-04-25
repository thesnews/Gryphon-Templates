{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ form.subject }} {% endblock %}
{% block active %}opinion{% endblock %}
{% block subActive %}Opinion{% endblock %}

{% block scripts %}
{% endblock %}

{% block content %}


<div class="grid_8">
	
	<h1>Submit a Letter to the Editor</h1>
	
	<form method="post" action="{{ form.urlSubmitAndReturnTo('section/opinion') }}" enctype="multipart/form-data">
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
				
				<p>Your message has been sent!</p>
			</div>
		{% endif %}
	
		<p>
			Have an opinion? We'd love to hear it.
		</p>
		<p>
			Feel free to send links to articles or media along with your letter. We do ask that you keep your letters at or under 500 words. Please remember that The State News reserves the right to edit your letter for length and/or clarity. Also, all fields are required. 		
		</p>
	
		<label>Your name:</label>
		<input type="text" name="sender_name" value="{{ message.sender_name }}" />

		<label>Your email address:</label>
		<input type="text" name="sender" value="{{ message.sender }}" />

		<label>Subject:</label>
		{{ form.subject }}

		<label>Your message:</label>
		<textarea rows="6" cols="40" name="message">{{ message.message }}</textarea>
		
		<hr />
		
		{% if form.allow_uploads %}
			<label>You can attach an image to your message. It must be smaller than 2MB.</label>
			<input type="file" name="attached" /><br />
			
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