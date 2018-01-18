<?php 
	$route['campaigns/rss(.*)'] = "campaigns/rss$1";
	$route['campaigns/list(/:any)?'] = "campaigns/index$1";
	$route['campaigns/tag(.*)'] = "campaigns/tag$1";
	$route['campaigns/cat(.*)'] = "campaigns/cat$1";
	$route['campaigns/comment(.*)'] = "campaigns/comment$1";
	$route['campaigns^(/admin.*)'] = "campaigns/admin$1";
	$route['campaigns(/.*)'] = "campaigns/read$1"; 
?>
