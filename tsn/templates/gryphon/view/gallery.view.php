<?php
/*
 Title: view\gallery

 Group: Views
 
 File: gallery.view.php
  Provides gallery view callbacks class
  
 Version:
  2010.10.12
  
 Copyright:
  2004-2010 The State News, Inc
  
 Author:
  Mike Joseph <josephm5@msu.edu>
  
 License:
  GNU GPL 2.0 - http://opensource.org/licenses/gpl-2.0.php
*/
namespace gryphon\view\gallery;

use foundry\response as Response;
use foundry\fs\path as Path;
use foundry\view as View;
use foundry\view\template as Template;
use foundry\request\url as URL;

use foundry\model as M;


/*
 Function: main
  Main view callback. Inspects the payload to see what is being returned. If
  payload contains 'galleries' this loads the landing template. Otherwise it
  loads the main template
 
 Parameters:
  request - _object_ instance of \foundry\request
  payload - _array_
  kwargs - _array_ (OPTIONAL)
  
 Returns:
  _object_ - instance of \foundry\response

 Namespace:
  \gryphon\view\gallery
*/
function main($request, $payload, $kwargs=array()) {
	$template = 'main';
	
	// this switches the template based on the payload returned since the 
	// blog controller technically only has one action, 'main'.
	if( $payload['galleries'] ) {
		$template = 'landing';
	}
	
	$ext = 'tpl';
	if( $request->isMobile() && $request->clientWantsMobile ) {
		$ext = 'mbl';
	}
	
	$str = sprintf('gallery/%s.%s', $template, $ext);

	// edge case to handle inline galleries (I love view callbacks)
	if( $request->isXHR() && $payload['gallery'] && $payload['image'] ) {
		$str = sprintf('gallery/inline.%s', $ext);
	}
	
	$s = $request->getSession();
	
	$payload['referrer'] = $s->get('article_referrer');
	
	$tpl = new Template($str);
	
	$res = new Response;
	$res->content = $tpl->render($payload);

	return $res;
}

?>