{% extends "gryphon/base.tpl" %}

{% block title %} :: Recently{% endblock %}
{% block description %}Recent items from The State News{% endblock %}

{% block content %}
<div class="grid_8">
	<h1>Recent Content</h1>
	<br />

	<h3 class="box gray">Recent articles: <a href="{{ 'gryphon:recent/article.xml'|url }}" class="feed_link"></a></h3>
	<br />
	{% if articles.length %}
	<ul class="item-list">
		{% for article in articles %}
			<li>
				<h4><a href="{{ article.url }}">{{ article.headline }}</a></h4>
				<p>
					{{ article.abstract_formatted }}
					<a href="{{ article.url }}">More &#187;</a>
				</p>
			</li>
		{% endfor %}
	<li><a href="{{ 'gryphon:recent/article'|url }}">More recent articles &#187;</a></li>
	</ul>
	{% else %}
		Sorry, no recent articles to report.
	{% endif %}
	
	<br />
	<br />
	
	<h3 class="box gray">Recent comments: <a href="{{ 'gryphon:recent/comment.xml'|url }}" class="feed_link"></a></h3>
	<br />
	{% if comments.length %}
	<ul class="item-list">
	{% for comment in comments %}
		<li>
			<h4><a href="{{ comment.url }}">Around {{ comment.created|timeSince }}, {{ comment.name }} said:</a></h4>
			<p>
				{{ comment.preview }}
				<a href="{{ comment.url }}">More &#187;</a>
			</p>
		</li>
	<?php endforeach ?>
		<li><a href="{{ 'gryphon:recent/comment'|url }}">More recent comments &#187;</a></li>
	{% endfor %}
	</ul>
	{% else %}
		Sorry, no recent comments to report.
	{% endif %}

	<hr class="spacer" />
</div>
		
<div class="grid_4">
	{% include 'gryphon/main/sidebar-standard.tpl' %}
</div>

<div class="clear"></div>
{% endblock %}