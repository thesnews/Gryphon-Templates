<?php
/*
Foundry_Registry::set( 'gfn:include.printstyles', array(
	Foundry::path( 'gfn-blackletter/css/print-article.css' )
));
*/

$page = $data['page'];

$mugShot = $page->mediaByMetaProperty( 'mugshot', true );
$images = $page->mediaByType( 'image', true );

$video = $page->mediaByType( 'flashVideo', true );
$mp4 = $page->mediaByType( 'video', true );
$audio = $page->mediaByType( 'audio', true );
$slides = $page->mediaByType( 'soundSlide', true );
$pdf = $page->mediaByType( 'pdf', true );

Foundry::import( 'global:header', array(
	'title' => $page->title,
	'activeTab' => $page->slug
));
?>

<div class="grid_8">
	<h1 class="mmb"><?php echo $page->title ?></h1>
	
	<?php if( $page->sidebar || $images->length || $video->length || $audio->length || $slides->length || $pdf->length ) : ?>
	<div id="story-sidebar" class="grid_4 omega">
		
		<?php if( $page->sidebar ) : ?>
			<div class="hat mmb">
				<div class="infobox">
					<?php echo $page->sidebar_formatted ?>
				</div>
			</div>
		<?php endif; ?>
		
		<?php if( $images->length ) : 
		foreach( $images as $item ) : ?>
			<div class="mmb"><img src="<?php echo $item->smallUrl ?>" alt="<?php echo $item->base_name ?>" /></div>
			
			<?php if( $image->foto_pushed ) : ?>
				<a class="reprints-button" href="<?php echo FotobrokerSyncPlugin::buyURL( $image ) ?>"></a>
			<?php else : ?>
				<a class="reprints-button" href="<?php echo Foundry_Registry::get( 'foto:url' ); ?>"></a>
			<?php endif; ?>
			
			
			<?php echo creditLine($item); ?>
		
			<div class="clear mmb">&nbsp;</div>
			<div class="caption mmb">
				<?php echo $item->caption_formatted ?>
			</div>
		<?php endforeach; endif; ?>
	
	
		<?php if( $video->length || $audio->length || $slides->length || $pdf->length ) : ?>
			<div class="mod-head">
				<h4>Media</h4>
			</div>
			<div class="mod mb">
				<div class="inner">
					<?php
					foreach( $video as $item ) {
						if( $item->status == 0 ) echo '<div class="unp">';
						$item->display('article');
						if( $item->status == 0 ) echo '</div>';
					}
					foreach( $mp4 as $item ) {
						if( $item->status == 0 ) echo '<div class="unp">';
						$item->display('article');
						if( $item->status == 0 ) echo '</div>';
					}
					foreach( $slides as $item ) {
						if( $item->status == 0 ) echo '<div class="unp">';
						$item->display('article');
						if( $item->status == 0 ) echo '</div>';
					}
					foreach( $audio as $item ) {
						if( $item->status == 0 ) echo '<div class="unp">';
						$item->display('article');
						if( $item->status == 0 ) echo '</div>';
					}
					foreach( $pdf as $item ) {
						if( $item->status == 0 ) echo '<div class="unp">';
						$item->display('article');
						if( $item->status == 0 ) echo '</div>';
					}					?>
				</div>
			</div>
		<?php endif; ?>
	</div><!-- #story-sidebar -->
	<?php endif; ?>
	
	
	
	
	<?php if( $mugShot->length ) : 
	foreach ( $mugShot as $item ) : ?>
	<div class="thumb">
		<img src="<?php echo $item->previewUrl ?>" alt="<?php echo $item->base_name ?>" />
		<div class="aside"><strong><?php echo $item->title ?></strong></div>
	</div>
	<?php endforeach; endif; ?>
	
	<div class="body-copy boot mmb">
		<?php echo $page->content_formatted ?>
	</div>
	
	<div class="caption mmb">
		Updated <?php echo date( 'F j, Y', $page->modified ) ?>
	</div>
	
</div>

<div class="grid_4">
	<?php Foundry::import( 'article:sidebar', 'short' ); ?>
</div>

<div class="clear">&nbsp;</div>
<?php Foundry::import( 'global:footer' ); ?>