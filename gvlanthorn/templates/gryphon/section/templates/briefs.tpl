{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ section.name }}{% endblock %}
{% block active %}briefs{% endblock %}
{% block subActive %}Briefs{% endblock %}

{% block content %}

{% set topStory = articles.shift() %}
{% set featuredStories = articles.shift(2) %}
{% import "macros/article.tpl" as articleRender %}

<div class="grid_8">








</div>

<div class="grid_4">
	{% include 'gryphon/main/side_bar.tpl' %}
</div>

<div class="clear">&nbsp;</div>

{% endblock content %}