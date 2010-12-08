{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ blog.headline }}{% endblock %}
{% block active %}blogs{% endblock %}
{% block subActive %}{{ blog.slug }}{% endblock %}

{% block content %}
{% helper dswSync %}

{% import 'macros/comment.tpl' as comment %}
{% import 'macros/tools.tpl' as tools %}

<div class="grid_8">
	<h1>{{ post.headline }}</h1>

	<div class="gray box blogsize" id="toolsblogs">
		By {{ post.authors.splat('name')|join(', ') }}
		<br /><br />
		<strong>Created:</strong><br />{{ post.created|timeSince }}
		<br /><br />
		<strong>Last updated:</strong> <br />{{ post.modified|timeSince }}
		<br /><br />
		<a href="{{ post.url }}#comments">{{ post.commentTotal|int2noun('comment') }}</a>
		<br /><br />
		<strong>Tools:</strong><br />
		{{ tools.facebook(post) }}
		{{ tools.twitter(post) }}
		{{ tools.digg(post) }}
		{{ tools.delicious(post) }}<br />
		{{ tools.blogger(post) }}
		{{ tools.feed(post) }}
		{{ tools.print(post) }}</div>	
	
	<p>
	{{ post.copy_formatted }}
	</p>
	
	<hr />

	<div class="pagination"><span>
		{{ comment.pagers(post) }}
	</span></div>
	
	<div class="comments">
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

<div class="grid_4 standard-sidebar">
	<div class="box gray">
		<h5>About {{ blog.name }}</h5>
		
		<p>{{ blog.description_formatted }}</p>
		
		<a href="{{ blog.url }}.xml" class="feed_link">Follow this blog in your feed reader</a>
	</div>
	
	<hr class="spacer" />

	{% include 'gryphon/main/sidebar-standard.tpl' %}
</div>

<hr class="spacer" />

{% endblock %}