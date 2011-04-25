<?php
$tag = $data;

$boxGal = _M( 'gallery' )->setInverseRelationship( 'tag', array( 'limit', 1 ) )->findByTag( _M( 'tag' )->findByName( $tag ) )->shift();
?>
<div class="mod-head">
	<h4><?php echo $boxGal->title ?></h4>
</div>

<ul id="galtabs-mod">
	<?php $i = 1; foreach( $boxGal->media as $image ) : ?>
		<li><a href="#modimg<?php echo $i; ?>"></a></li>
	<?php $i++; endforeach; ?>
</ul>

<?php $i = 1; foreach( $boxGal->media as $image ) :
	if( $i == 1 ) $prevLink = '';
	else $prevLink = $i - 1;
	
	if( $i == $boxGal->media->length ) $nextLink = '';
	else $nextLink = $i + 1;
?>
<div id="modimg<?php echo $i; ?>" class="panel ui-tabs-hide">
	<div class="mod-sub">
		<div class="galnavdk">
			<?php if( $nextLink !== '' ) : ?>
				<a href="#modimg<?php echo $nextLink ?>" class="next"></a>
			<?php else : ?>
				<a class="next-inactive"></a>
			<?php endif; ?>
			
			<?php if( $prevLink !== '' ) : ?>
				<a href="#modimg<?php echo $prevLink ?>" class="prev"></a>
			<?php else : ?>
				<a class="prev-inactive"></a>
			<?php endif; ?>
		
			<em class="sm">Image <?php echo $i ?> of <?php echo $boxGal->media->length ?></em>
		</div>
	</div>
	
	<div class="mb">
		<div class="mmb"><img src="<?php echo $image->smallUrl ?>" alt="<?php echo $image->base_name ?>" /></div>
		
		<div class="mmb">
			<?php if( $image->foto_pushed ) : ?>
				<a class="reprints-button" href="<?php echo FotobrokerSyncPlugin::buyURL( $image ) ?>"></a>
			<?php else : ?>
				<a class="reprints-button" href="<?php echo Foundry_Registry::get( 'foto:url' ); ?>"></a>
			<?php endif; ?>
			
			<?php echo creditLine($image); ?>
			<div class="clear">&nbsp;</div>
		</div>
		
		<div class="caption">
			<p><?php echo $image->caption ?></p>
			
			<?php if( $image->articles->length ) : ?>
				<p class="mmb"><a href="<?php echo $image->articles[0]->url ?>">Read the article &raquo;</a></p>
			<?php endif; ?>
			<hr />
		</div>
	</div>
</div>
<?php $i++; endforeach; ?>