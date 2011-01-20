{% extends "gryphon/base.tpl" %}


{% block title %} :: Blogs{% endblock %}
{% block active %}blogs{% endblock %}

{% block content %}
{% helper dswSync %}

<div class="grid_8">
	<h1>State News Blogs</h1>
	
	<p>
		State News Blog posts are the opinion of the author. The State News Editorial Board is not responsible for the content contained herein. <a href="{{ 'tsn:mail/4'|url }}">Let us know about your blog ideas</a>.
	</p>
	
	<hr class="spacer" />

<h2>Recent Posts</h2>
	
		{% fetch blogs from blog with [
				'limit': 3,
				'where': 'status = 1',
				'order': 'self:modified desc'
				] 
		%}	
	
	
	{% for blog in blogs %}


		{% set post = blog.mostRecent %}
		<h3><a href="{{ post.url }}">{{ post.headline }}</a></h3>
		
		<div class="small gray box">
			Blog: <a href="{{ blog.url }}" style="text-decoration:none">{{ blog.name }}</a>
			 <span class="byline_divider">|</span>
			 Last updated: {{ blog.modified|timeSince }}
			 <span class="byline_divider">|</span>
			By {{ post.authors.splat('name')|join(', ') }}
			<span class="byline_divider">|</span>
			<a href="{{ post.url }}">Read more &#187;</a>
		</div>	
		
		<p>
			{{ post.abstract_formatted }}
		</p>
		

		
	{% endfor %}
	

				
		<hr class="spacer" />
		
		
<h2>Recent Blogs</h2>
		
		{% fetch blogs from blog with [
				'where': 'status = 1',
				'order': 'self:modified desc'
				] 
		%}	
		
		{% for blog in blogs %}
		<h2 id="blogname"><a href="{{ blog.url }}">{{ blog.name }}</a>:</h2>


		{% set post = blog.mostRecent %}
		<h4><a href="{{ post.url }}">{{ post.headline }}</a></h4>
		
		
		<div class="small gray box landingsbox">
			By {{ post.authors.splat('name')|join(', ') }}<br />
				Last updated: {{ blog.modified|timeSince }}<br />
				<a href="{{ post.url }}">Read more &#187;</a>
		
		</div>
		
		<p>
			{{ post.abstract_formatted }}
		</p>


		
		<hr style="margin-bottom:2em;" />
		
	{% endfor %}
	
</div>

<div class="grid_4 standard-sidebar">
	{% include 'gryphon/main/sidebar-standard.tpl' %}
</div>

<hr class="spacer" />

{% endblock %}