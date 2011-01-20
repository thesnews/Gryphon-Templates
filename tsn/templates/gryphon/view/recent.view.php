<?php
namespace gryphon\view\recent;

use foundry\response as Response;
use foundry\fs\path as Path;
use foundry\view as View;
use foundry\view\template as Template;
use foundry\request\url as URL;

use foundry\model as M;

/*
 Function: main
  Main action and default callback for the section controller
 
 Parameters:
  request - _object_ current request instances
  payload - _mixed_ payload returned from controller action
  kwargs - _array_ (optional) additional keyword arguments
  
 Returns:
  _object_ returns foundry\request instance

 Namespace:
  \gryphon\view\recent
*/

/*
 Function: xml
  XML handler callback. Generates ATOM feed
 
 Parameters:
  request - _object_ current request instances
  payload - _mixed_ payload returned from controller action
  kwargs - _array_ (optional) additional keyword arguments
  
 Returns:
  _object_ returns foundry\request instance

 Namespace:
  \gryphon\view\recent
*/
function xml($request, $payload, $kwargs=array()) {
	$res = new Response;
	
	$articles = '';
	$comments = '';
	$lastUpdate = false;
	if( $payload['articles'] ) {
		$articles = $payload['articles']->serialize('atom');
		$lastUpdate = $payload['articles']->peekFront()->created;
	}
	if( $payload['comments'] ) {
		$comments = $payload['comments']->serialize('atom');
	}
	
	if( $payload['comments'] &&
		$payload['comments']->peekFront()->created > $lastUpdate ) {
		$lastUpdate = $payload['comments']->peekFront()->created;
	}
	
	$lastUpdate = date('c', $lastUpdate);
	
	if( $payload['articles'] && !$payload['comments'] ) {
		$url = URL::linkTo('gryphon:recent/article', true);
	} elseif( $payload['comments'] && !$payload['articles'] ) {
		$url = URL::linkTo('gryphon:recent/comment', true);
	} else {
		$url = URL::linkTo('gryphon:recent', true);
	}

$res->content = <<<ATOM
<?xml version="1.0" encoding="UTF-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
	<title>State News Recent Items</title>
	<link href="{$url}.xml" rel="self" />
	<id>{$url}.xml</id>
	<updated>{$lastUpdate}</updated>
	{$articles}
	{$comments}
</feed>
ATOM;

	$res->setHeader('Content-Type', 'application/atom+xml');
	
	return $res;
}

?>