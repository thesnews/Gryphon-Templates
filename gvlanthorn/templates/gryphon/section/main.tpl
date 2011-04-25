<?php
$section = $data['section'];
$articles = $data['articles'];

$topStory = $articles->shift();
$sidebarStories = $articles->shift(2);

if( $section->sidebar ) {
	$activeTab = $section->sidebar;
} else {
	$activeTab = $section->slug;
}

if( $section->sidebar ) {
	$subnav = _M('section')->findBySidebar( $section->sidebar );
} else {
	$subnav = _M('section')->findBySidebar( $section->slug );
}
		
Foundry::import( 'global:header', array(
	'title' => $section->name,
	'activeTab' => $activeTab,
	'feedlink' => array('title' => Foundry_Registry::get('gfn:publication.name'). ' : '. $section->name, 'link' => $section->url. '.xml')
));
?>

<div class="grid_8">
	<?php if( $subnav->length ) : ?>
	<div class="mmb">
		<?php foreach( $subnav as $item ) : ?>
		<a href="<?php echo $item->url ?>"><?php echo strtoupper($item->name) ?></a>&nbsp;&nbsp;
		<?php endforeach; ?>
	</div>
	<hr />
	<?php endif; ?>
	
	<div class="grid_5 alpha<?php if( $topStory->status == 0 ) echo ' unp'; ?>">
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
	</div>
	
	<div class="grid_3 omega">
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
	
	<div class="clear">&nbsp;</div>
	<hr class="thick mb" />
	
	<?php $i = 1; foreach($articles as $article) : ?>
		<div class="grid_4 mb<?php if( $i % 2 == 1 ) echo ' alpha'; else echo ' omega'; ?><?php if( $article->status == 0 ) echo ' unp'; ?>">
			<h3><a href="<?php echo $article->url ?>"><?php echo $article->headline_formatted ?></a></h3>
			
			<?php if( $article->authors->length ) : ?>
				<div class="byline aside mmb">By <?php echo strtoupper( $article->authors[0]->name ) ?> | <?php echo $this->datelineHelper( 'Time', $article->modified ) ?></div>
			<?php endif; ?>
			
			<?php $mugShot = $article->mediaByMetaProperty( 'mugshot', true );
			if( $article->mediaByType('image')->length ) : 
			$thumb = $article->mediaByType('image')->shift(); ?>
				<div class="thumb">
					<a href="<?php echo $article->url ?>"><img src="<?php echo $thumb->previewUrl ?>" alt="<?php echo $thumb->base_name ?>" /></a>
				</div>
			<?php endif; ?>
			
			<div class="abstract mb">
				<?php echo $article->abstract_formatted ?>
			</div>
		</div>
		<?php if( $i%2 !== 1 ) echo '<div class="clear">&nbsp;</div>'. "\n"; ?>
	<?php $i++; endforeach; ?>
	
	<div class="clear">&nbsp;</div>
	<div class="aside2 mb" style="text-align:right;"><a href="<?php echo Foundry::link( 'search' ).'?a=1&amp;tg='. urlencode(implode(', ', $section->tags->splat('name'))) ?>">MORE STORIES IN <?php echo strtoupper($section->name) ?> &raquo;</a></div>
	
	<hr class="thick mb" />
	
	<div class="grid_4 alpha">
		<?php Foundry::import( 'global:ads/section_banner1_300x100' ); ?>
	</div>
	
	<div class="grid_4 omega">
		<?php Foundry::import( 'global:ads/section_banner2_300x100' ); ?>
	</div>
	
	<div class="clear">&nbsp;</div>
	
	<?php Foundry::import( 'global:modules/section_mm', $section ); ?>
</div><!-- .grid8 -->

<div class="grid_4">
	<?php Foundry::import( 'article:sidebar' ); ?>
</div>

<div class="clear mbb">&nbsp;</div>
<?php Foundry::import( 'global:footer' ); ?>