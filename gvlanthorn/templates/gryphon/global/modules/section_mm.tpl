<?php
$section = $data;

$multimedia = _M( 'media' )->
	setInverseRelationship( 'tag', array(
		'limit' => 5,
		'filter' => 'media:type <> "image"'
	))->findByTag( $section->tags );
$galleries = _M( 'gallery' )->
	setInverseRelationship(	'tag', array( 'limit', 5 ) )->
	findByTag( $section->tags );

$multimedia->merge( $galleries, 'modified', FOUNDRY_SORT_REVERSE );
$topMedia = $multimedia->shift();
$multimedia = $multimedia->shift(7);
?>

<?php if( $topMedia ) : ?>
<div class="mod-head col8head">
	<h4><?php echo $section->name ?> Galleries and Multimedia</h4>
</div>
<div class="moddk mb">
	<div class="inner">
		<div class="mmcol1">
			<?php // echo $topMedia->media_type ?>
			<?php if( $topMedia->media_type == 'Gallery' ) : ?>
				<div class="mmb"><a href="<?php echo $topMedia->url ?>"><img src="<?php echo $topMedia->media[0]->bigUrl ?>" alt="<?php echo $topMedia->title ?>" /></a></div>
				
				<h3><a href="<?php echo $topMedia->url ?>"><?php echo $topMedia->title ?></a></h3>
			<?php else : ?>
				<div class="mmb"><?php $topMedia->display() ?></div>
				<h3><a href="<?php echo $topMedia->url ?>"><?php echo $topMedia->title ?></a></h3>
			<?php endif; ?>
		</div>
		
		<div class="mmcol2">
			<?php foreach( $multimedia as $item ) : ?>
				<div class="mmb">
					<?php if( $item->media_type == 'Gallery') : ?>
						<img src="<?php echo Foundry::path('gfn-lanthorn/assets/icons/photo_9.png') ?>" alt="" />&nbsp;
					<?php else : ?>
						<img src="<?php echo Foundry::path('gfn-lanthorn/assets/icons/'). strtolower($item->type). '_9.png' ?>" alt="" style="position:relative;top:1px;" />&nbsp;
					<?php endif; ?>
					<a href="<?php echo $item->url ?>"><?php echo $item->title ?></a>
				</div>
				<hr />
			<?php endforeach; ?>
			<a href="<?php echo Foundry::link('multimedia') ?>">More Multimedia &raquo;</a>
		</div>
		<div class="clear mmb">&nbsp;</div>
	</div>
</div>
<?php endif; ?>