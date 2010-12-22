{#	$popular = _M( 'article' )->popular( 10, time(), strtotime( '-2 weeks' ) ); #}
<ul class="tab-box box gray">
	<li><a href="#" class="tab-header">Popular</a>
		<ul class="bullet">
		{% set popular = 'article'|call('popular', [10, '-2 weeks', 'today']) %}
		{% for article in popular %}
			<li><a href="{{ article.url }}">{{ article.headline }}</a> </li>
		{% endfor %}
		</ul>
	</li>
	<li><a href="#" class="tab-header">Newest</a>
		<ul class="bullet">
		{% fetch recently from article with [
			'where': 'status = 1',
			'order': 'created desc',
			'limit': 10
		] %}
		{% for article in recently %}
			<li><a href="{{ article.url }}">{{ article.headline }}</a> </li>
		{% endfor %}
		</ul>
	</li>
	<li><a href="#" class="tab-header">Comments</a>
		<ul>
			{% fetch comments from comment with [
				'where': 'status = 1',
				'order': 'created desc',
				'limit': 5,
				'forceCache': true
			] %}
			{% for comment in comments %}
				<li>
					<strong>{{ comment.name }} said:</strong> {{ comment.preview }}<br />
					<span class="small">(added {{ comment.created|timeSince }})</span>
					<a href="{{ comment.url }}">more &#187;</a>
				</li>
			{% endfor %}
		</ul>
	</li>
</ul>