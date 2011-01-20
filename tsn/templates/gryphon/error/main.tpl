{% extends 'gryphon/base.tpl' %}

{% block content %}
	{% helper config %}
	<div class="grid_8">
	
		<h3>Something has gone awry</h3>
		
		<p>
			Ahh man, looks like we've encountered an error. Don't worry it wasn't your fault. Try hitting your browser's back button and trying again.
		</p>
		<p>
			If you think something has gone very, very wrong, please contact our <a href="mailto:webmaster@statenews.com">web team</a> and let give them the following info:
		</p>
		<div class="gray box">
<pre>
	Type: {{ type|default('unknown') }}
	Query: {{ query }}
	Time: {{ now|date('c') }}
	UA: {{ ua }}
</pre>
		</div>
		
		<hr />
		
		{% if config.get('debug') %}
			<h5>Extended debug</h5>
			<div class="gray box">
				{{ message }}<br /><br />

				Backtrace:<br /><br />
				{% for item in backtrace %}
					{{ item.file }}[:{{ item.line }}] {{ item.function }}<br />
				{% endfor %}
			</div>
		{% endif %}
		
	</div>
	<div class="grid_4">
	
	</div>
	
	<hr class="spacer" />
{% endblock %}