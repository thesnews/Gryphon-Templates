<?php
namespace gryphon\view\search;

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
  \gryphon\view\search
*/
function main($request, $payload, $kwargs=array()) {
	$s = $payload['section'];

	$ext = 'tpl';
	if( $request->isMobile() && $request->clientWantsMobile ) {
		$ext = 'mbl';
	}
	
	$str = 'main';
	if( $payload['advanced'] ) {
		$str = 'advanced';
	}
	
	$str = sprintf('search/%s.%s', $str, $ext);

	try {
		$tpl = new Template($str);
		
		$res = new Response;
		$res->content = $tpl->render($payload);
	} catch( \foundry\exception $e ) {
		// couldn't locate template load the default
		
		$tpl = new Template(sprintf('search/main.%s', $ext));
		
		$res = new Response;
		$res->content = $tpl->render($payload);
	}

	return $res;
}

function json($request, $payload, $kwargs=array()) {
}

?>