<div id="leaderboard">
	<?php Foundry::import( 'global:ads/leaderboard_728x90' ); ?>
</div><!-- #leaderboard -->

<div id="footer">
	<div id="footer-content">
		<div class="right">
			<p>
				<a href="{{ 'index.php'|url }}">Home</a> | <a href="{{ 'section/news'|url }}">News</a> | <a href="{{ 'section/sports'|url }}">Sports</a> | <a href="{{ 'section/ae'|url }}">A&amp;E</a> | <a href="{{ 'section/laker_life'|url }}">Laker Life</a> | <a href="{{ 'section/editorial'|url }}">Editorial</a> | <a href="{{ 'blog'|url }}">Blogs</a> | <a href="{{ 'multimedia'|url }}">Multimedia</a><br /><a href="{{  'search'|url }}">Archives</a> | <a href="{{ 'page/advertising'|url }}">Advertising</a> | <a href="{{ 'page/contact'|url }}">Contact Us</a> | <a href="{{ 'page/about_us'|url }}">About Us</a> | <a href="{{ 'calendar'|url }}">Event Calendar</a> | <a href="{{ 'page/feeds'|url }}">RSS</a><br /><a href="{{ 'classified'|url }}">Classifieds</a> | <a href="{{ 'foto:url'|url  }}">Photo Store</a> | <a href="http://www.gvsuoffcampushousing.com">Housing</a> | <a href="{{ 'page/travel'|url }}">Travel</a> | <a href="{{ 'page/privacy'|url }}">Privacy Policy</a>
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