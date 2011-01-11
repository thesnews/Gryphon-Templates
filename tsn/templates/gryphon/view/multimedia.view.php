<?php
namespace gryphon\view\multimedia;

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
  \gryphon\view\multimedia
*/
function main($request, $payload, $kwargs=array()) {
	$slug = $payload['slug'];

	$ext = 'tpl';
	if( $request->isMobile() && $request->clientWantsMobile ) {
		$ext = 'mbl';
	}
	
	if( $slug ) {
		$str = sprintf('multimedia/templates/%s.%s', $slug, $ext);
		$payload['subActive'] = ucfirst($slug);
	} else {
		$str = sprintf('multimedia/main.%s', $ext);
	}
	
	$s = $request->getSession();
	
	$payload['referrer'] = $s->get('article_referrer');
	
	$tpl = new Template($str);
	
	$res = new Response;
	$res->content = $tpl->render($payload);

	return $res;
}

?>