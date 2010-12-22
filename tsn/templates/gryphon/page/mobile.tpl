{% extends "gryphon/base.tpl" %}

{% block title %} :: Mobile{% endblock %}

{% block content %}

<div class="grid_8">


<h1>State News Mobile</h1>
	
<p>
	<img src="{{ 'style/gryphon/images/mobile_devices.png'|url }}" alt="Mobile Devices" style="float: right;" />
	The State News mobile edition is available on any internet capable cell phone or mobile device. Simply visit <a href="http://statenews.com">statenews.com</a> on your phone to see the mobile enhanced version, no downloads required.
</p>
<p>
	We're constantly working to improve and extend our mobile presence, so please feel free to contact us with suggestions or issues at <a href="mailto:webmaster@statenews.com">webmaster@statenews.com</a>. 
</p>

<p>
	You can access the mobile version in any browser at <a href="http://statenews.com/m">statenews.com/m</a>.
</p>

<h3>What is available on the mobile site?</h3>

<p>
	Currently, you can access all of the articles from the standard web edition, including breaking news and archives going back to 2000. You can also view our online classifieds as well as get quick access to our Facebook page and Twitter feed.
</p>

<p>
	We're working to improve our mobile site, so if you have any suggestions or feedback please <a href="mailto:webmaseter@statenews.com">let us know</a>.
</p>

<h3>The mobile version doesn't come up on my phone.</h3>

<p>
	First, simply point your browser to <a href="http://statenews.com/m">statenews.com/m</a> to force your browser to use the mobile version. Then, contact us at <a href="mailto:webmaster@statenews.com">webmaster@statenews.com</a> and tell us what phone and/or browser you're using.
</p>

<p>
	The mobile version should work properly on any internet capable mobile device. We do our best to test on every available phone, but we can't test everything so your feedback is extremely important.
</p>
	
</div>

<div class="grid_4">
	{% include 'gryphon/main/sidebar-standard.tpl' %}
</div>

<div class="clear"></div>

{% endblock content %}