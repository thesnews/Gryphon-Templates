{% extends 'gryphon/base.tpl' %}

{% block title %} :: Housing Guide{% endblock %}
{% block active %}{% endblock %}
{% block subActive %}Housing Guide{% endblock %}

{% block styles %}
	<link rel="stylesheet" type="text/css" media="screen" href="{{ 'roost/frontend/style/screen/master.css'|url }}" />
{% endblock %}

{% block content %}
	{% helper adpilotHelper as ads %}
	
	<div class="grid_8">
	
		<div id="housing_finder_header">
			<a href="{{ 'roost:roost'|url }}"><img src="{{ 'roost/frontend/style/images/housing-header.gif'|url }}" alt="SN Housing Guide" style="border:0;" border="0" /></a>
			<div id="housing_sponsor">{{ ads.display('housingsponsor') }}</div>
		</div>
	
		<hr class="spacer" />
	
		<h2>Housing Guide Mobile</h2>
		
		<img src="{{ 'roost/frontend/style/images/mobile_views.gif'|url }}" style="float:left;padding:0 20px 20px 0;" />
		
		<p>
			<img src="{{ 'roost/frontend/stylev2/images/apple-touch-icon-72x72-precomposed.png'|url }}" style="float:right;margin:0 0 .5em .5em;" />
			With the mobile version of the Housing Guide you'll get quick access to all of our listings, complete with contact info, maps and links to driving directions, from wherever you are. The Housing Guide is designed to work on any internet capable mobile device. Just head over to <a href="http://statenews.com/housing">http://statenews.com/housing</a>.
		</p>
		
		<p>
			The Housing Guide works great on iPhone, iPod Touch, iPad, Android and WebOS based phones and tablets, newer Blackberries and Windows Phone.
		</p>
		
		<p>
			We're constantly working on improving our mobile experience across the entire site, so if you have questions, comments or concerns please do not hesitate to <a href="mailto:webmaster@statenews.com">let us know</a>.
		</p>
		
	</div>
	<div class="grid_4">
		{% include 'gryphon/main/sidebar-short.tpl' %}
	</div>
	<hr class="spacer" />
	
{% endblock %}