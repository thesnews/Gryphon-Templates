<?php
$section = $data['section'];
$articles = $data['articles'];

//$topStory = $articles->shift();
//$sidebarStories = $articles->shift(2);
$half = ceil( $articles->length / 2 );
$col1 = $articles->shift($half);

if( $section->sidebar ) {
	$activeTab = $section->sidebar;
} else {
	$activeTab = $section->slug;
}
		
Foundry::import( 'global:header', array(
	'title' => $section->name,
	'activeTab' => $activeTab,
	'feedlink' => array('title' => Foundry_Registry::get('gfn:publication.name'). ' : '. $section->name, 'link' => $section->url. '.xml')
));
?>

<div class="grid_8">
	<div class="grid_4 alpha">
		<?php if( $col1->length ) : foreach( $col1 as $article ) : ?>
			<div class="mb<?php if( $article->status == 0 ) echo ' unp'; ?>">
				<h3 class="link"><?php echo $article->headline_formatted ?></h3>
				
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
				
				<div class="abstract">
					<?php echo Foundry::extract( $article->copy_formatted, 3 ) ?>
					<?php // echo $article->copy_formatted ?>
				</div>
				<hr />
			</div>
		<?php endforeach; endif; ?>
	</div>
	
	<div class="grid_4 omega">
		<?php if( $articles->length ) : foreach( $articles as $article ) : ?>
			<div class="mb<?php if( $article->status == 0 ) echo ' unp'; ?>">
				<h3 class="link"><?php echo $article->headline_formatted ?></h3>
				
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
				
				<div class="abstract">
					<?php echo Foundry::extract( $article->copy_formatted, 3 ) ?>
					<?php // echo $article->copy_formatted ?>
				</div>
				<hr />
			</div>
		<?php endforeach; endif; ?>
	</div>
	
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
</div><!-- .grid8 -->

<div class="grid_4">
	<?php Foundry::import( 'article:sidebar' ); ?>
</div>

<div class="clear mbb">&nbsp;</div>
<?php Foundry::import( 'global:footer' ); ?>