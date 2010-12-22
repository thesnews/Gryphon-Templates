{% extends "gryphon/base.tpl" %}

{% block title %} :: Recent Articles{% endblock %}
{% block description %}Recent items from The State News{% endblock %}

{% block content %}
<div class="grid_8">

	<h1>Recent articles: <a href="{{ 'gryphon:recent/article.xml'|url }}" class="feed_link"></a></h1>

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
	</ul>
	{% else %}
		Sorry, no recent articles to report.
	{% endif %}
</div>

<div class="grid_4">
	{% include 'gryphon/main/sidebar-standard.tpl' %}
</div>

<div class="clear"></div>
{% endblock %}