<?php
$blog = $data['blog'];
$posts = $data['posts'];

Foundry::import( 'global:header', array(
	'title' => $blog->name,
	'activeTab' => 'blogs',
	'feedlink' => array('title' => $blog->name, 'link' => $blog->url. '.xml')
));
?>

<div class="grid_8">
	<div class="right"><img src="<?php echo Foundry::path('gfn-lanthorn/assets/29.png') ?>" style="position:relative;top:2px;" /> <a href="{{ blog.url }}.xml">RSS</a></div>
	<h1><?php echo $blog->name ?></h1>
		
	<div class="mmb">&nbsp;</div>
	
	<div class="body-copy boot mmb">
		<?php echo $blog->description_formatted ?>
	</div>
	
	<?php foreach( $posts as $post ) : ?>
		<?php if( $post->status == 0 ) echo '<div class="unp">'; ?>
		<h3 class="mmb"><a href="<?php echo $post->url ?>"><?php echo $post->headline ?></a> &nbsp;<span class="byline aside"><?php echo $post->comments->length; ?> comments |</span> <?php echo $this->datelineHelper( 'time', $post->created ) ?></h3>
		
		<div class="body-copy">
			<?php echo $post->abstract_formatted ?>
			<p><a href="<?php echo $post->url ?>">Continue reading &raquo;</a></p>
		</div>
		
		<hr class="mb" />
		<?php if( $post->status == 0 ) echo '</div>'; ?>
	<?php endforeach; ?>
</div>

<div class="grid_4">
	<?php Foundry::import( 'article:sidebar', 'short' ); ?>
</div>

<div class="clear mbb">&nbsp;</div>
<?php Foundry::import( 'global:footer' ); ?>