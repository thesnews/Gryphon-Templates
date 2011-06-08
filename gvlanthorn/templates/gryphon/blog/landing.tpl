{% extends "gryphon/base.tpl" %}


{% block title %} :: Blogs{% endblock %}
{% block active %}blogs{% endblock %}

{% block content %}
{% helper dswSync %}

<div class="grid_8">
	<h1>Grand Valley Lanthorn Blogs</h1>
		
	<div class="mmb">&nbsp;</div>
	
	<div class="body-copy boot mb">
		<p>Opinions expressed in blog posts are those of the authors, and not of Grand Valley Lanthorn.</p>
	</div>

		{% fetch blogs from blog with [
				'where': 'status = 1',
				'order': 'self:modified desc'
				] 
		%}	
			
		{% for i in 0..(blogs.length-1) %}
		{% set blog = blogs[i] %}
			
		{% if i%2 == 1 %}
			<div class="grid_4 omega">
		{% else %}
			<div class="grid_4 alpha">
		{% endif %}

			
			<div class="mod-head">
				<h4><a href="{{ blog.url }}">{{ blog.name }}&raquo;</a></h4>
			</div>

			<div class="mod mb">
				<div class="inner">
				
					<div class="caption mb">
						{{ blog.description_formatted }}
					</div>
					
	
					<div><span class="byline aside"><a href="{{ blog.url }}">{{ blog.posts.length }} entries</a> | <img src="{{ 'style/assets/29.png'|url }}" style="position:relative;top:3px;" alt="icn" /> <a href="{{ blog.url }}.xml">Subscribe</a> | Updated:</span> <span class="dateline  aside">{{posts.created|date('M d') }}</span></div>
				</div>
			</div>
		</div>		
		
			{% if i%2 == 1 %}
			<div class="clear"></div>
			{% endif %}
	
				
			{% endfor %}
			


</div>

<div class="grid_4">
	{% include 'gryphon/main/side_bar.tpl' %}
</div>

<div class="clear">&nbsp;</div>

{% endblock %}