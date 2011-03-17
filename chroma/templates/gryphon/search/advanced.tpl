{% extends "gryphon/base.tpl" %}

{% block title %} :: Advanced Search{% endblock %}

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

{% set types = [
	'article',
	'media',
	'page',
	'section',
	'comment'
] %}

<div class="grid_12 alpha omega">

<h1>
		{% if query	%}
			Search Results
		{% else %}
			Advanced Search
		{% endif %}
	</h1>
	{% if query %}
		<p>Below are your search results. You can also try a <a href="{{ 'search'|url }}">Basic Search</a>.</p>
	{% else %}
	<p>Use the field below to perform an advanced search of The State News' archives. This will return articles, images, and multimedia relevant to your query. You can also try a <a href="{{ 'search'|url }}">Basic search</a></p>
	{% endif %}

<form method="get" action="{{ 'gryphon:search'|url }}" class="search-advanced">
	<input type="hidden" name="a" value="1" />

	<fieldset class="grid_4 alpha">

		<label for="input_search">Find:</label>
		<input type="text" id="input_search" name="s" size="30" value="{{ query.subject }}"  />

		<label for="input_title">Title/Headline:</label>
		<input type="text" id="input_title" name="ti" size="30" value="{{ query.title }}" />

	</fieldset>
	<fieldset class="grid_4 omega">

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

		
	</fieldset>

	<hr class="spacer" />
	
	<fieldset class="grid_4 alpha">

		<label for="input_author">Writer/Photographer:</label>
		<input type="text" id="input_author" name="au" size="30" value="{{ query.author }}" />

		<label for="input_tag">Tagged:</label>
		<input type="text" id="input_tag" name="tg" size="30" value="{{ query.tag }}" />
		
	</fieldset>
	<fieldset class="grid_4 omega">

		<label for="input_type">Type:</label>
		<select name="ty" id="input_type">
			<option value="0">Any</option>
			{% for val in types %}
				<option value="{{ val }}"{% if query.type == val %} selected="selected"{% endif %}>{{ val }}</option>
			{% endfor %}
		</select>

		<label for="input_order">Order by:</label>
		<select name="o" id="input_order">
			<option value="date"{% if query.order == 'date' %} selected="selected"{% endif %}>Date</option>
			<option value="title"{% if query.order == 'title' %} selected="selected"{% endif %}>Title</option>
		</select>

	</fieldset>

	<hr class="spacer" />
	<div id="form_submit"><input type="submit" value="Search" /></div>
</form>

<hr class="spacer" />

{% if query %}<h5 class="bordered">SEARCH RESULTS:</h5>{% endif %}
<ul class="search-results">
		{% for item in hits %}
			<li>
				<h4><a href="{{ item.url|url }}">{{ item.title }}</a></h4> <em>({{ item.created|timeSince }})</em>
				<br />
				{{ item.description }}
			</li>
		{% endfor %}
	</ul>
		
	<br />
	<br />
	<div class="pagination">
		<span>
			{% for page in pagination %}
				<a href="{{ page.url }}">{{ page.label }}</a>
			{% endfor %}
		</span>
	</div>

</div>

{% endblock %}