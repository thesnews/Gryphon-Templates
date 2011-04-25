<?php

	$chartId = 'ofchart'.rand(0,99);
?>

<div id="<?php echo $chartId ?>"></div>

<script type="text/javascript">
if( Browser.Engine.trident && Browser.Engine.version < 5 ) {
	var obj = swfobject.embedSWF( 
		'<?php echo Foundry::path( "flash/open_flash_charts/open-flash-chart.swf" ) ?>',
		'<?php echo $chartId ?>', "265", "399", "9.0.0", "expressInstall.swf", 
		{'id': '<?php echo $chartId ?>', 'data-file': "<?php echo $this->originalUrl ?>"},
		{'wmode': 'opaque'} ); 
} else {
	var obj = new Swiff( '<?php echo Foundry::path( "flash/open_flash_charts/open-flash-chart.swf" ) ?>', {
		container: $('<?php echo $chartId ?>'),
		id: '<?php echo $chartId ?>',
		width: 265,
		height: 300,
		vars: {
			'id': '<?php echo $chartId ?>',
			'data-file': "<?php echo $this->originalUrl ?>"
		}
	});
}
</script>
