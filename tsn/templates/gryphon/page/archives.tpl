{% extends "gryphon/base.tpl" %}
{% block title %}:: Archives{% endblock %}


{% block active %}{% endblock %}
{% block subActive %}{% endblock %}

{% block content %}

{% set months = [
	'01': 'January',
	'02': 'February',
	'03': 'March',
	'04': 'April',
	'05': 'May',
	'06': 'June',
	'07': 'July',
	'08': 'August',
	'09': 'September',
	'10': 'October',
	'11': 'November',
	'12': 'December'
] %}

<div class="grid_8">
	<h1>Archives</h1>

	<p>The State News provides full access to content dating back to September 2000. If you have questions or concerns, please send us a message.</p>

<p><strong>Important Note:</strong> While the State News does correct factual errors in our archive, it is our policy to not remove items from our database for any reason.</p>


	<h3 class="gray box">Basic Search</h3>
	<p>Perform a basic search of the State News' archives. We will search from September 2000 forward.</p>
		
		<form method="get" action="/index.php/search/">
		<input type="text" name="q" value="" />
		<input type="submit" value="Search" />
	</form>
	
	
	<hr class="spacer" />
	
	<h3 class="gray box">Quick Date Search</h3>
	
	<form method="get" action="/index.php/search/" class="search-advanced">
		<input type="hidden" name="a" value="1" />
				
		<fieldset id="from_to_date1" class="noborder">
			<div>
				<label>From:</label>
				<select name="ts_month">
					<option value="0">Month</option>
					{% for val,label in months %}
						<option value="{{ val }}"{% if query.time_startMonth == val %} selected="selected"{% endif %}>{{ label }}</option>
					{% endfor %}
				</select>
				<select name="ts_day">
					<option value="0">Day</option>
				{% for i in 1..31 %}
					<option value="{{ i }}"{% if query.time_startDay == i %} selected="selected"{% endif %}>{{ i }}</option>
				{% endfor %}
				</select>
				<select name="ts_year">
				<option value="0">Year</option>
				{% set b = 2001 %}
				{% set n = now|date('Y') %}
				
				{% for i in b..n %}
					<option value="{{ i }}"{% if query.time_startYear == i %} selected="selected"{% endif %}>{{ i }}</option>
				{% endfor %}
				</select>

			</div>
			
			<div>
				<label>To:</label>
				<select name="te_month">
					<option value="0">Month</option>
					{% for val,label in months %}
						<option value="{{ val }}"{% if query.time_endMonth == val %} selected="selected"{% endif %}>{{ label }}</option>
					{% endfor %}
				</select>
				<select name="te_day">
					<option value="0">Day</option>
				{% for i in 1..31 %}
					<option value="{{ i }}"{% if query.time_endDay == i %} selected="selected"{% endif %}>{{ i }}</option>
				{% endfor %}
				</select>
				<select name="te_year">
				<option value="0">Year</option>
				{% set b = 2001 %}
				{% set n = now|date('Y') %}
				
				{% for i in b..n %}
					<option value="{{ i }}"{% if query.time_endYear == i %} selected="selected"{% endif %}>{{ i }}</option>
				{% endfor %}
				</select>

			</div>
			
		</fieldset>
		
		
		<input type="submit" value="Search" />
	</form>

<hr class="spacer" />

<h3 class="gray box">Advanced Search</h3>

<p>Perform an advanced search of the State News' archives. You may specify a date range. If no range is supplied, we will search from September 2000 forward.</p>

<form method="get" action="/index.php/search/" class="search-advanced">
		<input type="hidden" name="a" value="1" />
		<div id="form_left">
		<fieldset class="noborder" id="find_headline">
			<div>
				<label for="input_search">Find:</label>
				<input type="text" id="input_search" name="s" size="30" value=""  />
			</div>
			<div>
				<label for="input_title">Headline:</label>
				<input type="text" id="input_title" name="ti" size="30" value=""/>
			</div>
		</fieldset>
		<fieldset class="noborder" id="writer_tagged">
			<div>
				<label for="input_author">Writer/Photographer:</label>
				<input type="text" id="input_author" name="au" size="30" value="" />
			</div>

			<div>
				<label for="input_tag">Tagged:</label>
				<input type="text" id="input_tag" name="tg" size="30" value="" />
			</div>
			
		</fieldset>
	
	
	
		
		</div>
		<div id="form_right">
		<fieldset class="noborder" id="from_to_date2">
			<div>
				<label>From:</label>

				<select name="ts_month">
					<option value="0">Month</option>
					{% for val,label in months %}
						<option value="{{ val }}"{% if query.time_startMonth == val %} selected="selected"{% endif %}>{{ label }}</option>
					{% endfor %}
				</select>
				<select name="ts_day">
					<option value="0">Day</option>
				{% for i in 1..31 %}
					<option value="{{ i }}"{% if query.time_startDay == i %} selected="selected"{% endif %}>{{ i }}</option>
				{% endfor %}
				</select>
				<select name="ts_year">
				<option value="0">Year</option>
				{% set b = 2001 %}
				{% set n = now|date('Y') %}
				
				{% for i in b..n %}
					<option value="{{ i }}"{% if query.time_startYear == i %} selected="selected"{% endif %}>{{ i }}</option>
				{% endfor %}
				</select>

			</div>
			
			<div>
				<label>To:</label>
				<select name="te_month">
					<option value="0">Month</option>
					{% for val,label in months %}
						<option value="{{ val }}"{% if query.time_endMonth == val %} selected="selected"{% endif %}>{{ label }}</option>
					{% endfor %}
				</select>
				<select name="te_day">
					<option value="0">Day</option>
				{% for i in 1..31 %}
					<option value="{{ i }}"{% if query.time_endDay == i %} selected="selected"{% endif %}>{{ i }}</option>
				{% endfor %}
				</select>
				<select name="te_year">
				<option value="0">Year</option>
				{% set b = 2001 %}
				{% set n = now|date('Y') %}
				
				{% for i in b..n %}
					<option value="{{ i }}"{% if query.time_endYear == i %} selected="selected"{% endif %}>{{ i }}</option>
				{% endfor %}
				</select>

			</div>
			
		</fieldset>
		<fieldset class="noborder" id="type_order">
			<div>
				<label for="input_type">Type:</label>
				<select name="ty" id="input_type">
					<option value="0">Any</option>
					<option value="article" >Article</option>
					<option value="media" >Media</option>
				</select>
			</div>
			
			<div>
				<label for="input_order">Order by:</label>
				<select name="o" id="input_order">
					<option value="date" >Date</option>
					<option value="title" >Title</option>
				</select>
			</div>
		</fieldset>
		</div>
		<div class="clear"></div>
		<div id="form_submit"><input type="submit" value="Submit Search Query" /></div>
	</form>
	
</div>

<div class="grid_4">
	{% include 'gryphon/main/sidebar-standard.tpl' %}
</div>

<div class="clear"></div>

{% endblock content %}