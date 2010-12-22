{% if media.pathOriginalMp4|exists %}
	{# video-js #}
	{# we're loading the VideoJS Javascript, CSS and initializer in the
	   base.tpl file, FYI #}

	<!-- Begin VideoJS -->
	<div class="video-js-box">
	  <video id="video_{{ media.uid }}" class="video-js shadow-item" width="605" height="340" poster="{{ media.urlFull }}" controls preload>
		<source src="{{ media.urlOriginalMp4 }}" type='video/mp4; codecs="avc1.42E01E, mp4a.40.2"'>
		<source src="{{ media.urlOriginalOgg }}" type='video/ogg; codecs="theora, vorbis"'>
		<!-- Flash Fallback. Use any flash video player here. Make sure to keep the vjs-flash-fallback class. -->
		
		{# loads jw-player as a fallback #}
		<object class="vjs-flash-fallback" width="605" height="340" type="application/x-shockwave-flash"
		  data="{{ 'flash/jwplayer/player-viral.swf'|url }}">
		  <param name="movie" value="{{ 'flash/jwplayer/player-viral.swf'|url }}" />
		  <param name="allowfullscreen" value="true" />
		  <param name="flashvars" value='file={{ media.urlOriginalFlv }}&image={{ media.urlFull }}&viral.callout=always&viral.onpause=false&viral.link={{ media.urlDefalut }}' />
		  <!-- Image Fallback. Typically the same as the poster image. -->
		  <img src="{{ media.urlFull }}" width="605" height="340" alt="Poster Image"
			title="No video playback capabilities." />
		</object>
	  </video>
	  <!-- Download links provided for devices that can't play video in the browser. -->
		<!-- Support VideoJS by keeping this link. -->
		<br />
		<a href="http://videojs.com"><img class="noborder" src="{{ 'style/gryphon/images/videojs-link.png'|url }}" /></a>
		<span style="display:none"><a href="http://videojs.com">HTML5 Video Player</a> by VideoJS</span>
	  </p>
	</div>
	<!-- End VideoJS -->
{% else %}
	
	{# this file doesn't have a MP4 and/or OGG version #}
    <object width="605" height="340" type="application/x-shockwave-flash"
      data="{{ 'flash/jwplayer/player-viral.swf'|url }}" class="shadow-item">
      <param name="movie" value="{{ 'flash/jwplayer/player-viral.swf'|url }}" />
      <param name="allowfullscreen" value="true" />
      <param name="flashvars" value='file={{ media.urlOriginalFlv }}&image={{ media.urlFull }}&viral.callout=always&viral.onpause=false&viral.link={{ media.urlDefalut }}' />
      <!-- Image Fallback. Typically the same as the poster image. -->
      <img src="{{ media.urlFull }}" width="605" height="340" alt="Poster Image"
        title="No video playback capabilities." />
    </object>


{% endif %}

	<div class="info small">
		<span>{{ media.authors.splat('name')|join(', ') }}
		&middot; {{ media.source }}</span>
		
		<span>Posted: {{ media.created|timeSince }}</span>

		<span><a href="{{ media.urlDefault }}">Link to this</a></span>
		
		<span><a href="{{ 'gryphon:multimedia/video'|url }}">More video</a></span>
	</div>
	

