<?php

$params			= $data['parameters'];
$query			= $data['query'];
$query_escaped  = $data['query_escaped'];

if( $data['hits'] ) {
	$hits			= $data['hits'];
	$currentPage	= $data['currentPage'];
	$nextPage		= $data['nextPage'];
	$prevPage		= $data['previousPage'];
	$totalPages		= $data['totalPages'];
	$totalHits		= $data['totalHits'];
	
	$thisBottomRange	= ($currentPage * $data['searchLimit']) + 1;
	$thisTopRange		= $nextPage * $data['searchLimit'];
	
	if( $thisTopRange == 0 ) {
		$thisTopRange = $totalHits;
	}
}

$months = array(
	'0'		=> 'Month',
	'01'	=> 'January',
	'02'	=> 'February',
	'03'	=> 'March',
	'04'	=> 'April',
	'05'	=> 'May',
	'06'	=> 'June',
	'07'	=> 'July',
	'08'	=> 'August',
	'09'	=> 'September',
	'10'	=> 'October',
	'11'	=> 'November',
	'12'	=> 'December'
);

Foundry::import( 'global:header', array(
	'title' => 'Search'
));
?>

<div class="grid_8">
	<h1>Archive search</h1>
	
	<div class="mmb">&nbsp;</div>
	
	<div class="body-copy boot mmb">
		<p>Use the form below to search our archives<?php if( Foundry_Registry::get( 'dsw:archivedate' ) ) { ?> dating back to <?php echo Foundry_Registry::get( 'dsw:archivedate' ); } ?>.</p>
	</div>
	
	<form method="get" action="<?php echo Foundry::link( 'search' ) ?>" class="search-advanced">
		<input type="hidden" name="a" value="1" />
		
		<table class="formwrap">
			<tr>
				<th><label for="input_search">Find</label></th>
				<td><input type="text" id="input_search" name="s" size="30" value="<?php echo $params['s'] ?>" /></td>
			</tr>
			
			<tr>
				<th><label for="input_title">Headline</label></th>
				<td><input type="text" id="input_title" name="ti" size="30" value="<?php echo $params['ti'] ?>" /></td>
			</tr>
			
			<tr>
				<th><label for="input_author">Writer/Photographer</label></th>
				<td><input type="text" id="input_author" name="au" size="30" value="<?php echo $params['au'] ?>" /></td>
			</tr>
			
			<tr>
				<th><label for="input_tag">Tagged</label></th>
				<td><input type="text" id="input_tag" name="tg" size="30" value="<?php echo $params['tg'] ?>" /></td>
			</tr>
			
			<tr>
				<th><label for="input_startDate">From</label></th>
				<td>
					<select name="ts_month">
						<?php foreach( $months as $id => $month ) : ?>
							<option value="<?php echo $id ?>"<?php if( $params['ts_month'] == $id ){ echo ' selected="selected"'; } ?>><?php echo $month ?></option>
						<?php endforeach ?>
					</select>
					<select name="ts_day">
						<option value="0">Day</option>
					<?php for( $i=1; $i<=31; $i++ ) : ?>
						<option value="<?php echo $i ?>"<?php if( $params['ts_day'] == $i ){ echo ' selected="selected"'; } ?>><?php echo $i ?></option>
					<?php endfor ?>
					</select>
					<select name="ts_year">
					<option value="0">Year</option>
					<?php for( $i=2001; $i<=date('Y'); $i++ ) : ?>
						<option value="<?php echo $i ?>"<?php if( $params['ts_year'] == $i ){ echo ' selected="selected"'; } ?>><?php echo $i ?></option>
					<?php endfor ?>
					</select>
				</td>
			</tr>
			
			<tr>
				<th><label for="input_endDate">To</label></th>
				<td>
					<select name="te_month">
						<?php foreach( $months as $id => $month ) : ?>
							<option value="<?php echo $id ?>"<?php if( $params['te_month'] == $id ){ echo ' selected="selected"'; } ?>><?php echo $month ?></option>
						<?php endforeach ?>
					</select>
					<select name="te_day">
					<option value="0">Day</option>
					<?php for( $i=1; $i<=31; $i++ ) : ?>
						<option value="<?php echo $i ?>"<?php if( $params['te_day'] == $i ){ echo ' selected="selected"'; } ?>><?php echo $i ?></option>
					<?php endfor ?>
					</select>
					<select name="te_year">
					<option value="0">Year</option>
					<?php for( $i=2001; $i<=date('Y'); $i++ ) : ?>
						<option value="<?php echo $i ?>"<?php if( $params['te_year'] == $i ){ echo ' selected="selected"'; } ?>><?php echo $i ?></option>
					<?php endfor ?>
					</select>
				</td>
			</tr>
			
			<tr>
				<th><label for="input_type">Type</label></th>
				<td>
					<select name="ty" id="input_type">
						<option value="0">Any</option>
						<option value="article" <?php if( $params['ty'] == 'article' ) { echo 'selected="selected"'; } ?>>Article</option>
						<option value="media" <?php if( $params['ty'] == 'media' ) { echo 'selected="selected"'; } ?>>Media</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<th><label for="input_order">Sort by</label></th>
				<td>
					<select name="o" id="input_order">
						<option value="date" <?php if( $params['o'] == 'date' ) { echo 'selected="selected"'; } ?>>Date</option>
						<option value="title" <?php if( $params['o'] == 'title' ) { echo 'selected="selected"'; } ?>>Title</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<th></th>
				<td><input type="submit" value="Submit" /></td>
			</tr>
		</table>
	</form>
	
	<hr />

	<?php if( $hits ) : ?>
		<h2 class="mmb"><?php echo $totalHits ?> results <?php if( $query ): ?>for <em><?php echo $query ?></em><?php endif; ?></h2>
		
		<hr />
		
		<p class="caption right strong">
			Showing <?php echo $thisBottomRange ?>
			- <?php echo $thisTopRange ?>
		</p>
		
		<div class="pagination mb">
			<?php
			if( $data['parameters']['a'] ) {
				$queryString = '';
				foreach( $data['parameters'] as $id => $val ) {
					if( $id == 'p' ) {
						continue;
					}
					$queryString .= '&'.$id.'='.$val;
				}
			} else {
				$queryString = $query_escaped;
			}
			?>
			<ul>
				<?php if( $prevPage !== null ) : ?>
				<li><a href="<?php echo Foundry::link( 'search' ).'?q='.$queryString.'&p='.$prevPage ?>">&laquo;</a></li>
				<?php endif; ?>
				
				<?php for( $i=0; $i<$totalPages; $i++ ) : ?>
				<?php if( $currentPage == $i ) : ?>
					<li class="active"><a href="<?php echo Foundry::link( 'search' ).'?q='.$queryString.'&p='.$i ?>"><?php echo ($i+1) ?></a></li>
				<?php else : ?>
					<li><a href="<?php echo Foundry::link( 'search' ).'?q='.$queryString.'&p='.$i ?>"><?php echo ($i+1) ?></a></li>
				<?php endif; ?>
				<?php endfor; ?>
				
				<?php if( $nextPage !== null ) : ?>
				<li><a href="<?php echo Foundry::link( 'search' ).'?q='.$queryString.'&p='.$nextPage ?>">&raquo;</a></li>
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
		<?php
		if( $data['parameters']['a'] ) {
			$queryString = '';
			foreach( $data['parameters'] as $id => $val ) {
				if( $id == 'p' ) {
					continue;
				}
				$queryString .= '&'.$id.'='.$val;
			}
		} else {
			$queryString = $query_escaped;
		}
		?>
			<ul>
				<?php if( $prevPage !== null ) : ?>
				<li><a href="<?php echo Foundry::link( 'search' ).'?q='.$queryString.'&p='.$prevPage ?>">&laquo;</a></li>
				<?php endif; ?>
				
				<?php for( $i=0; $i<$totalPages; $i++ ) : ?>
				<?php if( $currentPage == $i ) : ?>
					<li class="active"><a href="<?php echo Foundry::link( 'search' ).'?q='.$queryString.'&p='.$i ?>"><?php echo ($i+1) ?></a></li>
				<?php else : ?>
					<li><a href="<?php echo Foundry::link( 'search' ).'?q='.$queryString.'&p='.$i ?>"><?php echo ($i+1) ?></a></li>
				<?php endif; ?>
				<?php endfor; ?>
				
				<?php if( $nextPage !== null ) : ?>
				<li><a href="<?php echo Foundry::link( 'search' ).'?q='.$queryString.'&p='.$nextPage ?>">&raquo;</a></li>
				<?php endif; ?>
			</ul>
		</div>
		
		<div class="clear">&nbsp;</div>
	<?php elseif( $query || $params['ty'] || $params['ts_month'] || $params['ts_day'] || $params['ts_year'] ) : ?>

		<p class="body-copy">Sorry! No results were found.</p>
	<?php endif; ?>
	
</div>

<div class="grid_4">
	<?php Foundry::import( 'article:sidebar' ); ?>
</div>

<div class="clear mbb">&nbsp;</div>
<?php Foundry::import( 'global:footer' ); ?>