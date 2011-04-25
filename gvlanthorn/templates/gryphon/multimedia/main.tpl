<?php
$media = $data['media'];

// the requested media file will always be first
$top = $media->shift();

//$galleries = _M( 'gallery' )->find( 'gallery:status = 1 order by gallery:created desc limit 4' );
$galleries = _M('gallery')->findByTags( _M('tag')->findByName('multimedia') )->shift(4);

Foundry::import( 'global:header', array(
	'title' => 'Multimedia : '. $top->title,
	'activeTab' => 'multimedia'
));
?>

<div class="grid_8">
	<?php if( $top ) : ?>
	<div class="mmb"><?php $top->display() ?></div>
	<div class="clear"></div>
	
	<div class="grid_6 alpha">
		<h3 class="mmb"><a href="<?php echo $top->url ?>"><?php echo $top->title ?></a></h3>
		
		<div class="aside mmb"><?php echo byLine($top); ?></div>
		<div class="abstract">
			<p><?php echo $top->caption ?> <?php echo $this->datelineHelper( 'time', $top->created ) ?></p>
		</div>
	</div>
	
	<div class="grid_2 omega">
		<ul class="wrap mb">
			<li><img src="<?php echo Foundry::path('gfn-lanthorn/assets/icons/video.png') ?>" alt="" />&nbsp;&nbsp;<a href="<?php echo Foundry::link('multimedia/video') ?>" class="head4">Video</a></li>
			
			<?php /*
			<li><img src="<?php echo Foundry::path('gfn-lanthorn/assets/icons/audio.png') ?>" alt="" />&nbsp;&nbsp;<a href="<?php echo Foundry::link('multimedia/audio') ?>" class="head4">Audio</a></li>
			*/ ?>
			
			<li><img src="<?php echo Foundry::path('gfn-lanthorn/assets/icons/slideshow.png') ?>" alt="" />&nbsp;&nbsp;<a href="<?php echo Foundry::link('multimedia/soundSlide') ?>" class="head4">Slideshows</a></li>
			
			<li><img src="<?php echo Foundry::path('gfn-lanthorn/assets/icons/photo.png') ?>" alt="" />&nbsp;&nbsp;<a href="<?php echo Foundry::link('gallery') ?>" class="head4">Photo galleries</a></li>
		</ul>
		
		<?php //Foundry::import('global:ads/promo1_140x140'); ?>
		
		<?php Foundry::import('multimedia:tools', $top ) ?>
	</div>
	<?php endif; ?>
	
	<div class="clear mb">&nbsp;</div>
	
	<?php $i = 1; if( $media->length) : foreach( $media as $item ) : ?>
	
	<div class="hat grid_4 mb<?php if( $i % 2 == 1 ) echo ' alpha'; else echo ' omega'; ?>">
		<?php if( $item->media_type == 'Gallery'): ?>
			<div class="mmbox">
				<div class="thumb">
					<a href="<?php echo $item->url ?>"><img src="<?php echo $item->previewUrl ?>" alt="<?php echo $item->slug ?>" /></a>
				</div>
				
				<div class="flat"><img src="<?php echo Foundry::path('gfn-lanthorn/assets/icons/photo.png') ?>" alt="" />&nbsp;<a href="<?php echo $item->url ?>"><?php echo $item->title ?></a></h4></div>
				<div class="aside"><?php echo $this->datelineHelper( 'time', $item->created ) ?> <span class="dateline">| <?php echo $item->medias->length ?> IMAGES</span></div>
			</div>
		<?php else : ?>
			<?php $item->display('mm') ?>
		<?php endif; ?>
	</div>
	<?php $i++; endforeach; ?>
	
	<div class="clear">&nbsp;</div>
	
	<?php if( $data['nextUrl'] ) : ?>
		<div class="aside2 mb right"><a href="<?php echo $data['nextUrl'] ?>" class="next">NEXT PAGE &#187;</a></div>
	<?php endif ?>
	
	<?php if( $data['previousUrl'] ) : ?>
		<div class="aside2 mb"><a href="<?php echo $data['previousUrl'] ?>" class="previous">&#171; PREVIOUS PAGE</a></div>
	<?php endif ?>
	
	<?php if( $data['nextUrl'] || $data['nextUrl'] ) : ?>
		<div class="clear">&nbsp;</div>
	<?php endif ?>
	
	<hr class="mmb" />
	<h4 class="mb">Photo Galleries</h4>
	
	<?php $i = 1; foreach( $galleries as $item ) : ?>
	<div class="hat grid_4 mb<?php if( $i % 2 == 1 ) echo ' alpha'; else echo ' omega'; ?>">
		<div class="mmbox">
			<div class="thumb">
				<a href="<?php echo $item->url ?>"><img src="<?php echo $item->previewUrl ?>" alt="<?php echo $item->slug ?>" /></a>
			</div>
			
			<div class="flat"><img src="<?php echo Foundry::path('gfn-lanthorn/assets/icons/photo.png') ?>" alt="" />&nbsp;<a href="<?php echo $item->url ?>"><?php echo $item->title ?></a></h4></div>
			<div class="aside"><?php echo $this->datelineHelper( 'time', $item->created ) ?> <span class="dateline">| <?php echo $item->medias->length ?> IMAGES</span></div>
		</div>
	</div>
	<?php $i++; endforeach; endif; ?>
	
	<div class="aside2 mb" style="text-align:right;"><a href="<?php echo Foundry::link('gallery') ?>">MORE GALLERIES &raquo;</a></div>
	
	<div class="grid_4 alpha">
		<?php Foundry::import( 'global:ads/section_banner1_300x100' ); ?>
	</div>
	
	<div class="grid_4 omega">
		<?php Foundry::import( 'global:ads/section_banner2_300x100' ); ?>
	</div>
	
	<div class="clear">&nbsp;</div>
	
</div>

<div class="grid_4">
	<?php Foundry::import('multimedia:sidebar', null, 'mm-sidebar'); ?>
</div>

<div class="clear mbb">&nbsp;</div>
<?php Foundry::import( 'global:footer' ); ?>