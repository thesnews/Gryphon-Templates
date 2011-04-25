<?php $item = $data ?>
<script type="text/javascript">
function fbs_click() {
	u = '<?php echo $item->url ?>';
	t = '<?php echo urlencode( $item->headline ) ?>';
	window.open(
		'http://www.facebook.com/sharer.php?u=' + encodeURIComponent(u) + '&t=' + encodeURIComponent(t),
		'sharer',
		'toolbar=0,status=0,width=626,height=436'
	);
	return false;
}

<?php /*
$(document).ready(function() {
	$("a[href='#print']").bind("click", function(){
		window.print();  
	});
	
	$("#email_link").bind("click", function(){
		pageTracker._trackEvent("Article Events", "Email", "<?php echo $item->slug ?>");
	});
});
*/ ?>
</script>
<div class="hat">
	<div class="right aside">
		
		<?php /*<a id="email_link" href="#TB_inline?height=200&width=350&inlineId=emailbox" class="thickbox"  title="Email this item"><img src="<?php echo Foundry::path('gfn-lanthorn/assets/tools/email.gif') ?>" style="position:relative;top:3px;" alt="Email this item" /></a> &nbsp;|&nbsp; */ ?><a href="http://www.facebook.com/share.php?u=<?php echo $item->url ?>" onclick="return fbs_click()" target="_blank" title="Share on Facebook"><img src="<?php echo Foundry::path('gfn-lanthorn/assets/tools/facebook.png') ?>" style="position:relative;top:4px;" /></a>&nbsp;&nbsp;<a href="http://del.icio.us/post" onclick="window.open('http://del.icio.us/post?v=4&amp;noui&amp;jump=close&amp;url='+encodeURIComponent('<?php echo $item->url ?>')+'&amp;title='+encodeURIComponent('<?php echo $item->headline ?>'), 'delicious','toolbar=no,width=700,height=400'); return false;" title="Share on Delicious"><img src="<?php echo Foundry::path('gfn-lanthorn/assets/tools/delicious.png') ?>" style="position:relative;top:4px;" alt="Share on Delicious" /></a>&nbsp;&nbsp;<a href="http://digg.com/submit?phase=2&amp;url=<?php echo urlencode( $item->url ) ?>&amp;title=<?php echo urlencode( $item->headline ) ?>&amp;bodytext=<?php echo urlencode( $item->abstract ) ?>" title="Share on Digg"><img src="<?php echo Foundry::path('gfn-lanthorn/assets/tools/digg.png') ?>" style="position:relative;top:4px;" alt="Share on Digg" /></a>
	</div>
	<h5>Share</h5>
</div>