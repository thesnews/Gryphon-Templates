<?php Foundry::import( 'global:header', array(
	'title' => 'Blogs',
	'activeTab' => 'blogs'
)); ?>

<div class="grid_8">
	<h1><?php echo Foundry_Registry::get('gfn:publication.name') ?> Blogs</h1>
		
	<div class="mmb">&nbsp;</div>
	
	<div class="body-copy boot mb">
		<p>Opinions expressed in blog posts are those of the authors, and not of <?php echo Foundry_Registry::get('gfn:publication.name') ?>.</p>
	</div>
	
	<?php $i = 1; foreach( $data['blogs'] as $blog ) :
	$posts = $blog->blogPosts;
	?>
		<div class="grid_4<?php if( $i % 2 == 1 ) echo ' alpha'; else echo ' omega'; ?>">
			<div class="mod-head">
				<h4><a href="<?php echo $blog->url ?>"><?php echo $blog->name ?> &raquo;</a></h4>
			</div>
			<div class="mod mb">
				<div class="inner">
					<div class="caption mb">
						<?php echo $blog->description_formatted ; ?>
					</div>
					
					<div><span class="byline aside"><a href="<?php echo $blog->url ?>"><?php echo $posts->length; ?> entries</a> | <img src="<?php echo Foundry::path('gfn-lanthorn/assets/29.png') ?>" style="position:relative;top:3px;" alt="icn" /> <a href="<?php echo $blog->url ?>.xml">Subscribe</a> | Updated:</span> <?php echo $this->datelineHelper( 'time', $posts[0]->created ) ?></div>
				</div>
			</div>
		</div>
		
		<?php if( $i%2 !== 1 ) echo '<div class="clear">&nbsp;</div>'. "\n"; ?>
	<?php $i++; endforeach; ?>
</div>

<div class="grid_4">
	<?php Foundry::import( 'article:sidebar', 'short' ); ?>
</div>

<div class="clear mbb">&nbsp;</div>
<?php Foundry::import( 'global:footer' ); ?>