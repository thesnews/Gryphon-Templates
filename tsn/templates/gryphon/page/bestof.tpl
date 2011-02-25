{% extends 'gryphon/base.tpl' %}

{% block styles %}
	<link rel="stylesheet" type="text/css" media="screen, projection" href="{{ 'bestof:main/support.css'|url }}" />
{% endblock %}


{% block content %}
<div class="grid_8">
	<img src="{{ 'style/gryphon/images/bestof/bestof_header.png'|url }}" alt="The Best of MSU" style="margin-left: -40px; margin-bottom: -10px;" />

	<p>
		Welcome to the <strong>2011 Best of MSU</strong>. Vote for your favorite places in over 60 categories, including "Best Restaurant for a Date", "Best Place to Be Spoiled By Your Parents", "Best Dance Spot", "Best Massage" and "Best Bartender".
		<br /><br />
		After voting in at least 20 categories, you'll receive a special coupon page for local businesses.
	</p>
	
	<p>
		Voting begins <strong>February 1</strong> at <a href="http://statenews.com/bestof">statenews.com/bestof</a>.		
	</p>
</div>
<div class="grid_4">
	{% include 'gryphon/main/sidebar-short.tpl' %}
</div>
<hr class="spacer" />

{% endblock %}