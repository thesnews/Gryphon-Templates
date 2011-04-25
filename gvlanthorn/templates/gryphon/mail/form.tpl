<?php
	// Any object that allows mail sets these registry values
	// they are required for the mail system's spam and robot trap
	$key = Foundry::registry( 'mail.key', false );
	$type = Foundry::registry( 'mail.type', false );
	$plugin = Foundry::registry( 'mail.plug', false );
	$id = Foundry::registry( 'mail.objectID', false );
	
	$from = false;
	$to = false;
	
	if( $this ) {
		$from = $this->data['from'];
		$to = $this->data['to'];
	}
?>

<a name="mailform"></a>
<form id="mail-form" action="<?php echo Foundry::link( 'mail/' ) ?>" method="post">

	<?php if( Foundry_Request::get( 'data', array('mailsent' ) ) ) : ?>
		<div class="success">
			Your message was sent!
		</div>
	<?php endif ?>
	<?php // These items are required ?>
	<input type="hidden" name="mailKey" value="<?php echo $key ?>" />
	<input type="hidden" name="id" value="<?php echo $id ?>" />
	<input type="hidden" name="type" value="<?php echo $type ?>" />
	<input type="hidden" name="plug" value="<?php echo $plugin ?>" />
	
	<h5>Send to a friend</h5>
	
	<fieldset>
		<div>
			<label for="mail-to">To: </label>
			<input type="text" name="to" id="mail-to" value="<?php echo $to ?>" />
		</div>
		
		<div>
			<label for="mail-from">From:</label>

			<input type="text" name="from" id="mail-from" value="<?php echo $from ?>" />
		</div>
		
		<div>
			<input type="submit" id="mail-submit" value="Send message" />			
		</div>
		
	</fieldset>
</form>