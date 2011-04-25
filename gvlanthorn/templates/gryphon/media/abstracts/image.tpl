<?php $images = $data; ?>
<?php if( $images->length ) : foreach( $images as $image ) : ?>
	<div class="text-center">
		<img src="<?php echo $image->smallURL ?>" alt="<?php echo $image->title ?>" class="photo" />
		<div class="small text-right"><?php echo $image->author[0]->name ?> &ndash; <?php echo $image->source ?></div>
	</div>
	<div class="quiet">
		<?php echo $image->caption_formatted ?>
	</div>
	<hr />
<?php endforeach; endif ?>
