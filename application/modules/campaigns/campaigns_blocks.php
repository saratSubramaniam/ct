<?php 

$this->set('latest_campaigns', 'campaigns_latest_campaigns');
$this->set('get_campaigns_bycat', 'campaigns_get_campaigns_by_cat');
$this->set('get_campaigns_cat', 'campaigns_get_cat');
$this->set('get_campaigns_list', 'campaigns_get_campaigns');

function campaigns_get_cat($pid = 0)
{
	$obj =& get_instance();
	$obj->load->model('campaigns/campaigns_model');
	return $obj->campaigns_model->get_catlist_by_pid($pid);
	
}

function campaigns_get_campaigns_by_cat($cat = 0)
{
	$params = array();
	$obj =& get_instance();
	$obj->load->model('campaigns/campaigns_model');
	$params['where'] = array('cat' => $cat);
	return $obj->campaigns_model->get_list($params);
	
}


function campaigns_get_campaigns($params)
{
	$rows = array();
	$obj =& get_instance();
	$obj->load->model('campaigns/campaigns_model');

	$rows = $obj->campaigns_model->get_list($params);
	
	return $rows;
	
}
		
function campaigns_latest_campaigns($limit = 5)
{
	//echo "Campaigns Latest Campaigns Called<br>";
	//return;
	$obj =& get_instance();

	$rows = array();
	$params = array(
	'limit' => $limit,
	'order_by' => 'campaigns.ordering, campaigns.id DESC',
	'where' => array('campaigns.lang' => $obj->user->lang)
	);
	$obj->load->model('campaigns/campaigns_model');

	$rows = $obj->campaigns_model->get_list($params);
	
	return $rows;

}


?>
