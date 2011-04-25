<?php
	$comments = $data['comments'];
?>
<?php Foundry::import( 'global:header' ) ?>

<h1 class="container">
	Recently:
	<ul>
		<li><a href="<?php echo Foundry::link( 'recent/articles' ) ?>">More recent articles &#187;</a></li>
		<li><a href="<?php echo Foundry::link( 'recent/comments' ) ?>">More recent comments &#187;</a></li>
	</ul>
</h1>

<hr />
<div class="span-5 border">
	<?php Foundry::import( 'global:ads:leftRail' ) ?>
</div>
<div class="span-23 last">
	<h3>Recent comments: <a href="<?php echo Foundry::link( 'recent/comment.xml' ) ?>"><img src="<?php echo Foundry::path( 'style/images/feed.png' ) ?>" alt="RSS Feed" /></a></h3>
	<?php if( $comments->length ) : ?>
	<ul class="item-list">
	<?php foreach( $comments as $comment ) : ?>
		<li>
			<h4><a href="<?php echo $comment->url ?>">At <?php echo date( 'g:ia', $comment->created ).' '.$comment->name ?> said:</a></h4>
			<p>
				<?php echo $comment->preview ?>
				<a href="<?php echo $comment->url ?>">More &#187;</a>
			</p>
		</li>
	<?php endforeach ?>
	</ul>
	<?php else : ?>
		Sorry, no recent comments to report.
	<?php endif ?>
</div>

<?php Foundry::import( 'global:footer' ) ?>