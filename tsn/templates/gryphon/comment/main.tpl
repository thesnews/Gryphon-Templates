{% block title %}Comments - Oops{% endblock %}

{% extends "gryphon/base.tpl" %}

{% block content %}
<div class="grid_8">

	<h1>Oops</h1>
	
	<p>There were some errors adding your comment
		<ul>
			{% for error in errors %}
				<li>{{ error }}</li>
			{% endfor %}
		</ul>
	</p>
	
	<h4><a href="{{ returnUrl }}">&#171; Back to where &#039;ye came from</a></h4>
	
	<hr class="spacer" />

	{% if commentItem.shouldAllowComments %}
	
		{% include 'gryphon/comment/form.tpl' %}
	
	{% endif %}

</div>
<div class="grid_4">
	<?php Foundry::import( 'global:sidebar-short' ) ?>
	
</div>
<hr class="spacer" />
{% endblock %}