<?php

//$galleries = $data['galleries'];
$top = $data['gallery'];

$galleries = _M( 'gallery' )->find( 'gallery:status = 1 order by gallery:created desc' );

Foundry::import( 'global:header', array(
	'title' => 'Multimedia : '. $top->title,
	'activeTab' => 'multimedia'
));
?>

<div class="grid_8">
	<?php if( $top->status == 0 ) echo '<div class="unp">'; ?>
	<ul id="galtabs">
		<?php $i = 1; foreach( $top->media as $image ) : ?>
		<li><a href="#galimg<?php echo $i ?>"></a></li>
		<?php $i++; endforeach; ?>
	</ul>
	
	<?php $i = 1; foreach( $top->media as $image ) : 
		if( $i == 1 ) $prevLink = '';
		else $prevLink = $i - 1;
		
		if( $i == $top->media->length ) $nextLink = '';
		else $nextLink = $i + 1;
	?>
	<div id="galimg<?php echo $i ?>" class="panel ui-tabs-hide">
		<div class="grid_6 alpha">
			<div class="imgbox mmb">
				<?php
				$dim = getimagesize( $image->bigPath );
				$w = $dim[0];
				$h = $dim[1];
				?>
				
				<img src="<?php if( $w > $h ) echo $image->bigUrl; else echo $image->smallUrl ?>" alt="<?php echo $image->base_name ?>" />
			</div>
			<?php if( $image->foto_pushed ) : ?>
				<a class="reprints-button" href="<?php echo FotobrokerSyncPlugin::buyURL( $image ) ?>"></a>
			<?php else : ?>
				<a class="reprints-button" href="<?php echo Foundry_Registry::get( 'foto:url' ); ?>"></a>
			<?php endif; ?>
			
			<?php echo creditLine($image); ?>
		</div>
		
		<div class="grid_2 omega<?php if( $image->status == 0 ) echo ' unp'; ?>">
			<div class="galnav mmb">
			<?php if( $nextLink !== '' ) : ?>
				<a href="#galimg<?php echo $nextLink ?>" class="next"></a>
			<?php else : ?>
				<a class="next-inactive"></a>
			<?php endif; ?>
			
			<?php if( $prevLink !== '' ) : ?>
				<a href="#galimg<?php echo $prevLink ?>" class="prev"></a>
			<?php else : ?>
				<a class="prev-inactive"></a>
			<?php endif; ?>
			
			<strong>Image <?php echo $i ?> of <?php echo $top->media->length ?></strong></div>
			<div class="clear">&nbsp;</div>
			<hr class="light mmb" />
			
			<div class="caption"><?php echo $image->caption_formatted ?></div>
		</div>
	</div>
	<?php $i++; endforeach; ?>
	
	<div class="clear mmb">&nbsp;</div>
	
	<div class="grid_6 alpha">
		<h3 class="mmb"><a href="<?php echo $top->url ?>"><?php echo $top->title ?></a></h3>
		
		<div class="abstract">
			<p><?php echo $top->description ?> <?php echo $this->datelineHelper( 'time', $top->created ) ?></p>
		</div>
	</div>
	
	<div class="grid_2 omega">
		<?php Foundry::import('multimedia:tools', $top ) ?>
	</div>
	
	<?php if( $top->status == 0 ) echo '<div class="clear">&nbsp;</div></div>'; ?>
	
	<?php $i = 1; foreach( $galleries as $item ) : 
	if( $item->uid == $top->uid ) continue; ?>
	
	<div class="hat grid_4 mb<?php if( $i % 2 == 1 ) echo ' alpha'; else echo ' omega'; ?>">
		<?php if( $item->media_type == 'Gallery'): ?>
			<div class="mmbox">
				<div class="thumb">
					<a href="<?php echo $item->url ?>"><img src="<?php echo $item->previewUrl ?>" alt="<?php echo $item->slug ?>" /></a>
				</div>
				
				<div><img src="<?php echo Foundry::path('gfn-lanthorn/assets/icons/photo.png') ?>" alt="" />&nbsp;<a href="<?php echo $item->url ?>"><?php echo $item->title ?></a></div>
				<div><?php echo $this->datelineHelper( 'time', $item->created ) ?> <span class="byline aside">| <?php echo $item->medias->length ?> IMAGES</span></div>
			</div>
		<?php else : ?>
			<?php $item->display('mm') ?>
		<?php endif; ?>
	</div>
	<?php $i++; endforeach; ?>
	
	<div class="clear">&nbsp;</div>
</div>

<div class="grid_4">
	<?php Foundry::import('multimedia:sidebar', null, 'mm-sidebar'); ?>
</div>

<div class="clear mbb">&nbsp;</div>
<?php Foundry::import( 'global:footer' ); ?>