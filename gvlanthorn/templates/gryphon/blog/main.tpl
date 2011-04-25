<?php
/*
Foundry_Registry::set( 'gfn:include.printstyles', array(
	Foundry::path( 'gfn-blackletter/css/print-article.css' )
));
*/

$blog = $data['blog'];
$post = $data['post'];

$mugShot = $post->mediaByMetaProperty( 'mugshot', true );
$images = $post->mediaByType( 'image', true );

$video = $post->mediaByType( 'flashVideo', true );
$audio = $post->mediaByType( 'audio', true );
$slides = $post->mediaByType( 'soundSlide', true );


Foundry::import( 'global:header', array(
	'title' => $blog->name. ' : '. $post->headline,
	'activeTab' => 'blogs',
	'feedlink' => array('title' => $blog->name, 'link' => $blog->url. '.xml')
));
?>

<div class="grid_8">
	<h1 class="article-head mmb<?php if( $post->status == 0 ) echo ' unp'; ?>"><?php echo $post->headline ?></h1>
	
	<div class="aside"><?php echo byLine($post); ?></div>
	
	<div class="aside mb"><em>Updated:</em> <?php echo $this->datelineHelper( 'long', $post->modified ) ?></div>
	
	<div id="story-sidebar" class="grid_4 omega">	
		<?php Foundry::import('article:tools', $post) ?>
		
		<div class="mod-head">
			<h4><a href="<?php echo $blog->url ?>"><?php echo $blog->name ?> &raquo;</a></h4>
		</div>
		<div class="mod mb">
			<div class="inner">
				<div class="caption mb">
					<?php echo $blog->description_formatted ; ?>
				</div>
				
				<div class="byline aside"><a href="<?php echo $blog->url ?>">Home</a> | <img src="<?php echo Foundry::path('gfn-lanthorn/assets/29.png') ?>" style="position:relative;top:3px;" /> <a href="<?php echo $blog->url ?>.xml">Subscribe</a></div>
			</div>
		</div>
		
		<?php if( $images->length ) : 
		foreach( $images as $item ) : ?>
			<?php if( $item->status == 0 ) echo '<div class="unp">'; ?>
			<div class="image mmb"><a href="<?php echo $item->bigUrl ?>" class="thickbox" name="<?php echo $item->caption ?>"><img src="<?php echo $item->smallUrl ?>" alt="<?php echo $item->base_name ?>" /></a></div>
			
			<?php if( $item->foto_pushed ) : ?>
				<a class="reprints-button" href="<?php echo FotobrokerSyncPlugin::buyURL( $item ) ?>"></a>
			<?php else : ?>
				<a class="reprints-button" href="<?php echo Foundry_Registry::get( 'foto:url' ); ?>"></a>
			<?php endif; ?>
			
			<?php echo creditLine($item); ?>
		
			<div class="clear mmb">&nbsp;</div>
			<div class="caption mmb">
				<?php echo $item->caption_formatted ?>
			</div>
			<?php if( $item->status == 0 ) echo '</div>'; ?>
		<?php endforeach; endif; ?>
	
	
		<?php if( $video->length || $audio->length || $slides->length ) : ?>
			<div class="mod-head">
				<h4>Multimedia</h4>
			</div>
			<div class="mod mb">
				<div class="inner">
					<?php
					foreach( $video as $item ) {
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
					?>
				</div>
			</div>
		<?php endif; ?>
		
		<div class="mod-head">
			<h4>Latest Entries</h4>
		</div>
		<div class="mod mb">
			<div class="inner">
				<ul class="links">
					<?php foreach( $blog->blogPosts as $item ) : ?>
						<li<?php if( $item->status == 0 ) echo ' class="unp"'; ?>><a href="<?php echo $item->url ?>"><?php echo $item->headline ?></a> &nbsp;<?php echo $this->datelineHelper( 'time', $item->created ) ?></li>
					<?php endforeach; ?>
				</ul>
			</div>
		</div>
	</div><!-- #story-sidebar -->

	
	<?php if( $mugShot->length ) : 
	foreach ( $mugShot as $item ) : ?>
	<div class="thumb<?php if( $item->status == 0 ) echo ' unp'; ?>">
		<img src="<?php echo $item->previewUrl ?>" alt="<?php echo $item->base_name ?>" />
		<div class="aside"><strong><?php echo $item->title ?></strong></div>
	</div>
	<?php endforeach; endif; ?>
	
	<div class="body-copy boot mmb">
		<?php echo $post->copy_formatted ?>
		<div class="clear">&nbsp;</div>
	</div>
	
	<div class="caption mmb">
		Published <?php echo date( 'F j, Y', $post->created ) ?> in <a href="<?php echo $blog->url ?>"><?php echo $blog->name ?></a>
	</div>
	
	
	<div id="emailbox" style="display:none">
		<form id="emailarticle" style="margin-top:10px;" method="post" action="<?php echo Foundry::link( 'mail' ) ?>">
			<input type="hidden" name="mailKey" value="<?php echo Foundry_Registry::get( 'sys:mail.key' ) ?>" />
			<input type="hidden" name="type" value="<?php echo Foundry_Registry::get( 'sys:mail.type' ) ?>" />
			<input type="hidden" name="id" value="<?php echo Foundry_Registry::get( 'sys:mail.objectID' ) ?>" />
		
			<div class="mmb aside2">
				<div style="width:100px;float:left;"><label for="mail_to">To</label></div>
				<div style="width:200px;float:left;">
					<input type="text" size="15" id="mail_to" name="to" />
				</div>
				<div class="clear">&nbsp;</div>
			</div>
		
			<div class="mmb aside2">
				<div style="width:100px;float:left;"><label for="mail_from">From:</label></div>
				<div style="width:200px;float:left;">
					<input type="text" size="15" id="mail_from" name="from" />
				</div>
				<div class="clear">&nbsp;</div>
			</div>
			
			<div style="width:100px;float:left;">&nbsp;</div>
			<div style="width:200px;float:left;">		
				<input type="submit" value="Submit" />
			</div>
			<div class="clear">&nbsp;</div>
		</form>
	</div>
	
</div>

<div class="grid_4">
	<?php $words = str_word_count( $post->copy );
	if($words < 650) Foundry::import( 'article:sidebar', 'short' );
	else Foundry::import( 'article:sidebar' ) ?>
</div>

<div class="clear">&nbsp;</div>
<hr class="grid_12 thick mmb" />


<div class="grid_6" id="comments">
	<?php
		if ( $post->comments->length == 1) $commentWord = ' Comment';
		else $commentWord = ' Comments';
	?>
	<h2 class="mmb"><?php echo $post->comments->length. $commentWord ?></h2>
	
	<?php if( $post->comments->length ) Foundry::import( 'comment:display', $post->comments ); ?>
</div>

<div class="grid_4">
	<?php if( $post->allow_comments ) : ?>
		<?php Foundry::import( 'comment:form' ) ?>
	<?php else : ?>
		<p><strong>Comments are closed for this item.</strong></p>
	<?php endif ?>
	
	<h5>You Should Know:</h5>

	<p class="aside"><?php echo Foundry_Registry::get('gfn:publication.name') ?> reserves the right to remove any comment deemed racially derogatory, inflammatory, or spammatory. Repeat offenders may have their IP address banned from posting future comments. Please be nice.</p>
	
	<h5>Formatting Options:</h5>
	<ul id="format_options" class="aside mb">
		<li>Links: "my link":http://my.url.com</li>
		<li>Bold: *something!*</li>
		<li>Italic: _OMG!_</li>
	</ul>

</div>

<div class="grid_2">
	<div class="mmb">&nbsp;</div>
	<?php Foundry::import( 'global:ads/comment_skyscraper_120x600' ); ?>
</div>

<div class="clear">&nbsp;</div>

<?php Foundry::import( 'global:footer' ); ?>