{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ blog.headline }}{% endblock %}
{% block active %}blogs{% endblock %}
{% block subActive %}{{ blog.slug }}{% endblock %}

{% block content %}
{% helper dswSync %}

{% import 'macros/comment.tpl' as comment %}
{% import 'macros/tools.tpl' as tools %}

<div class="grid_12">

<div class="grid_8 alpha">
	<h1>{{ post.headline }}</h1>

	<div class="dark byline">
		<a class="author">{{ post.authors.splat('name')|join(', ') }}</a>

		<span class="date">{{ post.created|timeSince }}</span>

		<span class="modified">{{ post.modified|timeSince }}</span>

		<a href="{{ post.url }}#comments" class="comment">{{ post.commentTotal|int2noun('comment') }}</a>
	</div>
	
	<p>
	{{ post.copy_formatted }}
	</p>
	
</div>
<div class="grid_4 omega">

	<div>
		<h3>About {{ blog.name }}</h3>
		
		<p>{{ blog.description_formatted }}</p>
		
	</div>
	<br />
	<div>
		<ul>
		<li><h3>Tools:</h3></li>
		<li>{{ tools.facebook(post) }}</li>
		<li>{{ tools.twitter(post) }}</li>
		<li>{{ tools.digg(post) }}</li>
		<li>{{ tools.delicious(post) }}</li>
		<li>{{ tools.blogger(post) }}</li>
		<li>{{ tools.feed(post) }}</li>
		<li>{{ tools.print(post) }}</li>
		</ul>	
	</div>	
<img src="{{ 'style_chroma/images/ads/button.png'|url }}" alt="advertisement" />
<img src="{{ 'style_chroma/images/ads/button.png'|url }}" alt="advertisement" />

</div>

</div>

{% endblock %}