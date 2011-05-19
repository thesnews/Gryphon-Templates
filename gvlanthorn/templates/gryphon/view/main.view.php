<?php
/*
 File: main
  Provides main controller view callbacks
  
 Version:
  2010.06.14
  
 Copyright:
  2004-2010 The State News, Inc
  
 Author:
  Mike Joseph <josephm5@msu.edu>
  
 License:
  GNU GPL 2.0 - http://opensource.org/licenses/gpl-2.0.php
*/
namespace gryphon\view\main;

use foundry\response as Response;
use foundry\fs\path as Path;
use foundry\view as View;
use foundry\view\template as Template;
use foundry\request\url as URL;

use foundry\model as M;

/*
 Function: main
  Main action and default callback for the 'main' controller
 
 Parameters:
  request - _object_ current request instances
  payload - _mixed_ payload returned from controller action
  kwargs - _array_ (optional) additional keyword arguments
  
 Returns:
  _object_ returns foundry\request instance

 Namespace:
  \gryphon\view\main
*/
function main($request, $payload, $kwargs=array()) {
	$ext = 'tpl';
	if( $request->isMobile() ) {
		$ext = 'mbl';
	}
	$str = sprintf('%s/%s.%s', $request->controller,
		$request->action, $ext);

	// the main controller can return a page, if requested
	// see \gryphon\controller\main::page()
	if( isset($payload['page']) ) {
		$str = sprintf('%s/%s.%s', $request->controller, $payload['page'],
			$ext);
	}

	// check for breaking news
	$payload['breaking'] = false;

	$breaking = M::init('article')
		->cache(false)
		->where('self:status = 1')
		->order('self:created desc')
		->limit(1)
		->findByTags(M::init('tag')->findByName('breaking'))
		->pop();

	if( $breaking && $breaking->uid ) {
		$payload['breaking'] = $breaking;
	}

	$payload['suppressLeaderBoard'] = true;

	$tpl = new Template($str);
	if( $tpl->didFindTemplate() ) {
		$res = new Response;
		$res->content = $tpl->render($payload);
	} else {
		$res = new \foundry\response\redirect(URL::linkTo('/'), true);
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
  \gryphon\view\main
*/
function xml($request, $payload, $kwargs=array()) {
	$res = new Response;

	$lastUpdate = time();
	$entries = '';

	if( isset($payload['articles']) && is_object($payload['articles']) ) {
		$entries = $payload['articles']->serialize('atom');
		$lastUpdate = date('c', $payload['articles']->peekFront()->created);
	}

$res->content = <<<ATOM
<?xml version="1.0" encoding="UTF-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
	<title>State News Top Stories</title>
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