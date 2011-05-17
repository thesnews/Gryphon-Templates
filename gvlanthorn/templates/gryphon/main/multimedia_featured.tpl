<div class="mod-head">
		<h4>Featured Multimedia</h4>
		</div>

		<div class="mmb">
		<img src="/media/00/00/00/49/4907_Orchestra2_small.png" alt="Orchestra Concert 4/20/2011" />
		</div>

		<h3 class="mmb"><a href="/index.php/multimedia/4907">Orchestra Concert 4/20/2011</a></h3>

		<ul class="wrap mmb">
			<li>
					<img src="/gfn-lanthorn/assets/icons/video.png" alt="video" />
				
		
		&nbsp;&nbsp;<a href="/index.php/multimedia/4884">Spring Dance Concert</a>&nbsp;&nbsp;<span class="dateline aside">APR&nbsp;17</span></li>
			<li>
					<img src="/gfn-lanthorn/assets/icons/photo.png" alt="Gallery" />
				
		
		&nbsp;&nbsp;<a href="http://www.lanthorn.com/index.php/gallery/spring_dance">Spring Dance</a>&nbsp;&nbsp;<span class="dateline aside">APR&nbsp;17</span></li>

			<li>
					<img src="/gfn-lanthorn/assets/icons/photo.png" alt="Gallery" />
				
		
		&nbsp;&nbsp;<a href="http://www.lanthorn.com/index.php/gallery/spring_football_game">Spring Football Game</a>&nbsp;&nbsp;<span class="dateline aside">APR&nbsp;17</span></li>
			<li>
					<img src="/gfn-lanthorn/assets/icons/video.png" alt="video" />
				
		
		&nbsp;&nbsp;<a href="/index.php/multimedia/4821">GV&#039;s Students for a Sensible Drug Policy Plans a Peaceful Protest of the Drug War</a>&nbsp;&nbsp;<span class="dateline aside">APR&nbsp;14</span></li>

			<li>
					<img src="/gfn-lanthorn/assets/icons/video.png" alt="video" />
				
		
		&nbsp;&nbsp;<a href="/index.php/multimedia/4794">Battle of the DJs - the First Five Performers</a>&nbsp;&nbsp;<span class="dateline aside">APR&nbsp;10</span></li>
	</ul>

<div class="aside2 mb" style="text-align:right"><a href="/index.php/multimedia/">SEE MORE MULTIMEDIA &raquo;</a></div>

<ul class="multimedia-box">
{% for media in multimedia %}
	<li>
		<a href="{{ media.urlDefault }}"><img src="{{ media.url }}" alt="{{ media.title }}" /></a>
		<p>
			<strong>{{ media.type }}: {{ media.title }}</strong>
			<br />
			{{ media.caption|clip }}
		</p>
	</li>
{% endfor %}
</ul>