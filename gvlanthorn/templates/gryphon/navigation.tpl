{% helper utilityHelper as util %}

{% set navigation = [
	'/': [
		'id': 'frontpage',
		'label': 'HOME'
	],

	'section/news': [
		'id': 'news',
		'label': 'NEWS'
	],

	'section/sports': [
		'id': 'sports',
		'label': 'SPORTS'
	],

	'section/ae': [
		'id': 'ae',
		'label': 'A&amp;E'
	],

	'section/laker_life': [
		'id': 'lake_life',
		'label': 'LAKER LIFE'
	],
	
	'section/editorial': [
		'id': 'editorial',
		'label': 'EDITORIAL',
	],

	'section/briefs': [
		'id': 'briefs',
		'label': 'BRIEFS'
	],

	'blog': [
		'id': 'blogs',
		'label': 'BLOGS'
	],

	'multimedia': [
		'id': 'multimedia',
		'label': 'MULTIMEDIA'
	],

	'page/travel': [
		'id': 'travel',
		'label': 'TRAVEL'
	],

	'http://reprints.lanthorn.com': [
		'id': 'photo',
		'label': 'PHOTO STORE'
	],
	
	'classified': [
		'id': 'classified',
		'label': 'CLASSIFIEDS'
	],
	
	'http://www.gvsuoffcampushousing.com': [
		'id': 'housing',
		'label': 'HOUSING'
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
	</li>
{% endfor %}
</ul>
