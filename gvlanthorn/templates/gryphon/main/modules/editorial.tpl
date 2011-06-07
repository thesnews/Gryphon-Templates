	<div class="mod-head">
		<h4>Editorial</h4>
	</div>
	<div class="mod mb">
		<div class="inner">
		
		{% fetch cartoon from media with [
			'limit': 1,
			'order': 'self:weight desc, self:created desc',
			'withTags': ['cartoon']
		] %}

			{% for media in cartoon %}
					<div class="image">
					<a href="{{ media.urlDefault }}"><img src="{{ media.url }}" alt="{{ media.title }}" /></a>
					</div>
					<div class="caption aside mb">Editorial cartoon</div>
			{% endfor %}

			<hr class="mmb" />
		{% fetch editorials from article with [
		'limit': 3,
		'order': 'weight desc, created desc',
		'where': 'status = 1',
		'withTags': ['editorial']
		]
		%}
		<ul class="links mb">
			{% for article in editorials %}
				<li><a href="{{ article.url }}">{{ article.headline }}</a>&nbsp;<span class="dateline aside">{{ article.created|date('M d') }}</span></li>
				{% endfor %}
			</ul>
		</div>
	</div>	
