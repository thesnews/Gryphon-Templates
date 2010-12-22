{% extends 'gryphon/base.tpl' %}

{% block title %} :: Contact {{ property.name }}{% endblock %}
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
		
		<div id="listing_header" class="gray">
			<h2><a href="{{ property.listingUrl }}">{{ property.name }}</a></h2>
			{{ property.address }}
			| <span class="phone">{{ property.phone }}</span>
			{% if property.url %}
				| <a class="website"><a href="{{ property.url }}">Website</a>
			{% endif %}
		</div>
		
		{% if success %}
		<div id="message" class="box success">
			<h4>Message sent</h4>
			
			Your message was successfully sent.
		</div>
		<hr class="spacer" />
		{% elseif errors %}
		<div id="message" class="box error">
			<h3>Oops</h3>
			
			{% for id, label in errors %}
				{{ label }}<br />
			{% endfor %}
		</div>
		<hr class="spacer" />
		{% endif %}
		
		<form method="post" action="{{ ('roost:roost/contact/'~property.uid)|url }}">
		<div class="grid_5 alpha">
			<input type="hidden" name="mailKey" value="{{ mailKey }}" />
			<fieldset>
				<label for="input_name">Your name:</label><br />
				<input type="text" name="name" id="input_name" value="{{ posted.name }}"/>
				
				<hr class="spacer" />
				
				<label for="input_email">Your email:</label><br />
				<input type="text" name="email" id="input_email" value="{{ posted.email }}"/>
				
				<hr class="spacer" />
				
				<label for="input_phone">Your phone number:</label><br />
				<input type="text" name="phone" id="input_phone" value="{{ posted.phone }}"/>
				
				<hr class="spacer" />
				
				<label for="input_description">What do you want to ask? Please be as specific as possible.</label>
				<textarea rows="10" cols="40" id="input_description" name="description">{{ posted.description }}</textarea>
			</fieldset>
			
			<hr class="spacer" />
			
			<input type="submit" value="Send message" />
			|
			<a href="{{ property.urlListing }}">Return to property listing</a>
		
		</div>
		</form>
		<div class="grid_3 omega">
			<h5 class="bordered">Summary:</h5>
			
			<p>
				<strong>Type:</strong> {{ property.type }}<br />
				<strong>Lease Duration:</strong> {{ property.leaseLabel }}
	
				<hr />
	
				<strong>Bedrooms:</strong> {{ property.bedrooms }}<br />
				<strong>Bathrooms:</strong> {{ property.bathrooms }}
				
				<hr />
			</p>
			
			<div class="price">{{ property.rentLabel }}<br /><span>per {{ property.rent_modifier }}</div>		
			{{ property.description_formatted }}
			
	
		</div>
	
		<hr class="spacer" />
	
		<hr />
		
		<a href="{{ 'roost:roost/mobile'|url }}"><img src="{{ 'roost/frontend/style/images/mobile-banner.png'|url }}" alt="The Housing Guide mobile version" /></a>
		
	</div>
	<div class="grid_4">
		{% include 'gryphon/main/sidebar-short.tpl' %}
	</div>
	<hr class="spacer" />
{% endblock %}