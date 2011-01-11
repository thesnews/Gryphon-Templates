<?php
/*
 File: section
  Provides section view callbacks
  
 Version:
  2010.06.14
  
 Copyright:
  2004-2010 The State News, Inc
  
 Author:
  Mike Joseph <josephm5@msu.edu>
  
 License:
  GNU GPL 2.0 - http://opensource.org/licenses/gpl-2.0.php
*/
namespace gryphon\view\section;

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
  \gryphon\view\section
*/
function main($request, $payload, $kwargs=array()) {
	$s = $payload['section'];

	$ext = 'tpl';
	if( $request->isMobile() && $request->clientWantsMobile ) {
		$ext = 'mbl';
	}
	
	if( $s->template ) {
		$str = sprintf('section/templates/%s.%s', $s->template, $ext);
	} else {
		$str = sprintf('section/main.%s', $ext);
	}

	if( ($s = $request->get('status', array('success', 'error'))) ) {
		$payload['postStatus'] = $s;
	}

	try {
		$tpl = new Template($str);
		
		$res = new Response;
		$res->content = $tpl->render($payload);
	} catch( \foundry\exception $e ) {
		// couldn't locate template load the default
		
		$tpl = new Template(sprintf('section/main.%s', $ext));
		
		$res = new Response;
		$res->content = $tpl->render($payload);
	}

	return $res;
}

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
  \gryphon\view\section
*/
function xml($request, $payload, $kwargs=array()) {
	$res = new Response;

	$entries = $payload['articles']->serialize('atom');
	$lastUpdate = date('c', $payload['articles']->peekFront()->created);

$res->content = <<<ATOM
<?xml version="1.0" encoding="UTF-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
	<title>State News {$payload['section']->name}</title>
	<link href="{$payload['section']->url}.xml" rel="self" />
	<id>{$payload['section']->url}.xml</id>
	<updated>{$lastUpdate}</updated>
	$entries
</feed>
ATOM;

	$res->setHeader('Content-Type', 'application/atom+xml');
	
	return $res;
}

?>