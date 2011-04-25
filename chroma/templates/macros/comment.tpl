{% macro list(item) %}

	{% helper commentHelper %}

	{% set comments = commentHelper.commentsFor(item) %}
	
	{% set showAdmin = commentHelper.userHasSession() %}

	{% for comment in comments %}
	
	<div class="comments">
		<p>{{ comment.comment_formatted }}</p>
					
		<div>
		<h2>- {{ comment.name }}</h2>
		<span>{{ comment.created|date('M d, Y') }}</span>
		</div>
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