<?php

$hits			= $data['hits'];
$currentPage	= $data['currentPage'];
$nextPage		= $data['nextPage'];
$prevPage		= $data['previousPage'];
$totalPages		= $data['totalPages'];
$totalHits		= $data['totalHits'];
$query			= $data['query'];
$query_escaped  = $data['query_escaped'];

$thisBottomRange	= ($currentPage * $data['searchLimit']) + 1;
$thisTopRange		= $nextPage * $data['searchLimit'];

if( $thisTopRange == 0 ) {
	$thisTopRange = $totalHits;
}

Foundry::import( 'global:header', array(
	'title' => 'Search'
));
?>

<div class="grid_8">
	<h1 class="mmb"><?php echo $totalHits ?> results for <em><?php echo $query ?></em></h1>
	
	<hr />
	
	<p class="caption right strong">
		Showing <?php echo $thisBottomRange ?>
		- <?php echo $thisTopRange ?>
	</p>
	
	<div class="pagination">
		<ul>
			<?php if( $prevPage !== null ) : ?>
			<li><a href="<?php echo Foundry::link( 'search' ).'?q='.$query_escaped.'&p='.$prevPage ?>">&laquo;</a></li>
			<?php endif; ?>
			
			<?php for( $i=0; $i<$totalPages; $i++ ) : ?>
			<?php if( $currentPage == $i ) : ?>
				<li class="active"><a href="<?php echo Foundry::link( 'search' ).'?q='.$query_escaped.'&p='.$i ?>"><?php echo ($i+1) ?></a></li>
			<?php else : ?>
				<li><a href="<?php echo Foundry::link( 'search' ).'?q='.$query_escaped.'&p='.$i ?>"><?php echo ($i+1) ?></a></li>
			<?php endif; ?>
			<?php endfor; ?>
			
			<?php if( $nextPage !== null ) : ?>
			<li><a href="<?php echo Foundry::link( 'search' ).'?q='.$query_escaped.'&p='.$nextPage ?>">&raquo;</a></li>
			<?php endif; ?>
		</ul>
	</div>
	
	<div class="clear mb">&nbsp;</div>
	
	<?php foreach( $hits as $hit ) : ?>
		<?php if( $hit->type == 'media' ) : ?>
			<div class="thumb" style="overflow:hidden;"><a href="<?php echo Foundry::link(  $hit->url ) ?>">
				<img src="<?php echo Foundry::path( $hit->webPath ) ?>" alt="<?php $hit->title ?>" />
			</a></div>
		<?php endif; ?>
		
		<div>
			<h3 class="mmb"><a href="<?php echo Foundry::link( $hit->url ) ?>"><?php echo $hit->title ?></a></h3>
			
			<p><?php echo $hit->abstract ?></p>
	
			<div class="mmb"><em><a href="<?php echo Foundry::link( $hit->url ) ?>"><?php echo Foundry::fullPath(). $hit->url ?></a></em></div>
		</div>
		<div class="caption mb">Published <?php echo date( 'F j, Y', $hit->date_int ) ?></div>
		
		<div class="clear">&nbsp;</div>
		<hr />
	<?php endforeach; ?>
	
	
	<p class="caption right strong">
		Showing <?php echo $thisBottomRange ?>
		- <?php echo $thisTopRange ?>
	</p>
	
	<div class="pagination mb">
		<ul>
			<?php if( $prevPage !== null ) : ?>
			<li><a href="<?php echo Foundry::link( 'search' ).'?q='.$query_escaped.'&p='.$prevPage ?>">&laquo;</a></li>
			<?php endif; ?>
			
			<?php for( $i=0; $i<$totalPages; $i++ ) : ?>
			<?php if( $currentPage == $i ) : ?>
				<li class="active"><a href="<?php echo Foundry::link( 'search' ).'?q='.$query_escaped.'&p='.$i ?>"><?php echo ($i+1) ?></a></li>
			<?php else : ?>
				<li><a href="<?php echo Foundry::link( 'search' ).'?q='.$query_escaped.'&p='.$i ?>"><?php echo ($i+1) ?></a></li>
			<?php endif; ?>
			<?php endfor; ?>
			
			<?php if( $nextPage !== null ) : ?>
			<li><a href="<?php echo Foundry::link( 'search' ).'?q='.$query_escaped.'&p='.$nextPage ?>">&raquo;</a></li>
			<?php endif; ?>
		</ul>
	</div>
	
	<div class="clear">&nbsp;</div>
	
</div>

<div class="grid_4">
	<?php Foundry::import( 'article:sidebar', $data ); ?>
</div>

<div class="clear mbb">&nbsp;</div>
<?php Foundry::import( 'global:footer' ); ?>