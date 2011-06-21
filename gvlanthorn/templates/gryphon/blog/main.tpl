{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ blog.headline }}{% endblock %}
{% block active %}blogs{% endblock %}
{% block subActive %}{{ blog.slug }}{% endblock %}

{% block content %}
{% helper dswSync %}

{% import 'macros/comment.tpl' as comment %}
{% import 'macros/tools.tpl' as tools %}

<div class="grid_8">


	<h1 class="article-head mmb{% if not post.status %} unp{% endif %}">{{ post.headline }}</h1>


		
	<span class="dateline aside{% if article.modified > now - 86400 %} attn{% endif %}">{{ article.modified|date('M d') }}</span>
		
	<p>
	{{ post.copy_formatted }}
	</p>
	
	<hr />

	<div class="pagination"><span>
		{{ comment.pagers(post) }}
	</span></div>
	
	<div class="comments">
	<a id="comments"></a>
		{{ comment.list(post) }}
	</div>

	<div class="pagination"><span>
		{{ comment.pagers(post) }}
	</span></div>

	{% if post.shouldAllowComments %}

		{% set commentItem = post %}
		{% include 'gryphon/comment/form.tpl' %}

	{% endif %}






</div>

<div class="grid_4">
	{% include 'gryphon/main/side_bar.tpl' %}
</div>

<div class="clear">&nbsp;</div>


{% endblock %}