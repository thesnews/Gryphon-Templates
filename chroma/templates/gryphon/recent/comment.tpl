{% extends "gryphon/base.tpl" %}

{% block title %} :: Recent Comments{% endblock %}
{% block description %}Recent items from The State News{% endblock %}

{% block content %}
<div class="grid_8">

	<h1>Recent comments: <a href="{{ 'gryphon:recent/comment.xml'|url }}" class="feed_link"></a></h1>

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
	{% endfor %}
	</ul>
	{% else %}
		Sorry, no recent comments to report.
	{% endif %}
</div>

<div class="grid_4">
	{% include 'gryphon/main/sidebar-standard.tpl' %}
</div>

<div class="clear"></div>
{% endblock %}