{% helper utilityHelper as util %}

{% set navigation = [
	'/': [
		'id': 'frontpage',
		'label': 'Front Page',
		'subcats': [
			'recent': 'Updated '~util.lastUpdate()|timeSince,
			'page/puzzles': 'Puzzles',
			'pre1:main': 'Classifieds',
			'page/religious': 'Religious Guide',
			'page/mobile': 'Mobile',
			'roost:roost': 'Housing Guide'
		]
	],

	'section/news': [
		'id': 'news',
		'label': 'News',
		'subcats': [
			'section/city': 'City',
			'section/campus': 'Campus',
			'section/police_briefs': 'Police Briefs',
		]
	],

	'section/sports': [
		'id': 'sports',
		'label': 'Sports',
		'subcats': [
			'section/football': 'Football',
			'section/basketball': 'Basketball',
			'section/hockey': 'Ice Hockey',
			'section/soccer': 'Soccer',
			'section/baseball': 'Baseball',
			'section/softball': 'Softball',
			'section/golf': 'Golf',
			'section/team': 'More Teams...'
		]
	],

	'section/opinion': [
		'id': 'opinion',
		'label': 'Opinion',
		'subcats': [
			'section/editorials': 'Editorials',
			'section/columns': 'Columns',
			'section/letters': 'Letters',
		]
	],

	'section/features': [
		'id': 'features',
		'label': 'Features',
		'subcats': [
			'google:calendar': 'Event Calendar',
			'gryphon:page/puzzles': 'Puzzles!'
		]
	],
	
	'blog': [
		'id': 'blogs',
		'label': 'Blogs',
		'subcats': [
			'': 'Featured:',
			'blog/dispatches': 'Dispatches',
			'blog/msu_football_blog': 'Football Blog',
			'blog/the_watercooler': 'The Watercooler'
		]
	],
	
	'multimedia': [
		'id': 'multimedia',
		'label': 'Multimedia',
		'subcats': [
			'multimedia/video': 'Video',
			'gallery/': 'Galleries',
			'multimedia/living_city': 'Living City',
			'multimedia/soundSlide': 'Slideshows',
			'multimedia/audio': 'Audio',
			'multimedia/interactive': 'Interactives'
		]
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
	<li id="{{ info['id'] }}"{% if active == info['id'] %} class="active"{% endif %}>
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
