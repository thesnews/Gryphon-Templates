{% extends "gryphon/base.tpl" %}

{% block title %} :: Multimedia{% endblock %}
{% block active %}multimedia{% endblock %}
{% block subActive%}{{ subActive }}{% endblock %}

{% block content %}

{% import 'macros/render.tpl' as mediaRender %}

{% set topMedia = media.shift() %}

<div class="grid_12">
		<div class="grid_8 alpha" id="top_media">
		 	
			
			{{ mediaRender.media(topMedia) }}
			
			<div>
			<h3>Related:</h3>
			<ul>
			{% if topMedia.articles.length %}
			{% else %}
				<li>Sorry, no related articles or media. </li>
			{% endif %}
			{% for item in topMedia.articles %}
				<li><a href="{{ item.url }}">{{ item.headline }}</a></li>
			{% endfor %}
			</ul>
			</div>
			
			
		</div>
		 
		<div class="grid_4 omega">
		{% include 'gryphon/main/box.tpl' %}
		</div>
</div>
<div class="grid_12" id="secondary">
	<div class="grid_9 alpha">
		<div id="multipage">
			<ul class="tab-box">
				<li class="image">
					<div>
						<a href="#">
						<h1>Images</h1>
						</a>
					</div>
					<div class="bullet">
						<div>
						<br />
							<ul>
								{% fetch media from media with [
									'limit': '6',
									'order': 'weight desc, created desc',
									'where': 'type = "image"'
									
									]
								%}
						 		
						 		{% for i in 0..(media.length-1) %}
									{% set item = media[i] %}
						 								
								{% if i%3 == 0 %}
									<div class="grid_3 alpha">
								{% elseif (i-2)%3 == 0 %}
									<div class="grid_3 omega">
								{% else %}
									<div class="grid_3">
								{% endif %}

						 		<li>
								<a href="{{ item.urlDefault }}"><img src="{{ item.url }}" alt="{{ item.title }}"></a>
								<h3><a href="{{ item.urlDefault }}">{{ item.title }}</a></h3>
								<div class="byline dark">
								<p>Posted: {{ item.created|date('M d, Y') }}
								</div>
								{{ item.description|clip(100) }}</p><br />
								</li>
								
								</div>
													
								{% if (i-2)%3 == 0 %}
								<div class="clear"></div>
								{% endif %}
								
								{% endfor %}	
								
							</ul>

					
						</div>
					</div>
				</li>
				<li class="video">
					<div>
						<a href="#" class="tab-header">
						<h1>Videos</h1>
						</a>
					</div>
					<div class="bullet video_bullet">
						<br />
						<div>
						<ul>
							{% fetch media from media with [
									'limit': '6',
									'order': 'weight desc, created desc',
									'where': 'type = "video"'
									]
								%}
						 		
						 		{% for i in 0..(media.length-1) %}
									{% set item = media[i] %}
						 								
								{% if i%3 == 0 %}
									<div class="grid_3 alpha">
								{% elseif (i-2)%3 == 0 %}
									<div class="grid_3 omega">
								{% else %}
									<div class="grid_3">
								{% endif %}

						 		<li>
								<a href="{{ item.urlDefault }}"><img src="{{ item.url }}" alt="{{ item.title }}"></a>
								<h3><a href="{{ item.urlDefault }}">{{ item.title }}</a></h3>
								
								<div class="byline dark">
								<p>Posted: {{ item.created|date('M d, Y') }}
								</div>					
								{{ item.description|clip(100) }}</p><br />
								</li>
								
								</div>
								
								{% if (i-2)%3 == 0 %}
								<div class="clear"></div>
								<br />
								{% endif %}
								
								{% endfor %}	
						</ul>	

	
						</div>
					</div>
				</li>
				<li class="audio">
					<div>
						<a href="#" class="tab-header">
						<h1>Sound Clips</h1>
						</a>
					</div>
					<div class="bullet">
						<br />
						<div>
						<ul>
								{% fetch media from media with [
									'limit': '9',
									'order': 'weight desc, created desc',
									'where': 'type = "audio"'
									]
								%}
						 		
						 		{% for i in 0..(media.length-1) %}
									{% set item = media[i] %}
						 								
								{% if i%3 == 0 %}
									<div class="grid_3 alpha">
								{% elseif (i-2)%3 == 0 %}
									<div class="grid_3 omega">
								{% else %}
									<div class="grid_3">
								{% endif %}
						 		
						 		<li>
						 		
								<h3>
								<a href="{{  item.urlDefault  }}">
								{{ item.title }}
								</a>
								</h3>
								
								<div class="byline dark">
								<p>Posted: {{ item.created|date('M d, Y') }}
								</div>
								
								
								{{ item.description|clip(100) }}</p>
							
								<div class="clear"></div>
								</li>
								</div>
								
								{% if (i-2)%3 == 0 %}
								<div class="clear"></div>
								<br />
								{% endif %}
								
								{% endfor %}		
				
							</ul>
								
						</div>
					</div>
				</li>
				
			</ul>
		</div>
	</div>
	<div class="grid_1">
	&nbsp;
	</div>
	<div class="grid_2 omega">
				<img src="{{ 'style_chroma/images/ads/skyscraper.png'|url }}" alt="advertisement" />
	</div>
</div>

{% endblock content %}
