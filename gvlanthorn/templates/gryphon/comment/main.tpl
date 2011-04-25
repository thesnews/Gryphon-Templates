<?php
	$comment = $data['comment'];
	$message = $data['message'];
	$item = $data['item'];
?>

<?php Foundry::import( 'global:header' ) ?>

<div class="grid_8">
	<p class="attn"><strong>Sorry, an error has occurred.</strong></p>
	
	<p><?php echo $message ?></p>
	
	<p><a href="<?php echo $item->url ?>">Back to the page from whence you came</a></p>
</div>

<div class="grid_4">
	<?php Foundry::import( 'article:sidebar' ); ?>
</div>

<div class="clear mbb">&nbsp;</div>
<?php Foundry::import( 'global:footer' ); ?>