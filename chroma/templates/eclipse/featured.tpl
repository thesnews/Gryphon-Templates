<h5>
	FEATURED CLASSIFIEDS:
	<span><a href="{{ 'eclipse:main'|url }}">More classifieds &#187;</a></span>
</h5>
{% fetch items from eclipse:ad with [
	'where': 'status = 1',
	'order': 'category_id'
] %}

{% set category = items[0].category %}
<p><strong>In <a href="{{ category.url }}">{{ category.name }}</a>:</strong></p>
<ul>
{% for item in items %}
	{% if item.category_id != category.uid %}
		{% set category = item.category %}
		</ul>	
		<p><strong>In <a href="{{ category.url }}">{{ category.name }}</a>:</strong></p>
		<ul>
	{% endif %}
	<li><a href="{{ item.url }}">{{ item.preview }}</a></li>
{% endfor %}
</ul>
