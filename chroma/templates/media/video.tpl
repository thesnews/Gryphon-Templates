<div>
	<div id="videoplayer">
{% if media.pathOriginalMp4|exists %}
	{# video-js #}
	{# were loading the VideoJS Javascript, CSS and initializer in the
	   base.tpl file, FYI #}

	<!-- Begin VideoJS -->
	<div class="video-js-box">
	  <video id="video_{{ media.uid }}" class="video-js shadow-item" width="300" poster="{{ media.urlFull }}" controls preload>
		<source src="{{ media.urlOriginalMp4 }}" type='video/mp4; codecs="avc1.42E01E, mp4a.40.2"'>
		<source src="{{ media.urlOriginalOgg }}" type='video/ogg; codecs="theora, vorbis"'>
		<!-- Flash Fallback. Use any flash video player here. Make sure to keep the vjs-flash-fallback class. -->
		
		{# loads jw-player as a fallback #}
		<object class="vjs-flash-fallback" width="300" type="application/x-shockwave-flash"
		  data="{{ 'flash/jwplayer/player-viral.swf'|url }}">
		  <param name="movie" value="{{ 'flash/jwplayer/player-viral.swf'|url }}" />
		  <param name="allowfullscreen" value="true" />
		  <param name="flashvars" value='file={{ media.urlOriginalFlv }}&image={{ media.urlFull }}&viral.callout=always&viral.onpause=false&viral.link={{ media.urlDefalut }}' />
		  <!-- Image Fallback. Typically the same as the poster image. -->
		  <img src="{{ media.urlFull }}" width="305" alt="Poster Image"
			title="No video playback capabilities." />
		</object>
	  </video>
	  <!-- Download links provided for devices that can't play video in the browser. -->
		<!-- Support VideoJS by keeping this link. -->
	</div>
	<!-- End VideoJS -->
{% else %}
	
	{# this file doesnt have a MP4 and/or OGG version #}
    <object width="300" height="170" type="application/x-shockwave-flash"
      data="{{ 'flash/jwplayer/player-viral.swf'|url }}" class="shadow-item">
      <param name="movie" value="{{ 'flash/jwplayer/player-viral.swf'|url }}" />
      <param name="allowfullscreen" value="true" />
      <param name="flashvars" value='file={{ media.urlOriginalFlv }}&image={{ media.urlFull }}&viral.callout=always&viral.onpause=false&viral.link={{ media.urlDefalut }}' />
      <!-- Image Fallback. Typically the same as the poster image. -->
      <img src="{{ media.urlFull }}" width="305" height="170" alt="Poster Image"
        title="No video playback capabilities." />
    </object>


{% endif %}
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