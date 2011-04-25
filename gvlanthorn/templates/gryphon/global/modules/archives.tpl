<?php
$thumb = _M('media')->findByTags( _M('tag')->findByName('frontpagepdf') )->shift();
?>
<div class="mod-head">
	<h4>PDF Archives</h4>
</div>
<div class="mod mb">
	<div class="inner">
		<div class="mmb" style="text-align:center">
			<a href="<?php echo $thumb->link ?>" target="_blank"><img src="<?php echo $thumb->bigUrl ?>" alt="PDF" /></a>
		</div>
		
		<div class="aside2" style="text-align:right"><a href="http://www.gvlarchives.com/pdfs">VIEW THE LANTHORN ONLINE &raquo;</a></div>
	</div>
</div>