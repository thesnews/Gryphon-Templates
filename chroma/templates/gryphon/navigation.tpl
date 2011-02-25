{% helper utilityHelper as util %}

{% set navigation = [
	'/': [
		'id': 'frontpage',
		'label': 'Front Page'
	],

	'section/news': [
		'id': 'news',
		'label': 'News'
	],

	'section/sports': [
		'id': 'sports',
		'label': 'Sports'
	],

	'section/opinion': [
		'id': 'opinion',
		'label': 'Opinion'
	],

	'section/features': [
		'id': 'features',
		'label': 'Features'
	],
	
	'multimedia': [
		'id': 'multimedia',
		'label': 'Multimedia'
	]
	
	
	
	
] %}

{% if not active %}
	{% set active = "frontpage" %}
{% endif %}

{% if not subActive %}
	{% set subActive = "" %}
{% endif %}

<ul id="cat"> <!-- TOP LEVEL NAVIGATION. "ACTIVE" CLASS GETS TABBED -->
{% for url, info in navigation %}
	<li {% if active == info['id'] %} class="active"{% endif %}>
		<a href="{{ url|url }}">{{ info['label'] }}</a>
		{% if active == info['id'] and info['subcats'] %}
			<ul id="subcat"> <!-- BOTTOM LEVEL NAVIGATION. "ACTIVE" CLASS GETS ARROWED -->
				{% for sUri, sLabel in info['subcats'] %}
					<li{% if sLabel == subActive %} class="active"{% endif %}><a href="{{ sUri|url }}">{{ sLabel }}</a></li>
				{% endfor %}
			</ul>
		{% endif %}
	</li>
{% endfor %}
</ul>
