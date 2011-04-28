{% extends "gryphon/base.tpl" %}
{% block title %}:: Archives{% endblock %}


{% block active %}{% endblock %}
{% block subActive %}{% endblock %}

{% block content %}

<div class="grid_8">

<h1>Archives</h1>

<p>Perform an advanced search of all the archives. You may specify a date range. If no range is supplied, we will search from September 2000 forward.</p>

{% include 'gryphon/search/form.tpl' %}

</div>
<div class="grid_4">
<img src="{{ 'style_chroma/images/ads/square.png'|url }}" alt="advertisement" />
</div>

<div class="clear"></div>

{% endblock content %}