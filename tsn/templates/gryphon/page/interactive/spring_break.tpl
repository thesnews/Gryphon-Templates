<?php
	Foundry_Registry::set( 'gfn:template.title', 'Interactive - Spring break' );
	Foundry_Registry::set( 'gfn:template.activeNav', 'multimedia' );
	Foundry_Registry::set( 'gfn:template.subActiveNav', 'Interactives' );

?>

<div class="grid_8">

	<script language="javascript">AC_FL_RunContent = 0;</script>
	<script src="<?php echo Foundry::path( 'interactive/spring_break09/AC_RunActiveContent.js' )?>" language="javascript"></script>

	<script language="javascript">
		if (AC_FL_RunContent == 0) {
			alert("This page requires AC_RunActiveContent.js.");
		} else {
			AC_FL_RunContent(
				'codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0',
				'width', '600',
				'height', '436',
				'src', '<?php echo Foundry::path( "interactive/spring_break09/springbreak-Lipowski" ) ?>',
				'quality', 'high',
				'pluginspage', 'http://www.macromedia.com/go/getflashplayer',
				'align', 'middle',
				'play', 'true',
				'loop', 'true',
				'scale', 'showall',
				'wmode', 'window',
				'devicefont', 'false',
				'id', 'springbreak-Lipowski',
				'bgcolor', '#ffffff',
				'name', 'springbreak-Lipowski',
				'menu', 'true',
				'allowFullScreen', 'false',
				'allowScriptAccess','sameDomain',
				'movie', '<?php echo Foundry::path( "interactive/spring_break09/springbreak-Lipowski" ) ?>',
				'salign', ''
				); //end AC code
		}
	</script>
	<noscript>
		<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="600" height="436" id="springbreak-Lipowski" align="middle">
		<param name="allowScriptAccess" value="sameDomain" />
		<param name="allowFullScreen" value="false" />
		<param name="movie" value="<?php echo Foundry::path( 'interactive/spring_break09/springbreak-Lipowski.swf' ) ?>" /><param name="quality" value="high" /><param name="bgcolor" value="#ffffff" />	<embed src="<?php echo Foundry::path( 'interactive/spring_break09/springbreak-Lipowski.swf' ) ?>" quality="high" bgcolor="#ffffff" width="600" height="436" name="springbreak-Lipowski" align="middle" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
		</object>
	</noscript>


	<div style="font-size:.8em;">Source: The State News&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;Produced by Jessica Lipowski</div>
</div>
<div class="grid_4">
	<?php Foundry::import( 'global:sidebar-short' ) ?>
</div>

<hr class="spacer" />

<div class="grid_12"><div class="box gray more">
	<h5>RECENT MULTIMEDIA:<span><a href="<?php echo Foundry::link( 'multimedia' ) ?>">More multimedia &#187;</a></span></h5>
	<?php $mm = _M( 'media' )->setInverseRelationship( 'tag', array(
		'limit' => 7
	))->findByTags( _M( 'tag' )->findByName( 'multimedia box' ) ); ?>
	
	<?php foreach( $mm as $m ) : ?>
		<div>
			<a href="<?php echo $m->url ?>"><img src="<?php echo $m->previewUrl ?>" /></a><br />
			<h5><a href="<?php echo $m->url ?>"><?php echo $m->title ?></a></h5>
		</div>
	<?php endforeach ?>
	<hr class="clear" />
</div></div>

<hr class="spacer" />
