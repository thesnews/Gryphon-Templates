<?php foreach( $data as $comment ) : ?>
<div id="comment<?php echo $comment->uid ?>" class="boot mmb">
	<?php echo $comment->comment_formatted ?>
	
	<?php if( $comment->status == 0 ) : ?>
		<p><strong class="attn">Comment Removed</strong></p>
	<?php else: ?>
		<div class="aside right">
		<a href="<?php echo Foundry::link( 'comment/flag/'.$comment->uid ) ?>">Flag for moderation</a>
		</div>
	<?php endif; ?>
	
	<div class="aside2 mmb">&mdash; <em><?php echo date( 'g:i A F j, Y', $comment->created ) ?>,</em> by <strong><?php echo $comment->name ?></strong></div>
	
	<div class="clear">&nbsp;</div>
	
	<?php if( isAuthenticated() === true ) : ?>
		<div class="mb">
			<strong>IP Address:</strong> <?php echo $comment->ip ?><br />
			<strong>Email:</strong> <?php echo $comment->email ?><br />
			<a href="<?php echo Foundry::link( 'commentAdmin/remove/'.$comment->uid ) ?>">Remove</a><br />
			<a href="<?php echo Foundry::link( 'commentAdmin/ban/'.$comment->uid ) ?>">Ban IP address</a>
		</div>
	<?php endif ?>
</div>
<?php endforeach ?>