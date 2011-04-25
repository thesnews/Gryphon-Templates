<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="generator" content="Gryphon <?php echo __VERSION ?>" />
	<title>Oops</title>

    <style type="text/css">

    </style>
</head>
<body>
	<!--
		This is a second level exception template. While the error template
		allows you to access some of Gryphon's systems, in this template you
		only have access to one variable '$message'. You should avoid calling
		any other Gryphon processes as that may cause further errors.
		
		Any CSS or Javascript should be inlined or included with absolute paths.
	-->
	<h1>Oops</h1>
	
	<p>
		<?php echo $message ?>
	</p>
	(Code: <?php echo $ex->getCode(); ?>) File:
	<?php echo $ex->getFile() ?>[:<?php echo $ex->getLine() ?>]
	<br /><br />
	<?php echo $ex->getMessage() ?>
	
	<hr />
	
	<pre>
	<?php print_r( $ex->getTrace() ) ?>
	</pre>
</body>
</html>