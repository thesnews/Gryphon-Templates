<?php
$now = time();

if( $now - $this->modified < 120 ) {
	$out = '<span class="sm attn">1&nbsp;minute ago</span>';
} elseif( $now - $this->modified < 3600 ) {
	$out = '<span class="sm attn">'. floor( ($now-$this->modified)/60 ).'&nbsp;minutes ago</span>';
} elseif( $now - $this->modified < 86400 ) {
	$out = '<span class="sm attn">'. date( 'g:i A', $this->modified ). '</span>';
} else {
	$out = '<span class="sm dateline">'. str_replace(' ', '&nbsp;', strtoupper( date( 'M j', $this->modified ) ) ). '</span>';
}
?>

<div class="boot mmb">
	<div class="thumb mmb">
		<a href="<?php echo Foundry::link( 'multimedia/'.$this->uid ) ?>"><img src="<?php echo $this->previewUrl ?>" alt="<?php echo $this->title ?>" /></a>
	</div>
	
	<div class="mmb">
		<h4><img src="<?php echo Foundry::path('gfn-lanthorn/assets/icons/video.png') ?>" />&nbsp;&nbsp;<a href="<?php echo Foundry::link( 'multimedia/'.$this->uid ) ?>"><?php echo $this->title ?></a></h4>
		<div><?php echo $out ?> <span class="sm dateline">| <?php echo strtoupper(implode(', ', $this->authors->splat('name'))) ?></span></div>
	</div>
	<div class="clear">&nbsp;</div>
</div>