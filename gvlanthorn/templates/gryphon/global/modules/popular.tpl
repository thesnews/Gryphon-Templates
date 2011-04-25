<?php
if( Foundry_Registry::get('dsw:popularrange') ) {
	$farEnd = strtotime( Foundry_Registry::get('dsw:popularrange'), time() );
	$popular = _M( 'article' )->popular( 5, time(), $farEnd );
} else {
	$popular = _M( 'article' )->popular( 5 );
}

$comments = _M( 'comment' )->find( 'comment:status = 1 order by comment:created desc limit 5' );

$posts = _M( 'blogPost' )->find( 'blogPost:status = 1 order by blogPost:created desc limit 5' );
?>
<div class="mod-head tabheader">
	<ul>
		<li><a href="#tab-blogs">Blog Posts</a></li>
		<li><a href="#tab-comments">Comments</a></li>
		<li><a href="#tab-popular">Popular</a></li>
	</ul>
</div>
<div class="mod mb">
	<div class="inner">
		<div id="tab-popular">
			<ul class="links boot">
				<?php foreach( $popular as $item ) : ?>
					<li>
						<a href="<?php echo $item->url; ?>"><?php echo $item->headline; ?></a> &nbsp;<?php echo $this->datelineHelper( 'Time', $item->modified ) ?><span class="dateline aside"> | <?php echo $item->comments->length; ?>&nbsp;<?php if( $item->comments->length == 1 ) echo 'COMMENT'; else echo 'COMMENTS'; ?></span>
					</li>
				<?php endforeach; ?>
			</ul>
		</div>
		
		<div id="tab-comments">
			<ul class="links boot">
				<?php foreach( $comments as $comment ) : ?>
					<li><strong><?php echo $comment->name; ?></strong> on <a href="<?php echo $comment->url ?>"><?php echo $comment->item->title; ?></a></li>
				<?php endforeach ?>
			</ul>
		</div>
		
		<div id="tab-blogs">
			<ul class="links boot">
				<?php foreach( $posts as $post ) : ?>
					<li><a href="<?php echo $post->url ?>"><?php echo $post->headline ?></a> &nbsp;<?php echo $this->datelineHelper( 'time', $post->created ) ?>
					<br /><strong>Posted in</strong>: <a href="<?php echo $post->blog->url ?>"><?php echo $post->blog->name ?></a></li>
				<?php endforeach; ?>
			</ul>
		</div>
	</div>
</div>