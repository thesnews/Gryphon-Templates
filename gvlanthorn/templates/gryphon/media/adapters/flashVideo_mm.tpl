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

<div class="mmbox">
	<div class="thumb">
		<a href="<?php echo Foundry::link( 'multimedia/'.$this->uid ) ?>"><img src="<?php echo $this->previewUrl ?>" alt="<?php echo $this->title ?>" /></a>
	</div>
	
	<div class="flat"><img src="<?php echo Foundry::path('gfn-lanthorn/assets/icons/video.png') ?>" />&nbsp;<a href="<?php echo Foundry::link( 'multimedia/'.$this->uid ) ?>"><?php echo $this->title ?></a></div>
	<div><?php echo $out ?> <?php if($this->authors->length) : ?><span class="byline aside">| By <?php echo strtoupper(implode(', ', $this->authors->splat('name'))) ?></span><?php endif; ?></div>
</div>