{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ blog.headline }}{% endblock %}
{% block active %}blogs{% endblock %}
{% block subActive %}{{ blog.slug }}{% endblock %}

{% block content %}
{% helper dswSync %}

{% import 'macros/comment.tpl' as comment %}
{% import 'macros/tools.tpl' as tools %}

<div class="grid_8">








</div>

<div class="grid_4">
	{% include 'gryphon/main/side_bar.tpl' %}
</div>

<div class="clear">&nbsp;</div>


{% endblock %}