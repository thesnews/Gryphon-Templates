<h5>
	FEATURED CLASSIFIEDS:
	<span><a href="{{ 'pre1:main'|url }}">More classifieds &#187;</a></span>
</h5>

{% include 'gryphon/ads/classifiedsponsor.tpl' %}
<hr class="spacer" />

{% fetch items from pre1:ad with [
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
