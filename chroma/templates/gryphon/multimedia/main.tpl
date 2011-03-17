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
				<li>
					<div>
						<a href="#" class="tab-header">
							Images
						</a>
					</div>
					<div class="bullet">

this is image content
					</div>
				</li>
				<li>
					<div>
						<a href="#" class="tab-header">
							video
						</a>
					</div>
					<div class="bullet">

this is video content
					</div>
				</li>
				<li>
					<div>
						<a href="#" class="tab-header">
							sound
						</a>
					</div>
					<div class="bullet">

this is sound content
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
