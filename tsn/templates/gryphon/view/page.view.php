<?php
namespace gryphon\view\page;

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
  \gryphon\view\page
*/
function main($request, $payload, $kwargs=array()) {
	$page = $payload['page'];

	$ext = 'tpl';
	if( $request->isMobile() && $request->clientWantsMobile ) {
		$ext = 'mbl';
	}
	if( $page ) {
		if( $page->template ) {
			$str = sprintf('page/templates/%s.%s', $page->template, $ext);
		} else {
			$str = sprintf('page/main.%s', $ext);
		}
	} else {
		$str = sprintf('page/%s.%s', $payload['slug'], $ext);
	}
	
	try {
		$tpl = new Template($str);
		
		$res = new Response;
		$res->content = $tpl->render($payload);
	} catch( \foundry\exception $e ) {
		// couldn't locate template load the default
		
		$tpl = new Template(sprintf('page/main.%s', $ext));
		
		$res = new Response;
		$res->content = $tpl->render($payload);
	}

	return $res;
}

?>