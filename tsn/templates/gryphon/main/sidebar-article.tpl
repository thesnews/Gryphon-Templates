{% include 'gryphon/ads/rectangle.tpl' %}

<hr />

<div class="box gray">
	{% include "pre1/featured.tpl" %}
</div>

<hr class="spacer" />

{% if article.copy|length > 1500 %}
	
	{% include 'gryphon/main/featured.tpl' %}
{% endif %}

{% if article.copy|length > 3000 %}
	<hr class="spacer" />
	
	{% include 'gryphon/main/pod-gallery.tpl' %}
{% endif %}

<hr class="spacer" />

{% include 'google/calendar/featured.tpl' %}
