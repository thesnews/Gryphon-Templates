<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Foundry3</title>
    <style type="text/css">
		body { font-family: sans-serif; font-size: 12px; background: #F1F1F1; }
		
		h1, h2 { color: #09F; font-family: Georgia, serif; }
		
		
		#main { width: 500px; margin: auto; position: relative;	background: #fff;
				padding: 5px; border: 1px solid #ccc; margin-bottom: 1em; }
		
		a { color: #06F; text-decoration: none; }
		
		a:hover { background: #06F;	color: #FFF; }
		
		li { padding: .2em 0 .2em 0; }
	</style>
		
</head>
<body>

<div id="main">

<h1>FoundryView <?php echo Foundry::$status['libs']['FoundryView'] ?></h1>

<p>
	This is the default template, you can edit the contents by going to:
	<br />
	<code>
		[document root]/app/views/<?php echo Foundry_Request::get( 'controller', 'specialChars' ) ?>/main.tpl
	</code>
</p>

<h2>Component Status</h2>

<? foreach( Foundry::$status['libs'] as $component => $version ) : ?>
	<?=$component?> (<?=$version?>)<br />
<? endforeach ?>

<hr />

<p>
	Foundry <?php echo Foundry::$status['libs']['Foundry'] ?> 
	is copyright 2004-<?php echo date('Y') ?>
	<a href="http://www.statenews.com">State News, Inc.</a>
</p>
</div> <!-- /#main -->

</body>
</html>
