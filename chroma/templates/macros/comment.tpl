{% macro list(item) %}

	{% helper commentHelper %}

	{% set comments = commentHelper.commentsFor(item) %}
	
	{% set showAdmin = commentHelper.userHasSession() %}

	{% for comment in comments %}
	
	<p>{{ comment.comment_formatted }}</p>
					
						<div class="byline">
						<h3>- {{ comment.name }}</a></h3>
						<span class="date">{{ comment.created|date('M d, Y') }}</span><br />
						<a href="{{ ('gryphon:comment/flag/'~comment.hash)|url }}" class="report">Report</a>
						</div>
			
	{% endfor %}
	
	{% macro pagers(item) %}

	{% helper commentHelper %}
	
	{% set pages = commentHelper.pagesFor(item) %}

	{% for label, url in pages %}
		<a href="{{ url }}">{{ label }}</a>
	{% endfor %}

{% endmacro %}

{% endmacro %}