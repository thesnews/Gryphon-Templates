<?php
	Foundry_Registry::set( 'gfn:template.title', 'Interactive - Same-sex marriage in the United States' );
	Foundry_Registry::set( 'gfn:template.activeNav', 'multimedia' );
	Foundry_Registry::set( 'gfn:template.subActiveNav', 'Interactives' );

?>

<div class="grid_8">
	<script language="javascript">AC_FL_RunContent = 0;</script>
	<script src="{{ 'interactive/abdelkader/AC_RunActiveContent.js'|url }}" language="javascript"></script>
	<script language="javascript">
		if (AC_FL_RunContent == 0) {
			alert("This page requires AC_RunActiveContent.js.");
		} else {
			AC_FL_RunContent(
				'codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0',
				'width', '600',
				'height', '516',
				'src', '{{ 'interactive/marriage_rights/marriage_rights'|url }}',
				'quality', 'high',
				'pluginspage', 'http://www.macromedia.com/go/getflashplayer',
				'align', 'middle',
				'play', 'true',
				'loop', 'true',
				'scale', 'showall',
				'wmode', 'window',
				'devicefont', 'false',
				'id', 'marriage_rights',
				'bgcolor', '#ffffff',
				'name', 'marriage_rights',
				'menu', 'true',
				'allowFullScreen', 'false',
				'allowScriptAccess','sameDomain',
				'movie', '{{ 'interactive/marriage_rights/marriage_rights'|url }}',
				'salign', ''
				); //end AC code
		}
	</script>
	<noscript>
		<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="600" height="516" id="Marriage Rights" align="middle">
		<param name="allowScriptAccess" value="sameDomain" />
		<param name="allowFullScreen" value="false" />
		<param name="movie" value="{{ 'interactive/marriage_rights/marriage_rights.swf'|url }}" /><param name="quality" value="high" /><param name="bgcolor" value="#ffffff" />	<embed src="{{ 'interactive/marriage_rights/marriage_rights.swf'|url }}" quality="high" bgcolor="#ffffff" width="600" height="516" name="Marriage Rights" align="middle" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
		</object>
	</noscript>
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
