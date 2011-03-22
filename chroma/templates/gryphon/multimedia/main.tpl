{% extends "gryphon/base.tpl" %}

{% block title %} :: Multimedia{% endblock %}
{% block active %}multimedia{% endblock %}
{% block subActive%}{{ subActive }}{% endblock %}

{% block content %}

{% import 'macros/render.tpl' as mediaRender %}

{% set topMedia = media.shift() %}

<div class="grid_12">
	<div class="grid_8 alpha">
		<div id="multipage">
			<ul class="tab-box">
				<li class="image">
					<div>
						<a href="#">
							Images
						</a>
					</div>
					<div class="bullet">
						<div>
						<h2>Images</h2>
						<br />
							<ul>
								{% fetch media from media with [
									'limit': '20',
									'order': 'weight desc, created desc',
									'where': 'status = 1'
									]
								%}
						 		
						 		{% for media in media %}
						 								 		
						 		{% if media.title %}
						 		
						 		<li>
						 		
								<img src="{{ media.url }}" alt="{{ media.title }}">
								
								
								<h3><a href="{{ media.url }}">{{ media.title }}</a></h3>
								<p>{{ media.type|capitalize }} | Posted: {{ item.created|date('M d, Y') }}
								{{ media.description|clip(100) }}</p><br />
							
								<div class="clear"></div>
								</li>
								
								{% endif %}
								
								{% endfor %}		
							</ul>
						</div>
					</div>
				</li>
				<li class="video">
					<div>
						<a href="#" class="tab-header">
							video
						</a>
					</div>
					<div class="bullet">
						<div>
						<h2>Videos</h2>
						</div>
					</div>
				</li>
				<li class="sound">
					<div>
						<a href="#" class="tab-header">
							sound
						</a>
					</div>
					<div class="bullet">
						<div>
						<h2>Sound Clips</h2>
						</div>
					</div>
				</li>
				
			</ul>
		</div>
	</div>
	<div class="grid_4 omega">
		{% include 'gryphon/main/box.tpl' %}
		<img src="{{ 'style_chroma/images/ads/square.png'|url }}" alt="advertisement"/>
	</div>
</div>

{% endblock content %}
