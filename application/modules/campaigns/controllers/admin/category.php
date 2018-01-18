<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/*
 * $Id$
 *
 *
 */
  
class Category extends MX_Controller {
	
	var $template = array();

	function __construct()
	{
		parent::__construct();
	
		$this->load->library('administration');

		$this->template['module']	= 'campaigns';
		$this->template['admin']		= true;
		$this->load->model('campaigns_model', 'campaigns');
	}


	function index($start = null)
	{
		//rehefa tsisy nin nin dia lisitry ny cateogory
		$per_page = 20;
		
		
		$this->user->check_level($this->template['module'], LEVEL_VIEW);
		
		
		$this->template['rows'] = $this->campaigns->get_catlist($start, $per_page);
		
		
		$this->load->library('pagination');
		
		$config['uri_segment'] = 5;
		$config['first_link'] = __('First');
		$config['last_link'] = __('Last');
		$config['base_url'] = base_url() . 'admin/campaigns/category/index';
		$config['total_rows'] = $this->campaigns->get_totalcat();
		$config['per_page'] = $per_page; 

		$this->pagination->initialize($config); 

		$this->template['pager'] = $this->pagination->create_links();
		$this->layout->load($this->template, 'admin/category');
	
	}

	function create($id = null)
	{

		$this->template['parents'] = $this->campaigns->get_catlist();
	
		if ($row = $this->campaigns->get_cat($id))
		{
			$this->template['row'] = $row;
		}
		else
		{
			$this->template['row'] = $this->campaigns->cat_fields;
		}
		
		$this->layout->load($this->template, 'admin/category_create');
	
	}
	
	function save()
	{
		$id = $this->input->post('id');
		$this->campaigns->save_cat($id);
		
		$this->session->set_flashdata('notification', __("Category saved", $this->template['module']));
		redirect('admin/campaigns/category');
		
	}
	
	function move($direction, $id)
	{
		$this->user->check_level($this->template['module'], LEVEL_EDIT);

		if (!isset($direction) || !isset($id))
		{
			redirect('admin/campaigns/category');
		}
		
		$this->campaigns->move_cat($direction, $id);
		
		redirect('admin/campaigns/category');					
		
				
	}
	
	function delete($id, $js = 0)
	{
		$this->user->check_level($this->template['module'], LEVEL_DEL);
		//cannot delete if contains files or categories
		
		if ($this->campaigns->get_cat(array('pid'=> $id)))
		{
			$this->session->set_flashdata('notification', __('The category contains other categories. It cannot be removed.'));

			redirect('admin/campaigns/category');
		}

		if ($this->campaigns->get_campaigns(array('cat' => $id)))
		{
			$this->session->set_flashdata('notification', __('The category contains campaigns. It cannot be removed.'));

			redirect('admin/campaigns/category');
		}
		
		if ( $js > 0 )
		{
			$this->campaigns->delete_cat($id);
			
			$this->session->set_flashdata('notification', __('The category  has been deleted.'));

			redirect('admin/campaigns/category');
		}
		else
		{
			$this->template['id'] = $id;
			
			$this->layout->load($this->template, 'admin/category_delete');
		}
	}
}
