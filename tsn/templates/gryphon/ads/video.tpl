{% helper adpilotHelper as ads %}
{% set ad = ads.display('videosponsor') %}

{% if ad %}
	<div class="advertisement videosponsor">
		{{ ads.display('videosponsor') }}
	</div>
{% endif %}