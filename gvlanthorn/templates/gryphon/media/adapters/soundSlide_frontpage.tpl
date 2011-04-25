<a href="<?php echo $this->url ?>"><img src="<?php echo $this->bigUrl ?>" class="photo" id="top-media" /></a>

<?php if( $this->authors->length ) : ?>
	<p class="small">
		By <?php echo implode( ', ', $this->authors->splat( 'name' ) ) ?> / <?php echo $this->source ?>
	</p>
<?php endif ?>