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