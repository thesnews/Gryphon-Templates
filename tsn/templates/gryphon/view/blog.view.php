<?php
/*
 File: blog.view.php
  Provides blog view callbacks
  
 Version:
  2010.09.17
  
 Copyright:
  2004-2010 The State News, Inc
  
 Author:
  Mike Joseph <josephm5@msu.edu>
  
 License:
  GNU GPL 2.0 - http://opensource.org/licenses/gpl-2.0.php
*/
namespace gryphon\view\blog;

use foundry\response as Response;
use foundry\fs\path as Path;
use foundry\view as View;
use foundry\view\template as Template;
use foundry\request\url as URL;

use foundry\model as M;

/*
 Function: main
  Main action and default callback for the blog controller
 
 Parameters:
  request - _object_ current request instances
  payload - _mixed_ payload returned from controller action
  kwargs - _array_ (optional) additional keyword arguments
  
 Returns:
  _object_ returns foundry\request instance

 Namespace:
  \gryphon\view\blog
*/
function main($request, $payload, $kwargs=array()) {
	$template = 'main';
	
	// this switches the template based on the payload returned since the 
	// blog controller technically only has one action, 'main'.
	if( $payload['blogs'] ) {
		$template = 'landing';
	} elseif( $payload['blog'] && !$payload['post'] ) {
		$template = 'blog';
	}
	
	$ext = 'tpl';
	if( $request->isMobile() && $request->clientWantsMobile ) {
		$ext = 'mbl';
	}
	
	$str = sprintf('blog/%s.%s', $template, $ext);
	
	$tpl = new Template($str);
	
	$res = new Response;
	$res->content = $tpl->render($payload);

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
  \gryphon\view\blog
*/
function xml($request, $payload, $kwargs=array()) {
	$res = new Response;
	
	if( $payload['blogs'] ) {
		return main($request, $payload, $kwargs);
	}
	
	if( $payload['blog'] && $payload['posts'] ) {
		$entries = $payload['posts']->serialize('atom');
		$lastUpdate = date('c', $payload['blog']->modified);

$res->content = <<<ATOM
<?xml version="1.0" encoding="UTF-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
	<title>{$payload['blog']->name}</title>
	<link href="{$payload['blog']->url}.xml" rel="self" />
	<id>{$payload['blog']->url}.xml</id>
	<updated>{$lastUpdate}</updated>
	$entries
</feed>
ATOM;

	} else {
		
		// gather up the comments... yo	
		$comments = \foundry\model::init('gryphon:comment')
			->where('self:item_type = :ty and self:item_id = :iid')
			->where('self:status = 1')
			->bind(array(
				':ty' => 'blogPost',
				':iid' => $payload['post']->uid
			))
			->order('self:created asc')
			->find();
	
		$entries = $comments->serialize('atom');
		$lastUpdate = date('c', $comments->peekBack()->created);
$res->content = <<<ATOM
<?xml version="1.0" encoding="UTF-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
	<title>Comment feed for {$payload['post']->headline}</title>
	<link href="{$payload['post']->url}.xml" rel="self" />
	<id>{$payload['post']->url}.xml</id>
	<updated>{$lastUpdate}</updated>
	$entries
</feed>
ATOM;
}
	$res->setHeader('Content-Type', 'application/atom+xml');
	
	return $res;
}

?>