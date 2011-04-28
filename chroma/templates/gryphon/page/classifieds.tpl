{% extends "gryphon/base.tpl" %}
{% block title %}The State News :: Puzzles{% endblock %}


{% block active %}{% endblock %}
{% block subActive %}Classifieds{% endblock %}

{% block content %}
	<div class="grid_12">
	<h1>Classifieds</h1>
	<div class="grid_10 alpha">
		<div class="grid_6 alpha">
			<div>
				<form id="classifieds-search-form" method="post" action="{{ 'pre1:main/search'|url }}">
					<input type="text" id="classifieds-search-terms" name="token" value="Search Classifieds" />
					<select id="classifieds-search-category" name="category">
					<option value="null">All categories</option>
					{% for category in categories %}
						<option value="{{ category.uid }}">{{ category.name }}</option>
					{% endfor %}
					</select>
				</form>
			</div>
			
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
		<div class="grid_4 omega">
			<h2>Categories:</h2>
			<ul class="link-list">
			{% for category in categories %}
				<li><a href="{{ category.url }}">{{ category.name }}</a></li>
			{% endfor %}
			</ul>
			
		</div>
	</div>
	<div class="grid_2 omega">
		<img src="{{ 'style_chroma/images/ads/button.png'|url }}" alt="advertisement" style="float: left" />
	</div>
</div>

{% endblock content %}