<div class="mod-head tabheader">
	<ul>
		<li><a href="#tab-blogs">Blog Posts</a></li>
		<li><a href="#tab-comments">Comments</a></li>
		<li><a href="#tab-popular">Popular</a></li>
	</ul>
</div>
<div class="mod mb">
	<div class="inner">
		<div id="tab-popular">
			<ul class="links boot">
			{% set popular = 'article'|call('popular', [5, '-20 weeks', 'today']) %}
			{% for article in popular %}
				<li><a href="{{ article.url }}">{{ article.headline }}</a>&nbsp;&nbsp;<span class="dateline aside">{{ article.modified|date('M d') }} | {{ article.commentTotal|int2noun('comment') }}</span></li>
			{% endfor %}
			</ul>
		</div>
		
		<div id="tab-comments">
			<ul class="links boot">
			{% fetch comments from comment with [
				'where': 'status = 1',
				'order': 'created desc',
				'limit': 5,
				'forceCache': true
			] %}
			{% for comment in comments %}
				<li>
					<strong>{{ comment.name }}</strong> on 
					<a href="{{ comment.url }}">{{ comment.item.title }}</a>
				</li>
			{% endfor %}
			</ul>
		</div>
		
		<div id="tab-blogs">
			<ul class="links boot">
			{% fetch blogs from blog with [
				'where': 'status = 1',
				'order': 'created desc',
				'limit': 5,
			] %}
			{% for blog in blogs %}
			{% set topPost = blog.mostRecent %}

				<li>
					<a href="{{ topPost.url }}">{{ topPost.headline }}</a>
					<span class="dateline aside">{{ topPost.created|date('M d') }}</span><br />
					<strong>Posted in:</strong>&nbsp;<a href="{{ blog.url }}">{{ blog.title }}</a>
				</li>
			{% endfor %}

			</ul>
		</div>
	</div>
</div>
