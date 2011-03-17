{% helper adpilotHelper as ads %}
{% set ad = ads.display('featuredclasssponsor') %}

{% if ad %}
<div class="advertisement classsponsor">
	{{ ad }}
</div>
{% endif %}