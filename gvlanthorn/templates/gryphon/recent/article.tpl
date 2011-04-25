<?php
	$articles = $data['articles'];
?>
<?php Foundry::import( 'global:header' ) ?>

<h1 class="container">
	Recently:
	<ul>
		<li><a href="<?php echo Foundry::link( 'recent/article' ) ?>">More recent articles &#187;</a></li>
		<li><a href="<?php echo Foundry::link( 'recent/comment' ) ?>">More recent comments &#187;</a></li>
	</ul>
</h1>

<hr />
<div class="span-5 border">
	<?php Foundry::import( 'global:ads:leftRail' ) ?>
</div>
<div class="span-23 last">

	<h3>Recent articles: <a href="<?php echo Foundry::link( 'recent/article.xml' ) ?>"><img src="<?php echo Foundry::path( 'style/images/feed.png' ) ?>" alt="RSS Feed" /></a></h3>
	<?php if( $articles->length ) : ?>
	<ul class="item-list">
	<?php foreach( $articles as $article ) : ?>
		<li>
			<h4><a href="<?php echo $article->url ?>"><?php echo $article->headline ?></a></h4>
			<p>
				<?php echo $article->abstract_formatted ?>
				<a href="<?php echo $comment->url ?>">More &#187;</a>
			</p>
		</li>
	<?php endforeach ?>
	</ul>
	<?php else : ?>
		Sorry, no recent articles to report.
	<?php endif ?>
</div>

<?php Foundry::import( 'global:footer' ) ?>