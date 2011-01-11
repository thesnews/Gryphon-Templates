<?php
namespace gryphon\view\media;

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
  \gryphon\view\media
*/
function main($request, $payload, $kwargs=array()) {

	$ext = 'tpl';
	if( $request->isMobile() && $request->clientWantsMobile ) {
		$ext = 'mbl';
	}

	if( $request->isXHR() ) {
		$payload['xhr'] = true;
	}
	
	$type = $payload['media']->type;
	
	if( $type ) {
		$str = sprintf('media/%s.%s', $type, $ext);
	} else {
		$str = sprintf('media/main.%s', $ext);
	}
	
	$tpl = new Template($str);
	
	$res = new Response;
	$res->content = $tpl->render($payload);

	return $res;
}

?>