{% extends "gryphon/base.tpl" %}
{% block title %}Verify email address{% endblock %}
{% block content %}

<div class="grid_8">
	
	{% if flagged %}
		<h2>Thanks for your help</h2>
		
		<p>
			Our editors have been notified of this comment. We appreciate your feedback in keeping our comments relevant and spam free.
		</p>
		
		<h3>Go back to <a href="{{ comment.item.getURL() }}">{{ comment.item.getTitle() }}</a></h3>
		
	{% else %}
		
		<h2>Flag comment for moderation</h2>
		
		{% if error %}
			<div class="box error">
				<h5>Oops!</h5>
				{{ error }}
			</div>
			<hr class="spacer" />
		{% endif %}
		
		You're flagging the following comment:
		<hr class="spacer" />		
		<div class="box gray">
			{{ comment.comment_formatted }}
			<hr />
			Posted by {{ comment.name }} {{ comment.created|timeSince }}.
		</div>
		
		<hr class="spacer" />
	
		<form method="post" action="{{ ('gryphon:comment/flag/'~comment.hash)|url }}">
			<input type="hidden" name="flag" value="1" />
			
			<input type="checkbox" name="spam" value="1" id="input_spam" /> <label for="input_spam" style="display:inline;">This comment is spam</label>
			
			<hr class="spacer" />
		
			<label for="input_description">Is there anything you want to let the 
	editor know about this comment?</label>
			<textarea rows="5" cols="40" name="description" id="input_description" style="width:98%">{{ note }}</textarea>
		
			
			{% if turing %}
				<hr class="spacer" />
				<strong>We need to verify that you are, in fact, human.</strong>
			
				{{ turing }}
			
			{% endif %}
		
			<hr class="spacer" />
			
			<input type="submit" value="Flag this comment" />
			&nbsp;&nbsp;&nbsp;&nbsp;
			Return to: <a href="{{ comment.item.getURL() }}">{{ comment.item.getTitle() }}</a>
		</form>
	{% endif %}
</div>
<div class="grid_4">
	{% include 'gryphon/main/sidebar-short.tpl' %}
</div>
<hr class="spacer" />

{% endblock %}