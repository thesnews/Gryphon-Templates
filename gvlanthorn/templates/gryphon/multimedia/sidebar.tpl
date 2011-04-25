<div class="mb">
	<form method="get" id="searchform" class="mb" action="<?php echo Foundry::link( 'search' ) ?>" >
		<input type="text" name="q" size="30" value="<?php echo $query_escaped ?>" /> <input type="submit" id="searchsubmit" value="Search" />
	</form>
</div>

<?php Foundry::import('global:ads/sidebar1_300x250'); ?>

<?php Foundry::import('global:modules/gallery_box', 'pow') ?>