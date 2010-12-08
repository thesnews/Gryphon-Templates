<?php
	$podcasts = FoundryModel::factory( 'GFNPodcast:GFNPodcast' )->find(
		'order by GFNPodcast:name'
	);

	define( 'PAGE_TITLE', 'Interactive - Spring Break' );
?>

<?php echo GFN::import( 'global:header_interactive' ) ?>

<div class="row">

	<iframe src="/interactive/shelf_test/index.html" width="640px;" height="300px;" scroll="no" frameborder="0" scrolling="no"></iframe>

	<div style="font-size:.8em;">Source: The State News&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;Produced by A. Student</div>
</div>



<div class="row no-border">

	<h2>More multimedia from The State News</h2>

	<div class="col no-margin slim" id="podcasts"><div class="border-right">
		<a name="podcast"></a>
		<h3>Podcasts</h3>
		<?php $podcast = $podcasts->shift(); ?>
		<ul class="bordered-list">
			<li class="first">
				<h5><a href="<?php echo FoundryView::helperLinkTo( 'podcast/'.$podcast->slug.'.xml' ) ?>"><?php echo $podcast->name ?></a></h5>

				
				<div class="photo-right">
					<a href="<?php echo FoundryView::helperLinkTo( 'podcast/'.$podcast->slug.'.xml' ) ?>">
						<img src="<?php echo $podcast->medias[0]->webPath('preview') ?>" alt="<?php echo $podcast->name ?>" />
					</a>
				</div>
				
				<?php echo $podcast->description_formatted ?>
				
				<p>
					<?php // if( $podcast->itunes_feed ) : ?>
						<!--<a href="<?php //echo $podcast->itunes_feed ?>"><img style="border: 0;" src="<?php //echo __FOUNDRY_WEBPATH__ ?>/style/images/iTunes2.gif" alt="iTunes" /></a>-->
					<?php // endif ?>
					<a href="<?php echo FoundryView::helperLinkTo( 'podcast/'.$podcast->slug.'.xml' ) ?>"><img style="border: 0;" src="<?php echo __FOUNDRY_WEBPATH__ ?>/style/images/feed_button.gif" alt="Feed" /></a>
				</p>
			</li>
			<?php foreach( $podcasts as $podcast ) : ?>
			<li>
				<h5><a href="<?php echo FoundryView::helperLinkTo( 'podcast/'.$podcast->slug.'.xml' ) ?>"><?php echo $podcast->name ?></a></h5>
				
				<div class="photo-right" style="margin-top: 20px;">
					<a href="<?php echo FoundryView::helperLinkTo( 'podcast/'.$podcast->slug.'.xml' ) ?>">
						<img src="<?php echo $podcast->medias[0]->webPath('preview') ?>" alt="<?php echo $podcast->name ?>" />

					</a>
				</div>
				
				<?php echo $podcast->description_formatted ?>				
				<p>
					<?php // if( $podcast->itunes_feed ) : ?>
						<!--<a href="<?php //echo $podcast->itunes_feed ?>"><img style="border: 0;" src="<?php //echo __FOUNDRY_WEBPATH__ ?>/style/images/iTunes2.gif" alt="iTunes" /></a>-->
					<?php // endif ?>
					<a href="<?php echo FoundryView::helperLinkTo( 'podcast/'.$podcast->slug.'.xml' ) ?>"><img style="border: 0;" src="<?php echo __FOUNDRY_WEBPATH__ ?>/style/images/feed_button.gif" alt="Feed" /></a>
				</p>
			</li>
			<?php endforeach ?>
		</ul>
	
	</div></div>
	
	<div class="col wide"><div class="grey">
		
		<?php
			if( !( $medias = GFNCache::retrieve( 'mapbase-media' ) ) ) {
				$mModel = _M( 'media' );
				$mModel->setAssociationFindLimit( 'tag', 10 );
			
				$tag = _M( 'tag' )->findByName( 'multimedia box' );
				$medias = $mModel->findByTags( $tag );
				
				GFNCache::store( 'mapbase-media', $medias );
			}			
			
			$topItem = $medias->shift();
		?>
		<h3>Fresh media</h3>
	
		<ul class="mm-icon-list">
			<li class="first">
				<a href="<?php echo FoundryView::helperLinkTo( 'multimedia/'.$topItem->uid.'/'.$this->data['start'] ) ?>">
					<img src="<?php echo __FOUNDRY_WEBPATH__ ?>/style/images/mmicon-<?php echo $topItem->type ?>.gif" alt="<?php echo $topItem->title ?>" />
					<span><?php echo $topItem->title ?></span>
				</a>
			</li>
			<?php foreach( $medias as $media ) : ?>
				<li class="first">
					<a href="<?php echo FoundryView::helperLinkTo( 'multimedia/'.$media->uid.'/'.$this->data['start'] ) ?>">
						<img src="<?php echo __FOUNDRY_WEBPATH__ ?>/style/images/mmicon-<?php echo $media->type ?>.gif" alt="<?php echo $media->title ?>" />
						<span><?php echo $media->title ?></span>
					</a>
				</li>
			<?php endforeach ?>
		</ul>

	</div></div>	

</div>

<?php FoundryView::includeTpl( 'global:footer' ) ?>