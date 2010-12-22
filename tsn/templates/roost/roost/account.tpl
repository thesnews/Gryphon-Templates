{% extends 'gryphon/base.tpl' %}

{% block title %} :: Housing Guide{% endblock %}
{% block active %}{% endblock %}
{% block subActive %}Housing Guide{% endblock %}

{% block styles %}
	<link rel="stylesheet" type="text/css" media="screen" href="{{ 'roost/frontend/style/screen/master.css'|url }}" />
{% endblock %}

{% block content %}
	{% helper adpilotHelper as ads %}
	
	<div class="grid_8">
	
		<div id="housing_finder_header">
			<a href="{{ 'roost:roost'|url }}"><img src="{{ 'roost/frontend/style/images/housing-header.gif'|url }}" alt="SN Housing Guide" style="border:0;" border="0" /></a>
			<div id="housing_sponsor">{{ ads.display('housingsponsor') }}</div>
		</div>
	
	
		<h1>Create a new account</h1>
		
		<p>
			Already have an account? Login at <a href="http://statenews.com/roost">statenews.com/roost</a>.
		</p>
		<p>
			New accounts may be subject to review by our staff. If you have any questions about your account status, please do not hesitate to <a href="http://advertise.statenews.com/index.php/contact">contact us</a>.
		</p>
	
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
				<h3>Your account request has been created</h3>
				
				All new Housing Guide accounts are subject to our mandatory review process. Your account should be active shortly at
				<a href="{{ 'roost'|url }}">{{ 'roost'|qualifiedUrl }}</a>.
			</div>
		{% endif %}
	
		<hr class="spacer" />
		<form method="post" action="{{ 'roost:roost/account'|url }}">
		
		<img src="{{ 'roost/style/images/bullet_red.png'|url }}" /> = Required Field
		<fieldset>
			<div class="grid_4 alpha">
				<label for="input_name"><img src="{{ 'roost/style/images/bullet_red.png'|url }}" /> Your name:</label>
				<input type="text" name="name" id="input_name" value="{{ posted.name }}" style="width:100%;" />
			</div>
			<div class="grid_4 omega">
				<label for="input_email"><img src="{{ 'roost/style/images/bullet_red.png'|url }}" /> Email address:</label>
				<input type="text" name="email" id="input_email" value="{{ posted.email }}" style="width:100%;" />
			</div>
			<hr class="spacer" />
			<div class="grid_4 alpha">
				<label for="input_pass1"><img src="{{ 'roost/style/images/bullet_red.png'|url }}" /> Password:</label>
				<input type="password" name="pass1" id="input_pass1" style="width:100%;" />
			</div>
			<div class="grid_4 omega">
				<label for="input_pass2"><img src="{{ 'roost/style/images/bullet_red.png'|url }}" /> Re-type password:</label>
				<input type="password" name="pass2" id="input_pass2" style="width:100%;" />
			</div>
			<hr class="spacer" />
			
			<label for="input_company">Do you work for a rental company? If so, which one?</label>
			<input type="text" name="company" id="input_company" style="width:100%;" value="{{ posted.company }}" />
		</fieldset>
		
		<p>
			I hereby consent to submit my property listing(s) to The State News. My listing(s) may be reproduced by The State News for the purposes of illustration, trade or publication in any form or matter including print and online. All proofs, prints, negatives, positives, digital files, and reproduction thereof shall be and remain the sole property of The State News.
		</p>
		
		
		<img src="{{ 'roost/style/images/bullet_red.png'|url }}" /> <input type="checkbox" value="1" id="input_agree" name="agree" /> I agree with the above terms and conditions.
		
		<hr class="spacer" />
		<img src="{{ 'roost/style/images/bullet_red.png'|url }}" /> Finally, we need to verify that you are, in fact, human.

		{{ turing }}
		
		<hr class="spacer" />
		
		<input type="submit" value="Request an account" />
		
		</form>
		
	</div>
	<div class="grid_4">
		{% include 'gryphon/main/sidebar-short.tpl' %} 
	</div>
	
	<hr class="spacer" />
{% endblock %}