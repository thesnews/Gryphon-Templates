<?php
	$recipient = $data['recipient'];
	$webmaster = Foundry::registry( 'webmaster_mail' );
?>

<?php Foundry::import( 'global:header' ) ?>


<div class="container">
	<h1>Mail settings changed</h1>
	
	<p>This site will no longer allow mail sent to <?php echo $recipient->address ?>. If you have questions, please contact <a href="mailto:<?php echo $webmaster ?>"><?php echo $webmaster ?></a>.</p>
</div>
<?php Foundry::import( 'global:footer' ) ?>