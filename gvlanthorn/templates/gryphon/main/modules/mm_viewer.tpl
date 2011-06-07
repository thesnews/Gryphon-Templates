		{% fetch multimedia from media with [
			'limit': 1,
			'order': 'self:weight desc, self:created desc',
		] %}
		<div class="mod-head">
			<h4>Featured Multimedia</h4>
		</div>

			{% for media in multimedia %}
			<div class="mmb">
					<a href="{{ media.urlDefault }}"><img src="{{ media.urlPreview }}" alt="{{ media.title }}" /></a>
			</div>
			<h3 class="mmb"><a href="{{ media.urlDefault }}">{{ media.title }}</a></h3>
			{% endfor %}
		
		
		{% fetch multimedia from media with [
			'limit': 6,
			'order': 'self:weight desc, self:created desc',
		] %}

			<ul class="wrap mmb">
			
			{% set topPost = multimedia.shift() %}

			{% for media in multimedia %}
				<li>
					<img src="{{ media.type }}.png" alt="{{ media.type }}" />&nbsp;&nbsp;<a href="{{ media.urlDefault }}">{{ media.title }}</a>&nbsp;&nbsp;<span class="aside dateline">{{ media.created|date('M d') }}</span>
				</li>
			{% endfor %}
			</ul>		
		
		
		
