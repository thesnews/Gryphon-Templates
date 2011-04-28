<?php
function byLine($item) {
	if( $item->authors->length ) :
		$out = '';
		$i = 1; foreach( $item->authors as $author ) :
		$auLink = Foundry::link('search'). '?a=1&amp;au='. urlencode( $author->name );
		if( $i == 1 ) $out.= 'By ';
		else $out.= '<span style="visibility:hidden;">By </span>';
		$out.= '<a href="'. $auLink. '">'. strtoupper( $author->name ). '</a>';
		
		if( Foundry_Registry::get('dsw:showtaglines') ) {
			$out.= '<span class="article-tagline">';
			if( $author->tagline ) $out.= ' | '. $author->tagline;
			else $out.= ' | '. Foundry_Registry::get('gfn:publication.name');
			$out.= '</span>';
		}
		
		$out.= '<br />';
		$i++; endforeach;
		
		return $out;
	else :
		return false;
	endif;
}

function creditLine($item) {
	if( $item->authors->length ) :
		$out = '';
		foreach( $item->authors as $author ) :
		$out.= '<div class="right aside2">'. $author->name;
		
		if( Foundry_Registry::get('dsw:showtaglines') ) {
			if( $author->tagline ) $out.= ' / '. $author->tagline;
			else $out.= ' / '. Foundry_Registry::get('gfn:publication.shortname');
		}
		
		$out.= '</div>';
		
		endforeach;
		
		return $out;
	else :
		return false;
	endif;
}
?>