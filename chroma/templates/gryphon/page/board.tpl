{% extends "gryphon/base.tpl" %}
{% block title %}:: Employment : Board of Directors{% endblock %}


{% block active %}{% endblock %}
{% block subActive %}{% endblock %}

{% block content %}

	<div class="grid_8">
		<div class="grid_5 alpha">
			<h1>State News Board of Directors</h1>
		
			<p>	
				State News, Inc. is a Michigan non-profit corporation directed by a twelve member Board of Directors.
			</p>
			<p>
				The Board is legally and financially responsible for The State News and statenews.com. However, as a matter of policy, the Board is not involved in the day-to-day operations of the newspaper or website. The Board works to ensure the financial and editorial independence of the publications by:
		
				<ul class="bullet">
				<li>Setting broad policy and long-term goals.</li>
				<li>Selecting the top management of The State News including the general manager and the student positions of Editor-in-Chief and Advertising Manager.</li>
				</ul>
			</p>
	
			<p>
				Of the twelve members of the Board, three are employed full-time in the print media or with recent full-time experience in the print media, and, if possible, are alumni of Michigan State University; three are Michigan State University employees - either tenure stream faculty, faculty emeriti, or professional staff with job security as defined by the university; and six are undergraduate or graduate students registered at Michigan State University who are not employed by The State News.
			</p>
			<p>
				Board members serve a two-year term with elections occurring each September. In even numbered years (i.e. 2000), one professional, two faculty/staff and three students are elected. In odd numbered years (i.e. 2001), two professionals, one faculty/staff and three students are elected. Board members may serve an indefinite number of consecutive terms and students may serve consecutive terms provided they remain registered at Michigan State University.
			</p>
			<p>
				For more information about serving on the State News Board of Directors including downloadable applications, see forms on the left.
			</p>
		
		</div>
		<div class="grid_3 omega">
			<div class="box gray">
				<!--<h4>Application Deadline</h4>
				
				<p>Wednesday, January 20th at 5pm</p>
		
				<hr class="spacer" />-->
				
				<h4>Download applications</h4>
				<p>
				<ul class="bullet">
					<li><a href="/docs/applications/application_board_faculty.pdf">Professional &amp; faculty/staff application</a></li>
					<li><a href="/docs/applications/application_board_student.pdf">Student application</a></li>
					<li><a href="/docs/applications/conflict_interest.pdf">Conflict of Interest document</a></li>
				</ul>
				</p>
			</div>
		</div>
	</div>
	<div class="grid_4">
		{% include 'gryphon/main/sidebar-short.tpl' %}
	</div>
	
	<hr class="spacer" />	
{% endblock %}
