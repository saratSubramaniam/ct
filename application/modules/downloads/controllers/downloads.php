<?php
/*
 * $Id$
 *
 *
 */
  

if (!defined('BASEPATH')) exit('No direct script access allowed');

class Downloads extends MX_Controller {
	var $template;

	function __construct()
	{
		parent::__construct();
	
		$this->template['module']	= 'downloads';
		$this->load->model('download_model', 'downloads');

	}
	
	function index($pid = 0, $start = null)
	{
		//rehefa tsisy nin nin dia lisitry ny cateogory
		$per_page = 20;
		
		
		$this->template['rows'] = $this->downloads->get_catlist_by_pid($pid);
		
		if ($pid != 0)
		{
			$parent = $this->downloads->get_cat($pid);
			//language check.
			//if people are just opening the link to the category with a different language
			//they will be redirected to the right language
			if($parent['lang'] != $this->user->lang)
			{
				redirect($parent['lang'] . '/downloads/index/' . $pid );
				return;
			}
			$this->template['parent'] = $parent;
		}
		
		if (isset($this->template['parent']['title']))
		{
			$this->template['title'] = $this->template['parent']['title'];
			/*
			$this->template['breadcrumb'][] = array(
									'title' => ucwords($this->template['parent']['title']),
									'uri'	=> 'downloads/index/' . $pid
								);
			*/
		}
		else
		{
			$this->template['title'] = __("Downloads", 'downloads');
		}

		$this->template['files'] = $this->downloads->get_docs($pid, $start, $per_page);
		
		$this->load->library('pagination');
		
		$config['uri_segment'] = 4;
		$config['first_link'] = __('First');
		$config['last_link'] = __('Last');
		$config['base_url'] = base_url() . 'downloads/index/' . $pid;
		$config['total_rows'] = $this->downloads->get_totaldocs($pid);
		$config['per_page'] = $per_page; 

		$this->pagination->initialize($config); 


		$this->template['pager'] = $this->pagination->create_links();
		$this->layout->load($this->template, 'index');
	
	}
	
}	
