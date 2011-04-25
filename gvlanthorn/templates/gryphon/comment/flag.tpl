<?php
/*
Foundry_Registry::set( 'gfn:include.printstyles', array(
	Foundry::path( 'gfn-blackletter/css/print-article.css' )
));
*/

$comment = $data['comment'];
$article = $comment->item;

Foundry_Registry::set( 'gfn:template.title', 'Comment - Flag' );

// Determine active tab
if( in_array('sports', $article->sections->splat('slug')) ) {
	$activeTab = 'sports';
} elseif( in_array('laker_life', $article->sections->splat('slug')) ) {
	$activeTab = 'laker_life';
} elseif( in_array('ae', $article->sections->splat('slug')) ) {
	$activeTab = 'ae';
} elseif( in_array('editorial', $article->sections->splat('slug')) ) {
	$activeTab = 'editorial';
} elseif( in_array('news', $article->sections->splat('slug')) ) {
	$activeTab = 'news';
} else {
	$activeTab = 0;
}

Foundry::import( 'global:header', array('title' => $article->headline, 'activeTab' => $activeTab) );
?>

<div class="grid_8">
	<?php if( $data['flagged'] ) : ?>
		<h1>Comment flagged for moderation</h1>
		
		<div class="mmb">&nbsp;</div>
		
		<div class="boot mmb">
			<p>Our editors have been notified of this comment.</p>
		</div>
		
		Return to <a href="<?php echo $this->data['return'] ?>"><?php echo $article->headline ?></a>
	<?php else: ?>
	
		<h1>Flag comment for moderation</h1>
		
		<div class="mmb">&nbsp;</div>
		
		<div class="boot mmb">
			<?php if( $data['error'] ) : ?>
				<p class="error"><?php echo $data['error'] ?></p>
			<?php endif ?>
			
			<p class="mmb"><strong>You're flagging the following comment:</strong></p>
			
			<blockquote><?php echo $comment->comment_formatted ?></blockquote>
			
			<div class="aside2 mmb">&mdash; <em><?php echo date( 'g:i A F j, Y', $comment->created ) ?>,</em> by <strong><?php echo $comment->name ?></strong></div>
		</div>

		<form method="post" action="<?php echo Foundry::link( 'comment/flag/'.$comment->uid ) ?>">
		
		<table class="formwrap">
			<tr>
				<th><label>Spam</label></th>
				<td><input type="checkbox" name="spam" value="1" id="input_spam" />&nbsp; <label for="input_spam" style="display:inline;">This comment is spam</label></td>
			</tr>
			
			<tr>
				<th><label for="input_description">Remarks</label></th>
				<td>
					<textarea rows="8" cols="50" name="description" id="input_description" style="width:100%;"><?php echo $data['description'] ?></textarea>
					<div class="aside">Is there anything you want to let the editor know about this comment?</div>
				</td>
			</tr>
			
			<tr>
				<th><label>Verify</label></th>
				<td>
					<?php echo $this->turingFormHelper() ?>
					<div class="aside">We also need to verify that you are, in fact, human.</div>
				</td>
			</tr>
			
			<tr>
				<th></th>
				<td><input type="submit" value="Flag this comment" /></td>
			</tr>
		</table>
		</form>
		<hr class="mmb" />
		
		<p>Return to: <a href="<?php echo $article->url ?>"><?php echo $article->headline ?></a></p>
	<?php endif ?>
</div>
<div class="grid_4">
	<?php Foundry::import( 'article:sidebar', 'short' ) ?>
</div>

<div class="clear mbb">&nbsp;</div>
<?php Foundry::import( 'global:footer' ); ?>