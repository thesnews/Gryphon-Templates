<div id="leaderboard">
	<?php Foundry::import( 'global:ads/leaderboard_728x90' ); ?>
</div><!-- #leaderboard -->

<div id="footer">
	<div id="footer-content">
		<div class="right">
			<p>
				<a href="<?php echo Foundry::link('/') ?>">Home</a> | <a href="<?php echo Foundry::link('section/news') ?>">News</a> | <a href="<?php echo Foundry::link('section/sports') ?>">Sports</a> | <a href="<?php echo Foundry::link('section/ae') ?>">A&amp;E</a> | <a href="<?php echo Foundry::link('section/laker_life') ?>">Laker Life</a> | <a href="<?php echo Foundry::link('section/editorial') ?>">Editorial</a> | <a href="<?php echo Foundry::link('blog') ?>">Blogs</a> | <a href="<?php echo Foundry::link('multimedia') ?>">Multimedia</a><br /><a href="<?php echo Foundry::link( 'search' ). '?a=1' ?>">Archives</a> | <a href="<?php echo Foundry::link('page/advertising') ?>">Advertising</a> | <a href="<?php echo Foundry::link('page/contact') ?>">Contact Us</a> | <a href="<?php echo Foundry::link('page/about_us') ?>">About Us</a> | <a href="<?php echo Foundry::link('calendar') ?>">Event Calendar</a> | <a href="<?php echo Foundry::link('page/feeds') ?>">RSS</a><br /><a href="<?php echo Foundry::link('classified') ?>">Classifieds</a> | <a href="<?php echo Foundry_Registry::get( 'foto:url' ) ?>">Photo Store</a> | <a href="http://www.gvsuoffcampushousing.com">Housing</a> | <a href="<?php echo Foundry::link('page/travel') ?>">Travel</a> | <a href="<?php echo Foundry::link('page/privacy') ?>">Privacy Policy</a>
			</p>
			<p class="copy">Copyright &copy;<?php echo date('Y'). ' '. Foundry_Registry::get('gfn:publication.name') ?>. All rights reserved.</p>
		</div>
		
		<div class="clear">&nbsp;</div>
		
		<a href="http://detroitsoftworks.com" target="_blank" class="icn">Powered by Detroit Softworks</a>
	</div><!-- #footer-content -->
</div><!-- #footer -->

<?php Foundry::import( 'global:tracker' ); ?>
</body>
</html>