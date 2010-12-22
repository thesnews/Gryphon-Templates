{% extends 'gryphon/base.tpl' %}

{% block title %} :: Housing Guide{% endblock %}
{% block active %}{% endblock %}
{% block subActive %}Housing Guide{% endblock %}

{% block scripts %}
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>

	<script type="text/javascript" src="{{ 'roost/frontend/javascript/master.js'|url }}"></script>
{% endblock %}

{% block styles %}
	<link rel="stylesheet" type="text/css" media="screen" href="{{ 'roost/frontend/style/screen/master.css'|url }}" />
{% endblock %}

{% block content %}
	{% helper adpilotHelper as ads %}
	{% helper config %}
	
	{% set housingTypes = ['house', 'apartment', 'duplex', 'room'] %}

	{% set basicAmenities = [
		'ac': 'Air Conditioning',
		'utility_tv': 'Cable/Satellite',
		'utility_heat': 'Heat Included',
		'utility_water': 'Water Included'
	] %}
	
	{% set advancedAmenities = [
		'Unit  Amenities': [
			'furnished': 'Fully Furnished',
			'partially_furnished': 'Partially Furnished',
			'dishwasher': 'Dishwasher',
			'laundry_in_unit': 'Laundry In-Unit',
			'secure_entry': 'Secure Entry',
			'balcony_patio': 'Balcony/Patio'
		],
		
		'Community Amenities': [
			'laundry_on_property': 'Laundry On-Property',
			'carport_garage': 'Carport/Garage',
			'utility_garbage': 'Garbage Included',
			'computer_lab': 'Computer Lab',
			'commenty_center': 'Community Center'
		],
		
		'Athletic Facilitates': [
			'pool': 'Pool',
			'fitness_center': 'Fitness Center',
			'volleyball': 'Volleyball Court',
			'basketball': 'Basketball Court'
		],
		
		'Pets': [
			'allow_dog': 'Dogs Allowed',
			'allow_cat': 'Cats Allowed'
		]
	] %}
	
	{% set sortOptions = [
		'rent_asc': 'Rent - Lowest to Highest',
		'rent_desc': 'Rent - Higest to Lowest',
		'bedrooms_asc': 'Bedrooms - Lowest to Highest',
		'bedrooms_desc': 'Bedrooms - Highest to Lowest',
		'city_asc': 'City - A to Z',
		'city_desc': 'City - Z to A'
	] %}


	<div class="grid_8">
		
		<div id="housing_finder_header">
			<a href="{{ 'roost:roost'|url }}"><img src="{{ 'roost/frontend/style/images/housing-header.gif'|url }}" alt="SN Housing Guide" style="border:0;" border="0" /></a>
			<div id="housing_sponsor">{{ ads.display('housingsponsor') }}</div>
		</div>
		
		<div id="housing_finder">
			<div id="filter_options">
				<form method="get" action="{{ 'roost:roost/search'|url }}">
					<input type="hidden" name="adv" id="input_advancedSearch" value="{{ advanced }}" />
					<div id="buttons">
						<span>To further customize your search, click on "advanced options."</span>
						<input id="submit" type="submit" value="Search">
						<a href="#" id="advanced_toggle">Advanced Options</a>
															
					</div>
					<div id="basic_options">
						<fieldset>
							<legend>Housing Type</legend>
							<div>
							{% for type in housingTypes %}
								{% if type == 'duplex' %}
									</div>
									<div>
								{% endif %}
								<input type="checkbox" name="types[]" value="{{ type }}" id="{{ type }}" {% if type|in(searchParams.types) %}checked="checked"{% endif %}/>
								<label for="{{ type }}" id="{{ type }}">{{ type|capitalize }}</label><br />
							{% endfor %}
							</div>
						</fieldset>
						<fieldset>
							<legend>Rent Range</legend>
							<label for="min_rent">Min Rent:&nbsp;</label>
							<select name="min_rent" id="min_rent">
							{% for i in 100|range(4000, 100) %}
								<option value="{{ i }}" {% if searchParams.minRent|default('100') == i %} selected="selected" {% endif %}>${{ i }}</option>
							{% endfor %}
							</select>
							<br />
							<label for="max_rent">Max Rent:</label>
							<select name="max_rent" id="max_rent">
							{% for i in 100|range(4000, 100) %}
								<option value="{{ i }}" {% if searchParams.maxRent|default('1000') == i %} selected="selected" {% endif %}>${{ i }}</option>
							{% endfor %}
							</select>
						</fieldset>
						<fieldset>
							<legend>Basic Ammenities</legend>
							<div>
							{% for key, val in basicAmenities %}
								{% if key == 'utility_heat' %}
									</div>
									<div>
								{% endif %}
								<input type="checkbox" name="{{ key }}" value="1" id="{{ key }}" {% if searchParams[key] == 1 %} checked="checked"{% endif %}/>
								<label for="{{ key }}">{{ val }}</label><br />
							{% endfor %}
							</div>
						</fieldset>
					</div>
					<div id="advanced_options">
						{% for label, amenities in advancedAmenities %}
							<fieldset>
								<legend>{{ label }}</legend>
								{% for key, val in amenities %}
									<input type="checkbox" name="{{ key }}" value="1" id="{{ key }}" {% if searchParams[key] == 1 %} checked="checked"{% endif %}/>
									<label for="{{ key }}">{{ val }}</label><br />
								{% endfor %}
							</fieldset>
						{% endfor %}
						<fieldset id="bedbath">
							<legend>Beds/Baths</legend>
							<label for="beds">Beds:&nbsp;</label>
							<input type="text" name="bedrooms" id="beds" size="2" value="{{ searchParams.bedrooms }}" />
							<br />
							<label for="baths">Baths:</label>
							<input type="text" name="bathrooms" id="baths" size="2" value="{{ searchParams.bathrooms }}" />
						</fieldset>
						<fieldset id="sort_order">
							<legend>Sort Results By:</legend>
							<select name="sort">
							{% for key, val in sortOptions %}
								<option value="{{ key }}" {% if searchParams.sort|default('rent_asc') == key %} selected="selected"{% endif %}>{{ val }}</option>
							{% endfor %}
							</select>
						</fieldset>
					</div>
				</form>
				<div class="clear"></div>
			</div> <!-- / filter_options -->
			
			<div id="canvas" style="width:618px;height:300px;" rel="{{ config.get('roost:map:default:latLon') }}"></div>
	
			<hr class="spacer" />
			
			<a href="{{ 'roost:roost/mobile'|url }}"><img src="{{ 'roost/frontend/style/images/mobile-banner.png'|url }}" alt="The Housing Guide mobile version" /></a>
			
			<hr />
			
			<div id="search_results">
				<div class="pagination">
					<h2>Search Results</h2>
					<span>
						{% for page in pagination %}
							<a href="{{ page.url }}">{{ page.label }}</a>
						{% endfor %}
					</span>
				</div>
				{% if properties.length %}
					<ul>
					{% for property in properties %}
						
						{% if property.name == property.street %}
							{% set usename = property.street %}
						{% else %}
							{% set usename = property.name~', '~property.street %}
						{% endif %}

						<li id="property-{{ property.uid }}" rel="{{ property.latlon }}|{{ property.type }}">
							<h4><a href="{{ property.urlListing }}">{{ usename }}, {{ property.city }}</a></h4>
							<div class="info_wrap">
								<div class="price">
									{{ property.rentLabel }}<br /><span>per {{ property.rent_modifier }}</div>
								<div class="description">
									{{ property.summary_formatted }}
								</div>
							</div>
							<a href="{{ property.urlMap }}"><img src="{{ property.urlStaticMap }}" /></a>
							<div class="contact_info">
								<span class="phone">{{ property.phone }}</span>
								{% if property.email %}
									<a class="email" href="{{ ('roost:roost/contact/'~property.uid)|url }}" class="email">Contact via email</a>
								{% endif %}
								{% if property.url %}
									<a class="website" href="{{ property.url }}">Visit website</a>
								{% endif %}
								<a class="listing_link" href="{{ property.urlListing }}">View Full Listing &rarr;</a>
							</div>
		
						</li>
					{% endfor %}
					</ul>
				{% else %}
					No properties found.
				{% endif %}
				<div class="pagination">
					<br /><br />
					<span>
						{% for page in pagination %}
							<a href="{{ page.url }}">{{ page.label }}</a>
						{% endfor %}
					</span>
				</div>
				
				<hr class="spacer" />
				
				<h4>Are you a property owner?</h4>
				
				<p>
					<a href="{{ 'roost:roost/account'|url }}">Request an account today</a> and start adding your own properties to our Housing Guide. Already have an account? Login now to <a href="/roost">manage your listings</a>.
				</p>
		
				<hr />
				
				<p class="small">
					Continued use of this service implies acceptance of the <a href="{{ 'roost:roost/tos'|url }}">Terms of Service</a>.
				</p>
	
		
			</div> <!-- /search_results -->
	
		</div> <!-- /housing_finder -->
	</div>
	<div class="grid_4">
		{% include 'gryphon/main/sidebar-standard.tpl' %}
	</div>
	<hr class="spacer" />

{% endblock %}