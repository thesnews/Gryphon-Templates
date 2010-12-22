{% extends "gryphon/base.tpl" %}
{% block title %} :: Verify email address{% endblock %}
{% block content %}

<div class="grid_8">

	<h1>Sweet!</h1>
	
	<h4>Your email address has been verified</h4>
	
	<p>
		We may ask you to verify your address again from time to time. We only use email verification to keep the level of spam down. We'll never send your mail unless you specifically request it (like, from our daily headlines).
	</p>

	{% if comment.moderated == 0 and comment.status == 0 %}
		
		<p>
			Looks like your comment is still in our moderation queue, though. Our editors should take action shortly. Thanks for your patience.
		</p>
	
	{% else %}
		
		<p>
			Your comment is now live. <a href="{{ comment.item.url~'#comments' }}">Go to your comment</a>.
		</p>
		
	{% endif %}
	
</div>
<div class="grid_4">
	{% include 'gryphon/main/sidebar-short.tpl' %}
</div>
<hr class="spacer" />

{% endblock %}