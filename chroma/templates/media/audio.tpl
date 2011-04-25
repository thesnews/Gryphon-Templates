<div>
	<div  id="soundplayer">
	

	<script type="text/javascript" src="{{ 'flash/wpaudio/audio-player.js'|url }}"></script>  
<script type="text/javascript">
	if( !window._APInit ) {
		AudioPlayer.setup("{{ 'flash/wpaudio/player.swf'|url }}", {  
			width: 290  
		});
		_APInit = true;
	}
</script>
<div class="audio" id="audioplayer_{{ media.uid }}"></div>
<script type="text/javascript">  
	AudioPlayer.embed("audioplayer_{{ media.uid }}", {
		soundFile: "{{ media.urlOriginal }}",
		titles: "{{ media.title }}",
		artists: "{{ media.source }}"
	});  
</script>  
	
	
	</div>
	
	<div>
		<h2>{{ media.title }}</h2>
	
		<div class="dark byline">
			{{ media.fileType|capitalize }}:
			{% if media.authors.length %}
			<a class="author">{{ media.authors.splat('name')|join(', ') }}</a>
			{% endif %}
			<span class="date">{{ media.created|date('M d, Y') }}</span>
		</div>
		{{ media.caption_formatted }}
		
	</div>
</div>
