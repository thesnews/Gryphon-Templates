<div class="boot mmb">
	<div class="mmb">
		<div class="mmb"><img src="<?php echo Foundry::path('gfn-lanthorn/assets/icons/document.png') ?>" />&nbsp;<strong>PDF:</strong> 
		<?php if( $this->title ) : ?>
		<a href="<?php echo $this->originalUrl ?>"><?php echo $this->title ?></a>
		<?php else : ?>
		<a href="<?php echo $this->originalUrl ?>"><?php echo $this->base_name ?></a>
		<?php endif; ?>
		
		(<?php echo round( (filesize($this->originalPath))/1024, 0). ' KB'; ?>)</div>
		<div class="aside2"><?php echo $this->caption ?></div>
	</div>
	<div class="clear">&nbsp;</div>
</div>