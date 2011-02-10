{% for media in multimedia %}


<ul class="multimedia-box">

	<li id="{{ media.title }}">
		<div class="dark">
			<img src="{{ media.url }}" alt="{{ media.title }}" />
		</div>
		<div class="caption">
			<h3>{{ media.title }}</h3>
			<p>{{ media.caption|clip(100) }}</p>
		</div>
	</li>

</ul>	

<ul>
	<li>
	<a href="#{{ media.title }}">{{ media.title }}</a>
	</li>
</ul>
	
{% endfor %}