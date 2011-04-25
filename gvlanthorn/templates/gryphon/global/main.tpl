<?php
$articles = $data['articles'];

$topStory = $articles->shift();
$sidebarStories = $articles->shift(2);

Foundry::import( 'global:header', array('activeTab' => 'home') );
?>

<div class="grid_5">
	<?php if( $topStory->status == 0 ) echo '<div class="unp">'; ?>
	<?php $mugShot = $topStory->mediaByMetaProperty( 'mugshot', true );
	if( $topStory->mediaByType('image')->length ) : 
	$cpPhoto = $topStory->mediaByType('image')->shift(); ?>
	<div class="image mmb">
		<a href="<?php echo $topStory->url ?>"><img src="<?php echo $cpPhoto->bigUrl; ?>" alt="<?php echo $cpPhoto->base_name; ?>" /></a>
	</div>
	
	<?php if( $cpPhoto->foto_pushed ) : ?>
		<a class="reprints-button" href="<?php echo FotobrokerSyncPlugin::buyURL( $cpPhoto ) ?>"></a>
	<?php else : ?>
		<a class="reprints-button" href="<?php echo Foundry_Registry::get( 'foto:url' ); ?>"></a>
	<?php endif; ?>
	
	<?php echo creditLine($cpPhoto); ?>

	<div class="clear mmb">&nbsp;</div>
	<?php endif; ?>	
	
	<h2><a href="<?php echo $topStory->url ?>"><?php echo $topStory->headline_formatted ?></a></h2>
	
	<?php if( $topStory->authors->length ) : ?>
		<div class="byline aside mmb">By <?php echo strtoupper( $topStory->authors[0]->name ) ?> | <?php echo $this->datelineHelper( 'Time', $topStory->modified ) ?></div>
	<?php endif; ?>
	
	<div class="abstract mb">
		<?php echo $topStory->abstract_formatted ?>
	</div>
	<?php if( $topStory->status == 0 ) echo '</div>'; ?>
</div>

<div class="grid_3">
	<?php foreach($sidebarStories as $article) : ?>
	<?php if( $article->status == 0 ) echo '<div class="unp">'; ?>
		<h3><a href="<?php echo $article->url ?>"><?php echo $article->headline_formatted ?></a></h3>
		
		<?php if( $article->authors->length ) : ?>
			<div class="byline aside mmb">By <?php echo strtoupper( $article->authors[0]->name ) ?> | <?php echo $this->datelineHelper( 'Time', $article->modified ) ?></div>
		<?php endif; ?>
		
		<?php $mugShot = $article->mediaByMetaProperty( 'mugshot', true );
		if( $article->mediaByType('image')->length ) : 
		$thumb = $article->mediaByType('image')->shift(); ?>
			<div class="thumbright">
				<a href="<?php echo $article->url ?>"><img src="<?php echo $thumb->previewUrl ?>" alt="<?php echo $thumb->base_name ?>" /></a>
			</div>
		<?php endif; ?>
		
		<div class="abstract mb">
			<?php echo $article->abstract_formatted ?>
		</div>
	<?php if( $article->status == 0 ) echo '</div>'; ?>
	<?php endforeach; ?>
</div>



<div class="grid_4">
	<form method="get" id="searchform" class="mb" action="<?php echo Foundry::link( 'search' ) ?>" >
		<input type="text" name="q" size="30" value="<?php echo $query_escaped ?>" /> <input type="submit" id="searchsubmit" value="Search" />
	</form>
	
	<?php Foundry::import('global:modules/mm_viewer', null, 'mm-viewer') ?>
</div>

<hr class="grid_12 thick" />

<div class="grid_3">
	<?php Foundry::import('global:modules/sectionbox', array('news', 5)) ?>
</div>

<div class="grid_3">
	<?php Foundry::import('global:modules/sectionbox', array('sports', 5)) ?>
</div>

<div class="grid_3">
	<?php Foundry::import('global:modules/sectionbox', array('ae', 5)) ?>
</div>

<div class="grid_3">
	<?php Foundry::import('global:modules/sectionbox', array('laker_life', 5)) ?>
</div>

<hr class="grid_12 thick mb" />

<div class="grid_4">
	<?php Foundry::import('global:modules/popular', null, 'mod-popular') ?>
	
	<?php Foundry::import('global:modules/gallery_box', 'pow', 'mod-pow') ?>
	
	<?php Foundry::import('global:modules/archives') ?>
	
	<div class="grid_2 alpha">
		<?php Foundry::import( 'global:ads/square1_140x140' ); ?>
		<?php Foundry::import( 'global:ads/square3_140x140' ); ?>
	</div>
	
	<div class="grid_2 omega">
		<?php Foundry::import( 'global:ads/square2_140x140' ); ?>
		<?php Foundry::import( 'global:ads/square4_140x140' ); ?>
	</div>
	<div class="clear"></div>
</div>

<div class="grid_4">
	<?php Foundry::import('global:modules/editorial', null, 'mod-editorial') ?>
	
	<?php PollsterPlugin::poll() ?>
	
	<div class="grid_2 alpha">
		<?php Foundry::import('global:modules/social') ?>
	</div>
	<div class="grid_2 omega">
		<?php Foundry::import('global:modules/puzzles') ?>
	</div>
	<div class="clear">&nbsp;</div>
	
	<?php Foundry::import( 'global:ads/monster_300x250' ); ?>
	
	<?php // Foundry::import('global:modules/ap_vid') ?>
	<?php Foundry::import( 'global:ads/coupon' ); ?>
</div>

<div class="grid_4">
	<?php Foundry::import( 'global:ads/sidebar1_300x250' ); ?>
	
	<?php Foundry::import('global:modules/briefs', null, 'mod-briefs') ?>
	
	<?php Foundry::import('AdProClassified:adPro:latest_box', null, 'mod-class') ?>
	
	<?php Foundry::import( 'GCalendar:gCalendar:widget', null, 'mod-events' ); ?>
	
	<?php Foundry::import( 'global:ads/sidebar2_300x250' ); ?>
</div>

<div class="clear">&nbsp;</div>

<?php Foundry::import('global:footer') ?>