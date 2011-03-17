{% extends "gryphon/base.tpl" %}
{% block title %} :: Work at The State News{% endblock %}

{% block content %}

<div class="grid_8">
	<h1>Work at The State News</h1>

	<p>The State News serves more than 60,000 readers every day with information through the newspaper and statenews.com. Here's a look behind the scenes at how several hundred students work together each day to publish The State News for the MSU community.</p>

	<div class="grid_4 alpha">
		<h3 class="box gray">Current Openings</h3>
		
		<p>
			The State News is currently seeking <strong>distribution drivers</strong>. Reliable transportation required, hours are from 6 a.m. to 8 a.m. Monday through Friday. Please submit completed <a href="http://statenews.com/docs/applications/app_distrib.pdf">application</a> to:<br />
			Distribution Manager<br />
			435 E. Grand River. Ave<br />
			East Lansing
		</p>		
		
		<hr />
		
		<p>
			The State News is currently hiring <strong>web designers and developers</strong>. Please send resume and work samples to <a href="mailto:webmaster@statenews.com">webmaster@statenews.com</a>.
		</p>
		
		<hr />
		
		<h3 class="box gray">Who we are</h3>

		<p>The State News is brought to you through the hard work of five departments:</p>
		
		<h4>Advertising</h4>
		
		<p>Advertising is responsible for generating $2 million annually for The State News. We're always looking for outgoing people who are self-motivated and have a strong desire to work.</p>
		
		<h4>Business Office</h4>
		
		<p>The business office provides support to all the other departments. We're also responsible for all financial matters relating to the newspaper.</p>
		
		<h4>Distribution</h4>
		
		<p>The distribution team is responsible for delivering The State News to MSU and the surrounding area.</p>
		
		<h4>Editorial</h4>
		
		<p>At its core, The State News is about just that - news. Reporters, Designers, Editors, Photographers and Interns work together to bring relevant and objective information to the MSU community.</p>
		
		<h4>Production</h4>
		
		<p>Production is vital to the creation and structure of both the daily edition and statenews.com. Without this department the paper would never make it to circulation every day.</p>
	</div>
	<div class="grid_4 omega">
	<h3 class="box gray">Requirements</h3>
		
		<p>To work at The State News, you must be a currently enrolled MSU student, and you must be available to work at least one full semester (two for the Production department).</p>
		
		<p>In general, you must provide a resume in Microsoft Word, RTF, or Adobe PDF format, a physical or online portfolio, and an MSU class schedule to be considered for employment (requirements may vary by department).</p>
	
		<p>You may <a href="{{ 'gryphon:page/contact'|url }}">contact</a> The State News if you have any questions regarding employment.</p>
		
		<h3 class="box gray">Conflict of Interest Policy</h3>
		
		<p><a href="{{ 'gryphon:page/coi'|url }}">Important information regarding our Conflict of Interest Policy.</a></p>
		<h3 class="box gray">Applications</h3>
		
		<ul id="app_pdfs">
			<li><a href="http://statenews.com/docs/applications/app_ad_exec.pdf">Advertising</a></li>
			<li><a href="http://statenews.com/docs/applications/app_reception.pdf">Business Office</a></li>
			<li><a href="http://statenews.com/docs/applications/app_distrib.pdf">Distribution</a></li>
			<li><a href="http://statenews.com/docs/applications/app_editorial.pdf">Editorial</a></li>
			<li><a href="http://statenews.com/docs/applications/photo_app.pdf">Photo</a></li>
			<li><a href="http://statenews.com/docs/applications/app_production.pdf">Production</a></li>
		</ul>
	</div>
</div>

<div class="grid_4">
	{% include 'gryphon/main/sidebar-standard.tpl' %}
</div>

<div class="clear"></div>

{% endblock content %}