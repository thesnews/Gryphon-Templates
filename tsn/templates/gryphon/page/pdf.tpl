{% extends "gryphon/base.tpl" %}
{% block title %} :: Recent Front Page Archive{% endblock %}

{% block content %}

<div class="grid_8">

	<h1>Recent section front pages</h1>
	
	<p>
		The ten most recent front page PDFs for our print edition are available for download. To find more front page PDFs, please use our <a href="{{ 'gryphon:search'|url }}?a=1&ty=media&tg=pdf">advanced search</a>.
	</p>
	
	<hr class="spacer" />
	{% set pages = [
		'Section A': ['pdf', 'frontpage'],
		'Sports': ['pdf', 'sports'],
		'Features': ['pdf', 'features']
	] %}
	
	
	{% for label, tags in pages %}
	
		{% fetch fronts from gryphon:media with [
			'limit': 10,
			'order': 'media:created desc',
			'withTags': tags
		] %}
		
		<hr />
		
		<h4>{{ label }} front pages</h4>

		<hr class="spacer" />

		<table width="95%" style="width:95%">
		<tr>
		{% for doc in fronts %}
			{% if loop.index0 % 4 == 0 %}
				</tr><tr>
			{% endif %}
			<td style="padding-bottom:20px;">
				<a href="{{ doc.urlOriginal }}"><img src="{{ doc.urlThumbnail }}" alt="{{ doc.name }}" /></a><br />
				{{ doc.created|date('l') }}<br />
				{{ doc.created|date('M d, Y') }}
			</td>
		{% endfor %}
		</tr>
		</table>

	{% endfor %}
	
</div>

<div class="grid_4">
	{% include 'gryphon/main/sidebar-standard.tpl' %}
</div>

<div class="clear"></div>

{% endblock content %}