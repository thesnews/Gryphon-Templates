<script type="text/javascript">
	if( !window._APLoad ) {
		Asset.javascript("{{ 'flash/wpaudio/audio-player.js'|url }}", {
			events: {
				load:  function(){

					AudioPlayer.setup("{{ 'flash/wpaudio/player.swf'|url }}", {  
						width: 200  
					});
					window._APInit = true;
				}
			}
		});
	}
	_APLoad = true;
</script>
<div class="audio" id="audioplayer_{{ media.uid }}">Loading...</div>
<script type="text/javascript">
	to_{{ media.uid }} = setInterval(function() {
		if( !window._APInit ) {
			return;
		}

		clearInterval(to_{{ media.uid }});
		$('audioplayer_{{ media.uid }}').set('text', '');

		AudioPlayer.embed("audioplayer_{{ media.uid }}", {
			soundFile: "{{ media.urlOriginal }}",
			titles: "{{ media.title }}",
			artists: "{{ media.source }}"
		});
	}, 1000);
</script>  