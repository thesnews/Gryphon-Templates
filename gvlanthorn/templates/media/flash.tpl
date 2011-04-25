{% helper dswSync %}
<div class="image">
	<div style="text-align: center;">
		{% if media.meta['flashembed'] %}
			{{ media.meta['flashembed'] }}
		{% endif %}

	</div>
	<div class="info">
		{{ media.authors.splat('name')|join(', ') }}
		&middot; {{ media.source }}

	</div>
</div>