<?php
/*
Foundry_Registry::set( 'gfn:include.printstyles', array(
	Foundry::path( 'gfn-blackletter/css/print-article.css' )
));
*/

$page = $data['page'];

Foundry::import( 'global:header', array('title' => 'RSS Feeds') );
?>

<div class="grid_8">
	<h1>RSS Feeds</h1>
	
	<div class="mmb">&nbsp;</div>
	
	<div class="body-copy">
		<p>Subscribe to our RSS (<a href="http://en.wikipedia.org/wiki/Rss" target="_new">Really Simple Syndication</a>) feeds to get the latest updates from <?php echo Foundry_Registry::get( 'gfn:publication.name' ) ?> delivered directly to your favorite feed reader. You can subscribe to the comment feed of any article on our site by clicking the RSS ( <img src="<?php echo Foundry::path( 'style/images/feed.png' ) ?>" alt="RSS" style="position:relative;top:2px;" /> ) link in the article sidebar.</p>
	</div>
	
	<hr class="single mb" />
	
	<div class="grid_4 alpha">
		<div class="mod-head">
			<h4>Main Content Feeds</h4>
		</div>
		<div class="mod mb">
			<div class="inner">
				<h3 class="mmb"><img src="<?php echo Foundry::path( 'gfn-lanthorn/assets/29.png' ) ?>" alt="(RSS)" style="position:relative;top:2px;" />&nbsp;<a href="<?php echo Foundry::link( 'recent/article.xml' ) ?>">Articles and Blogs</a></h3>
		
				<h3 class="mb"><img src="<?php echo Foundry::path( 'gfn-lanthorn/assets/29.png' ) ?>" alt="(RSS)" style="position:relative;top:2px;" />&nbsp;<a href="<?php echo Foundry::link( 'recent/comment.xml' ) ?>">Comments</a></h3>
			</div>
		</div>
		
		<div class="mod-head">
			<h4>Blog Feeds</h4>
		</div>
		<div class="mod mb">
			<div class="inner">
				<?php $blogs = _M('blog')->find( 'order by blog:name asc limit 20' ); ?>
				<ul>
					<?php foreach( $blogs as $item ) : ?>
					<li><img src="<?php echo Foundry::path( 'gfn-lanthorn/assets/29.png' ) ?>" alt="(RSS)" style="position:relative;top:2px;" />&nbsp;<a href="<?php echo $item->url. '.xml' ?>"><?php echo $item->name ?></a></li>
					<?php endforeach; ?>
				</ul>
			</div>
		</div>
	</div>
	
	<div class="grid_4 omega">
		<div class="mod-head">
			<h4>Section Feeds</h4>
		</div>
		<div class="mod mb">
			<div class="inner">
				<ul>
					<li><img src="<?php echo Foundry::path( 'gfn-lanthorn/assets/29.png' ) ?>" alt="(RSS)" style="position:relative;top:2px;" />&nbsp;<a href="<?php echo Foundry::link( 'section/pageOne.xml' ) ?>">Top Stories</a></li>
					
					<li><img src="<?php echo Foundry::path( 'gfn-lanthorn/assets/29.png' ) ?>" alt="(RSS)" style="position:relative;top:2px;" />&nbsp;<a href="<?php echo Foundry::link( 'section/news.xml' ) ?>">News</a></li>
					
					<li><img src="<?php echo Foundry::path( 'gfn-lanthorn/assets/29.png' ) ?>" alt="(RSS)" style="position:relative;top:2px;" />&nbsp;<a href="<?php echo Foundry::link( 'section/sports.xml' ) ?>">Sports</a></li>
					
					<li><img src="<?php echo Foundry::path( 'gfn-lanthorn/assets/29.png' ) ?>" alt="(RSS)" style="position:relative;top:2px;" />&nbsp;<a href="<?php echo Foundry::link( 'section/ae.xml' ) ?>">A&amp;E</a></li>
				
					<li><img src="<?php echo Foundry::path( 'gfn-lanthorn/assets/29.png' ) ?>" alt="(RSS)" style="position:relative;top:2px;" />&nbsp;<a href="<?php echo Foundry::link( 'section/laker_life.xml' ) ?>">Laker Life</a></li>
				
					<li><img src="<?php echo Foundry::path( 'gfn-lanthorn/assets/29.png' ) ?>" alt="(RSS)" style="position:relative;top:2px;" />&nbsp;<a href="<?php echo Foundry::link( 'section/editorial.xml' ) ?>">Editorial</a></li>
				</ul>
			</div>
		</div>
		
		<div class="mod-head">
			<h4>Sports Feeds</h4>
		</div>
		<div class="mod mb">
			<div class="inner">
				<ul>
					<?php foreach( _M('section')->findBySidebar('sports') as $item ) : ?>
					<li><img src="<?php echo Foundry::path( 'gfn-lanthorn/assets/29.png' ) ?>" alt="(RSS)" style="position:relative;top:2px;" />&nbsp;<a href="<?php echo $item->url. '.xml' ?>"><?php echo $item->name ?></a></li>
					<?php endforeach; ?>
				</ul>
			</div>
		</div>
	</div>
</div>

<div class="grid_4">
	<?php Foundry::import( 'article:sidebar', 'short' ); ?>
</div>

<div class="clear mbb">&nbsp;</div>
<?php Foundry::import( 'global:footer' ); ?>