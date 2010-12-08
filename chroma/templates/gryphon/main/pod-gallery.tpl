{% helper dswSync %} {# bring the 'dswSync' helper into the macro context #}
<div id="pod_container" class="gray box">
	{% fetch podGallery from gallery with [
		'where': 'self:slug = "photos_of_the_week"',
		'order': 'self:created desc',
		'limit': 1
	] %}
	
	<h5>{{ podGallery[0].title|upper }}:<span><a href="http://reprints.statenews.com">More reprints &#187;</a></span></h5>

	<ul id="pow-box">
		{% for media in podGallery[0].media %}
			<li>
				<a href="{{ dswSync.buyUrl(media) }}"><img src="{{ media.urlPreview }}" alt="{{ media.title }}" /></a>
				<p>
					{{ media.caption|clip }}
				</p>
			</li>
		{% endfor %}
	</ul>
	<p>
		Available for purchase today at <a href="http://reprints.statenews.com">State News Reprints</a>.
	</p>

</div>