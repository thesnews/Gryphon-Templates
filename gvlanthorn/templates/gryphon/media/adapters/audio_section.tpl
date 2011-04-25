<div class="boot mmb">
	<div class="mmb">
		<script type="text/javascript" src="<?php echo Foundry::path( 'flash/1pxout/audio-player.js' ) ?>"></script>
		<object type="application/x-shockwave-flash" data="<?php echo Foundry::path( 'flash/1pxout/player.swf' ) ?>" id="audioplayer1" height="30" width="300">
		<param name="movie" value="<?php echo Foundry::path( 'flash/1pxout/player.swf' ) ?>">
		<param name="FlashVars" value="playerID=1&amp;soundFile=<?php echo $this->webPath() ?>&amp;leftbg=0x666666&amp;lefticon=0xffffff">
		<param name="quality" value="high">
		<param name="menu" value="false">
		<param name="wmode" value="transparent">
		</object>
	</div>
	
	<div class="mmb">
		<h4><img src="<?php echo Foundry::path('gfn-lanthorn/assets/icons/audio.png') ?>" />&nbsp;&nbsp;<a href="<?php echo Foundry::link( 'multimedia/'.$this->uid ) ?>"><?php echo $this->title ?></a></h4>
		<div class="aside"><?php echo $this->caption ?></div>
	</div>
	<div class="clear">&nbsp;</div>
</div>