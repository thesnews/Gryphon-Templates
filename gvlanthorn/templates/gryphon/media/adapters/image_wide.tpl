<?php 
	$media = $data;
	$gallery = _M( 'gallery' )->find( 'gallery:media_id = :mid', array( ':mid' => $media->uid ) )->pop();
	
?>
<a href="<?php echo Foundry::link( 'gallery/'.$gallery->slug ) ?>"><img src="<?php echo $media->webPath( 'big' ) ?>" alt="<?php echo $media->title ?>" width="400px" border="0" /></a><br />
<?php echo $media->authors[0]->name ?>/<?php echo $media->source ?>
<p><a href="<?php echo Foundry::link( 'gallery/'.$gallery->slug ) ?>">View Gallery</a></p>
