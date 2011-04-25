<?php
/*
Foundry_Registry::set( 'gfn:include.printstyles', array(
	Foundry::path( 'gfn-blackletter/css/print-article.css' )
));
*/

$article = $data['article'];

$mugShot = $article->mediaByMetaProperty( 'mugshot', true );
$images = $article->mediaByType( 'image', true );

$video = $article->mediaByType( 'flashVideo', true );
$mp4 = $article->mediaByType( 'video', true );
$audio = $article->mediaByType( 'audio', true );
$slides = $article->mediaByType( 'soundSlide', true );
$pdf = $article->mediaByType( 'pdf', true );

// Determine active tab
if( in_array('sports', $article->sections->splat('slug')) ) {
	$activeTab = 'sports';
} elseif( in_array('laker_life', $article->sections->splat('slug')) ) {
	$activeTab = 'laker_life';
} elseif( in_array('ae', $article->sections->splat('slug')) ) {
	$activeTab = 'ae';
} elseif( in_array('editorial', $article->sections->splat('slug')) ) {
	$activeTab = 'editorial';
} elseif( in_array('news', $article->sections->splat('slug')) ) {
	$activeTab = 'news';
} else {
	$activeTab = 0;
}

Foundry::import( 'global:header', array('title' => $article->headline, 'activeTab' => $activeTab) );
?>

<div id="alt2" class="grid_8">
	<h1 class="article-head<?php if( $article->status == 0 ) echo ' unp'; ?>"><?php echo $article->headline_formatted ?></h1>
	<h3 class="article-subhead"><em><?php echo $article->subhead_formatted ?></em></h3>
	
	<div class="mmb">&nbsp;</div>
	
	<div class="aside"><?php echo byLine($article); ?></div>
	
	<div class="aside mb"><em>Updated:</em> <?php echo $this->datelineHelper( 'long', $article->modified ) ?></div>
	
	<div class="body-copy">
		<?php echo Foundry::extract( $article->copy_formatted, 3 ) ?>
	</div>
	
	<div id="story-sidebar" class="grid_4 omega">
		<?php Foundry::import('article:tools', $article) ?>
		
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
			<div class="aside2 mmb">
				<?php echo $item->caption_formatted ?>
			</div>
			<?php if( $item->status == 0 ) echo '</div>'; ?>
		<?php endforeach; endif; ?>
	
	
		<?php if( $video->length || $audio->length || $slides->length ) : ?>
			<div class="hat mb">
				<h5 class="mb">Multimedia</h5>
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
				}
				?>
			</div>
		<?php endif; ?>
		
		<?php if( $article->infobox ) : ?>
			<div class="hat mb">
				<h5 class="mb">More information</h5>
				<div class="infobox">
					<?php echo $article->infobox_formatted ?>
				</div>
			</div>
		<?php endif; ?>
		
		<div class="hat boot mb">
			<h5 class="mb">Possibly Related</h5>
			<ul class="links mmb">
				<?php foreach( $article->related as $item ) : ?>
					<li><a href="<?php echo $item->url ?>"><?php echo $item->headline ?></a> &nbsp;<?php echo $this->datelineHelper( 'time', $item->created ) ?></li>
				<?php endforeach; ?>
			</ul>
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
		<?php echo Foundry::extract( $article->copy_formatted, null, 3 ) ?>
		<div class="clear">&nbsp;</div>
	</div>
	
	<div class="caption mmb">
		Published <?php echo date( 'F j, Y', $article->created ) ?>
		
		<?php
		if( $article->sections->length ) :
			$i = 1;
			$limit = $article->sections->length;
			
			if( in_array(Foundry_Registry::get('gfn:section.default'), $article->sections->splat('slug')) ) :
				$limit--;
			endif;
			
			if( $limit ) echo 'in ';
			
			foreach( $article->sections as $section ) :
				if( $section->slug == Foundry_Registry::get('gfn:section.default') ) continue; // Exclude front page section
				
				echo '<a href="'. $section->url .'">'. $section->name .'</a>';
				if( $i < $limit ) echo ', ';
				$i++;
			endforeach;
		endif;
		?>
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
	<?php Foundry::import( 'article:sidebar' ); ?>
</div>

<div class="clear">&nbsp;</div>
<hr class="grid_12 thick mmb" />


<div class="grid_6" id="comments">
	<?php
		if ( $article->comments->length == 1) $commentWord = ' Comment';
		else $commentWord = ' Comments';
	?>
	<h2 class="mmb"><?php echo $article->comments->length. $commentWord ?></h2>
	
	<?php if( $article->comments->length ) :
		Foundry::import( 'comment:display', $article->comments );
	else: 
		echo '<p class="body-copy">Be the first to comment on this article!</p>';
	endif; ?>
</div>

<div class="grid_4">
	<?php if( $article->allow_comments ) : ?>
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