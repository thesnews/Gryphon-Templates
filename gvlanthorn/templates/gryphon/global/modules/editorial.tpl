<?php
$section = _M('section')->findBySlug('editorial')->shift();
$articles = _M('article')->findByTags( $section->tags )->shift(3);

//$letters = $articles->withTagName( 'letters' )->shift(3);
//$columns = $articles->withTagName( 'column' )->shift(3);

$cartoon = _M( 'media' )->
	setInverseRelationship( 'tag', array( 'limit' => 1 ) )->
	findByTag( _M( 'tag')->findByName( 'cartoon' ) )->shift();
?>
<div class="mod-head">
	<h4><?php echo $section->name ?></h4>
</div>
<div class="mod mb">
	<div class="inner">
		<?php if( $cartoon->status == 0 ) echo '<div class="unp">'; ?>
		<div class="image">
			<a href="<?php echo $section->url ?>"><img src="<?php echo $cartoon->smallUrl ?>" alt="<?php echo $cartoon->base_name ?>" /></a>
		</div>
		<div class="caption aside mb">Editorial cartoon</div>
		<?php if( $cartoon->status == 0 ) echo '</div>'; ?>
		
		<hr class="mmb" />
		<ul class="links mb">
			<?php foreach( $articles as $article ) : ?>
				<li<?php if( $article->status == 0 ) echo ' class="unp"'; ?>><a href="<?php echo $article->url ?>"><?php echo $article->headline ?></a>&nbsp;&nbsp;<?php echo $this->datelineHelper( 'Time', $article->created ) ?></li>
			<?php endforeach; ?>
		</ul>
	</div>
</div>