{% macro list(item) %}

	{% helper commentHelper %}
	{% set comments = commentHelper.commentsFor(item) %}
	
	<h3>Commentary</h3>
	
	<p>Add your $0.02, <a href="#comment_form">go to the comment form</a> or follow the <a href="{{ item.url }}.xml" class="feed_link">comment feed</a></p>
	
	{% set showAdmin = commentHelper.userHasSession() %}

	{% for comment in comments %}
		<div id="comment{{ comment.uid }}">
			<div class="grid_2 alpha">
				<h5 class="comment_user">{{ comment.name }}</h5>
				<span class="small">({{ comment.created|timeSince }})</span><br />
				<a href="{{ ('gryphon:comment/flag/'~comment.hash)|url }}" class="small">Report</a>
				{% if showAdmin %}
					<br />
					<a href="{{ comment.getEditURL() }}">Manage</a>
				{% endif %}
			</div>
			<div class="grid_6 omega">
				<div class="gray box">
					<img class="comment_beak" src="{{ 'style/gryphon/images/beak_comment.png'|url }}" alt="Comment" />
					{{ comment.comment_formatted }}
				</div>
				{% if showAdmin %}
					<div class="quiet small">
						Flagged: {{ comment.flagged|int2noun('time') }} | {{ comment.email }} | {{ comment.ip }}
					</div>
				{% endif %}
			</div>
		</div>
		<div class="clear"></div>
		<hr class="spacer" />	
	{% endfor %}
	
	{% macro pagers(item) %}

	{% helper commentHelper %}
	
	{% set pages = commentHelper.pagesFor(item) %}

	{% for label, url in pages %}
		<a href="{{ url }}">{{ label }}</a>
	{% endfor %}

{% endmacro %}

{% endmacro %}