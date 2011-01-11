<?php
/*
 File: article
  Provides article view callbacks
  
 Version:
  2010.06.15
  
 Copyright:
  2004-2010 The State News, Inc
  
 Author:
  Mike Joseph <josephm5@msu.edu>
  
 License:
  GNU GPL 2.0 - http://opensource.org/licenses/gpl-2.0.php
*/
namespace gryphon\view\article;

use foundry\response as Response;
use foundry\fs\path as Path;
use foundry\view as View;
use foundry\view\template as Template;
use foundry\request\url as URL;

use foundry\model as M;

/*
 Function: main
  Main action and default callback for the article controller
 
 Parameters:
  request - _object_ current request instances
  payload - _mixed_ payload returned from controller action
  kwargs - _array_ (optional) additional keyword arguments
  
 Returns:
  _object_ returns foundry\request instance

 Namespace:
  \gryphon\view\article
*/
function main($request, $payload, $kwargs=array()) {
	$a = $payload['article'];

	$payload['shortUrl'] = str_replace('index.php/', '',
		M::init('gryphon:shortUrl')->generateFromUrl(
		$a->url));

	$ext = 'tpl';
	if( $request->isMobile() && $request->clientWantsMobile ) {
		$ext = 'mbl';
	}
	
	if( $a->template ) {
		$str = sprintf('article/templates/%s.%s', $a->template, $ext);
	} else {
		$str = sprintf('article/main.%s', $ext);
	}
	
	// figure out the active nav state
	$navItems = array(
		'pageOne' => 'frontpage',
		'news' => 'news',
		'city' => 'news',
		'campus' => 'news',
		'sports' => 'sports',
		'opinion' => 'opinion',
		'features' => 'features',
		'entertainment' => 'entertainment',
		'multimedia' => 'multimedia'
	);

	foreach( $a->sections as $sec ) {
		if( array_key_exists($sec->slug, $navItems) ) {
			$payload['active'] = $navItems[$sec->slug];
			break;
		}
	}
	
	// set the article refer var
	$s = $request->getSession();
	$s->set('article_referrer', $request->query->query);

	// finally check for comment notices
	if( ($msg = $request->get('message', 'specialChars')) ) {
		$payload['message'] = array(
			'value' => $msg,
			'type' => $request->get('type', 'alnum')
		);
	}

	try {
		$tpl = new Template($str);
		
		$res = new Response;
		$res->content = $tpl->render($payload);
	} catch( \foundry\exception $e ) {
		// couldn't locate template load the default
		
		$tpl = new Template(sprintf('article/main.%s', $ext));
		
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
  \gryphon\view\article
*/
function xml($request, $payload, $kwargs=array()) {
	$res = new Response;
	
	// gather up the comments... yo	
	$comments = \foundry\model::init('gryphon:comment')
		->where('self:item_type = :ty and self:item_id = :iid')
		->where('self:status = 1')
		->bind(array(
			':ty' => 'article',
			':iid' => $payload['article']->uid
		))
		->order('self:created asc')
		->find();

	$entries = $comments->serialize('atom');
	$lastUpdate = date('c', $comments->peekBack()->created);
$res->content = <<<ATOM
<?xml version="1.0" encoding="UTF-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
	<title>Comment feed for {$payload['article']->headline}</title>
	<link href="{$payload['article']->url}.xml" rel="self" />
	<id>{$payload['article']->url}.xml</id>
	<updated>{$lastUpdate}</updated>
	$entries
</feed>
ATOM;

	$res->setHeader('Content-Type', 'application/atom+xml');
	
	return $res;
}

?>