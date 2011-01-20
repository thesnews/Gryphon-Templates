<img src="{{ 'style/gryphon/images/expandable_close.png'|url }}" class="close" />
{% import 'macros/render.tpl' as render %}
<div>
	{{ render.media(media) }}

	<div class="caption small">
		{{ media.caption_formatted }}
	</div>
	<script type="text/javascript">
		setTimeout(function() {
			VideoJS.setup('video_{{ media.uid }}');
		}, 1000);
	</script>

</div>


<hr />
