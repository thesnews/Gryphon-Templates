<div class="mod-head">
	<h4>Social Media</h4>
</div>
<div class="mod mb">
	<div class="inner">
		<ul class="links">
			<?php if( Foundry_Registry::get( 'dsw:twitterurl' ) ) : ?>
			<li><img src="<?php echo Foundry::path('gfn-lanthorn/assets/twitter.png') ?>" style="position:relative;top:2px;" alt="icn" />&nbsp;&nbsp;<a href="<?php echo Foundry_Registry::get('dsw:twitterurl') ?>" class="head4">Twitter</a></li>
			<?php endif; ?>
			
			<li><img src="<?php echo Foundry::path('gfn-lanthorn/assets/twitter.png') ?>" style="position:relative;top:2px;" alt="icn" />&nbsp;&nbsp;<a href="http://www.twitter.com/lanthornsports" class="head4">Twitter (Sports)</a></li>
			
			<li><img src="<?php echo Foundry::path('gfn-lanthorn/assets/twitter.png') ?>" style="position:relative;top:2px;" alt="icn" />&nbsp;&nbsp;<a href="http://www.twitter.com/gvlarts" class="head4">Twitter (A&amp;E)</a></li>
			
			<?php if( Foundry_Registry::get( 'dsw:facebookurl' ) ) : ?>
			<li><img src="<?php echo Foundry::path('gfn-lanthorn/assets/facebook.png') ?>" style="position:relative;top:2px;" alt="icn" />&nbsp;&nbsp;<a href="<?php echo Foundry_Registry::get('dsw:facebookurl') ?>" class="head4">Facebook</a></li>
			<?php endif; ?>
			
			<li><img src="<?php echo Foundry::path('gfn-lanthorn/assets/youtube.png') ?>" style="position:relative;top:2px;left:-1px;" alt="icn" />&nbsp;&nbsp;<a href="http://www.youtube.com/user/gvsulanthorn" class="head4" style="margin-left:-1px;">YouTube</a></li>
			
			<?php if( Foundry_Registry::get( 'dsw:emailurl' ) ) : ?>
			<li><img src="<?php echo Foundry::path('gfn-lanthorn/assets/icons/email_14.gif') ?>" style="position:relative;top:2px;" alt="icn" />&nbsp;&nbsp;<a href="<?php echo Foundry_Registry::get('dsw:emailurl') ?>" target="_blank" class="head4">Email Edition</a></li>
			<?php endif; ?>
			
			<li><img src="<?php echo Foundry::path('gfn-lanthorn/assets/29.png') ?>" style="position:relative;top:1px;margin-right:2px;" alt="icn" />&nbsp;&nbsp;<a href="<?php echo Foundry::link('page/feeds') ?>" class="head4">RSS Feeds</a></li>
		</ul>
	</div>
</div>