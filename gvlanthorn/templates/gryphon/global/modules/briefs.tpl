<?php
$section = _M('section')->findBySlug('briefs')->shift();
if( $section ) :
$articles = _M('article')->findByTags( $section->tags )->shift(5);
if( $articles->length ) :
?>
<div class="mod-head">
	<h4><?php echo $section->name ?></h4>
</div>
<div class="mod mb">
	<div class="inner">
		<ul class="links mb">
			<?php foreach( $articles as $article ) : ?>
				<li<?php if( $article->status == 0 ) echo ' class="unp"'; ?>><a href="<?php echo $section->url ?>"><?php echo $article->headline ?></a>&nbsp;&nbsp;<?php echo $this->datelineHelper( 'Time', $article->created ) ?></li>
			<?php endforeach; ?>
		</ul>
	</div>
</div>
<?php endif; endif; ?>