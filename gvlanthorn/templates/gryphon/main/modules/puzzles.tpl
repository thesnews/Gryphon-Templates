<?php
$limit = strtotime( '-7 days', time() );
$puzzles = _M( 'media' )->setInverseRelationship( 'tag', array(
	'filter' => 'media:created > '. $limit,
	'order' => 'media:created desc'
))->findByTag( _M('tag')->findByName( 'puzzles' ) );
?>
<div class="mod-head">
	<h4>Puzzle Solutions</h4>
</div>
<div class="mod mb">
	<div class="inner">
		<ul class="links">
			<?php foreach( $puzzles as $item ) : ?>
			<li><span class="dateline aside"><?php echo strtoupper(date( 'M j', $item->created )) ?> |</span> <a href="<?php echo $item->bigUrl ?>" class="thickbox"><?php echo $item->title ?></a></li>
			<?php endforeach; ?>
		</ul>
	</div>
</div>