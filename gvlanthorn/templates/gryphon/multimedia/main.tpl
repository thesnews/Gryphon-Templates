{% extends "gryphon/base.tpl" %}

{% block title %} :: Multimedia{% endblock %}
{% block active %}multimedia{% endblock %}
{% block subActive%}{{ subActive }}{% endblock %}

{% block content %}

{% import 'macros/render.tpl' as mediaRender %}

{% set topMedia = media.shift() %}

<div class="grid_8">
&nbsp;
</div>

<div class="grid_4">
	{% include 'gryphon/main/modules/gallery_box.tpl' %}
</div>

<div class="clear">&nbsp;</div>

{% endblock content %}
