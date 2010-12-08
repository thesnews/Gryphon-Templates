{% block title %} :: Classifieds{% endblock %}
{% block subActive %}Classifieds{% endblock %}

{% extends "gryphon/base.tpl" %}

{% block content %}
	<div class="grid_8">
		<div class="grid_6 alpha">
			<h1>Classifieds</h1>
			
			<div class="gray box">
				<form id="classifieds-search-form" method="post" action="{{ 'eclipse:main/search'|url }}">
					<input type="text" id="classifieds-search-terms" name="token" value="Search Classifieds" />
					<select id="classifieds-search-category" name="category">
					<option value="null">All categories</option>
					{% for category in categories %}
						<option value="{{ category.uid }}">{{ category.name }}</option>
					{% endfor %}
					</select>
				</form>
			</div>

			<hr class="spacer" />
			
			{% if featured.length %}
				<h3>Featured:</h3>
				<ul class="classified-list">
				{% for item in featured %}
					<li><a href="{{ item.category.url }}" class="note_icon">{{ item.category.name }}</a>: {{ item.copy }}</li>
				{% endfor %}
				</ul>
			{% elseif category.uid %}
				<h3>{{ category.name }}</h3>
				<ul class="classified-list">
				{% for item in category.ads %}
					<li><a name="ad{{ item.uid }}"></a>{{ item.copy_formatted }}</li>
				{% endfor %}
				</ul>
			{% elseif token %}
				<h3>Search results for "{{ token }}"</h3>
				<ul class="classified-list">
				{% for item in results %}
					<li><a href="{{ item.category.url }}" class="note_icon">{{ item.category.name }}</a>: {{ item.copy }}</li>
				{% endfor %}
				</ul>
			{% endif %}
		</div>
		<div class="grid_2 omega">
			<h5 class="bordered">CATEGORIES:</h5>
			<ul class="link-list">
			{% for category in categories %}
				<li><a href="{{ category.url }}">{{ category.name }}</a></li>
			{% endfor %}
			</ul>
			
		</div>
		<hr class="spacer" />
	</div>
	<div class="grid_4">
		{% include 'gryphon/main/sidebar-short.tpl' %}
	</div>
	<hr class="spacer" />
{% endblock content %}