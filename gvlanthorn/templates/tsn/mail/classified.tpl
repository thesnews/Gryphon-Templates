{% extends "gryphon/base.tpl" %}

{% block title %} :: Classified Ad Request {% endblock %}
{% block active %}opinion{% endblock %}
{% block subActive %}Opinion{% endblock %}

{% block scripts %}
{% endblock %}

{% block content %}


<div class="grid_8">
	
	<h1>Classified ad request</h1>
	
	<form method="post" action="{{ form.urlSubmitAndReturnTo('feedback/classified/4') }}" enctype="multipart/form-data">
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
				
				<p>Your ad request has been sent! An avertising account executive should be contacting you shortly.</p>
			</div>
			<br />
		{% endif %}
	
		<p>
			{{ form.instructions }}
		</p>
		
		<br /><br />
		
		<label>Your name:</label>
		<input type="text" name="sender_name" value="{{ message.sender_name }}" />
		
		<br /><br />

		<label>Your email address:</label>
		<input type="text" name="sender" value="{{ message.sender }}" /><br />
		<span class="small">You'll be contacted by an advertising account executive at this address</span>
		
		<br /><br />

		<label>Your ad:</label>
		<textarea rows="6" cols="40" name="message">{{ message.message }}</textarea>
		
		<br /><br />
		
		<input type="submit" value="Send my classified request" /> or <a href="{{ 'pre1:main'|url }}">return to classifieds</a>

	</form>

</div>

<div class="grid_4">
	{% include "gryphon/main/sidebar-short.tpl" %}
</div>

<hr class="spacer" />

{% endblock content %}