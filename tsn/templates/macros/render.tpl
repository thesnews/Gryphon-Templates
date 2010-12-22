{% macro media(media, type) %}
	
	{% set file = type|default(media.fileType) %}
	
	{% if file %}
		{% set pth %}media/{{ file }}.tpl{% endset %}
		
		{% include pth %}
	{% endif %}
	

{% endmacro %}
