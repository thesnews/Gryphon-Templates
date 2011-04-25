<?php if( strlen($data['query_escaped']) > 3 ) $query_escaped  = $data['query_escaped']; ?>
<form method="get" id="searchform" class="mb" action="<?php echo Foundry::link( 'search' ) ?>" >
	<input type="text" name="q" size="30" value="<?php echo $query_escaped ?>" /> <input type="submit" id="searchsubmit" value="Search" />
</form>

<?php Foundry::import( 'global:modules/popular', null, 'mod-popular' ); ?>

<?php Foundry::import( 'global:ads/sidebar1_300x250' ); ?>

<div class="grid_2 alpha">
	<?php Foundry::import('global:modules/social') ?>
</div>
<div class="grid_2 omega">
	<?php Foundry::import('global:modules/puzzles') ?>
</div>
<div class="clear">&nbsp;</div>

<?php Foundry::import('global:modules/gallery_box', 'pow') ?>

<?php if( $data !== 'short' ) : ?>
	<?php Foundry::import( 'global:ads/sidebar2_300x250' ); ?>
	<?php Foundry::import( 'GCalendar:gCalendar:widget', null, 'mod-events' ); ?>
	<?php Foundry::import('AdProClassified:adPro:latest_box', null, 'mod-class') ?>
<?php endif; ?>

<div class="clear">&nbsp;</div>