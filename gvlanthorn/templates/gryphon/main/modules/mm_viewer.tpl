<?php
$multimedia = _M( 'media' )->
	setInverseRelationship( 'tag', array(
		'limit' => 10,
		'order' => 'media:weight desc, media:created desc'
	) )->
	findByTag( _M( 'tag')->findByName( 'multimedia' ) );
$galleries = _M( 'gallery' )->
	setInverseRelationship(	'tag', array(
		'limit' => 10,
		'order' => 'gallery:created desc'
	) )->
	findByTag( _M( 'tag')->findByName( 'multimedia' ) );
$multimedia->merge( $galleries, 'created', FOUNDRY_SORT_REVERSE );
	
$top = $multimedia->shift();
$multimedia = $multimedia->shift(5);
?>
<div class="mod-head">
	<h4>Featured Multimedia</h4>
</div>
<div class="mmb">
	<img src="<?php echo $top->smallUrl ?>" alt="<?php echo $top->title ?>" />
	<?php /* if( $top->media_type == 'Gallery' ) : ?>
		<img src="<?php echo $top->smallUrl ?>" alt="<?php echo $top->title ?>" />
	<?php else : ?>
		<?php echo $top->display('small'); ?>
	<?php endif; */ ?>
</div>

<h3 class="mmb"><a href="<?php echo $top->url ?>"><?php echo $top->title ?></a></h3>

<ul class="wrap mmb">
	<?php foreach( $multimedia as $item ) : ?>
		<li>
		<?php if( $item->media_type == 'Gallery' ) : ?>
			<img src="<?php echo Foundry::path('gfn-lanthorn/assets/icons/photo.png') ?>" alt="Gallery" />
		<?php else : ?>
			<img src="<?php echo Foundry::path('gfn-lanthorn/assets/icons/'. $item->type. '.png') ?>" alt="<?php echo $item->type ?>" />
		<?php endif; ?>
		
		
		&nbsp;&nbsp;<a href="<?php echo $item->url ?>"><?php echo $item->title ?></a>&nbsp;&nbsp;<?php echo $this->datelineHelper( 'Time', $item->modified ) ?></li>
	<?php endforeach; ?>
</ul>

<div class="aside2 mb" style="text-align:right"><a href="<?php echo Foundry::link('multimedia') ?>">SEE MORE MULTIMEDIA &raquo;</a></div>