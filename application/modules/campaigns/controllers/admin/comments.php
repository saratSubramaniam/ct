<?php   if (!defined('BASEPATH')) exit('No direct script access allowed');

	class Comments extends MX_Controller {
		
		var $settings = array();
		var $template = array();
		
		function __construct()
		{
			parent::__construct();
			
			$this->load->library('administration');

			$this->template['module']	= 'campaigns';
			$this->template['admin']		= true;
			$this->settings = isset($this->system->campaigns_settings) ? unserialize($this->system->campaigns_settings) : array();
			
		}
		
		function index($start = 0)
		{
			$this->load->helper('text');
			
			$per_page = 20;
			$this->user->check_level($this->template['module'], LEVEL_VIEW);
			
			//filter
			$status = '1';
			if ($this->input->post('status') == '0')
			{
				$this->db->where('status', 0);
				$status = '0';
			}
			elseif ($this->input->post('status') == '1')
			{
				$this->db->where('status', 1);
				$status = '1';
			}
			$this->template['status'] = $status;
			//search
			if ($tosearch = $this->input->post('tosearch'))
			{
				$this->db->like('body', $tosearch);
				$this->db->or_like('author', $tosearch);
			}
			$this->db->order_by('id DESC');
			
			$query = $this->db->get('campaigns_comments', $per_page, $start);

			$this->template['rows'] = $query->result_array();
			
			
			$this->load->library('pagination');
			
			$config['uri_segment'] = 4;
			$config['first_link'] = __('First');
			$config['last_link'] = __('Last');
			$config['base_url'] = base_url() . 'admin/comments/index';
			$config['total_rows'] = count($this->db->count_all('campaigns_comments'));
			$config['per_page'] = $per_page; 

			$this->pagination->initialize($config); 

			$this->template['pager'] = $this->pagination->create_links();
			$this->layout->load($this->template, 'comments');
			
		}
		function approve($id)
		{
			$this->user->check_level($this->template['module'], LEVEL_EDIT);
			$this->db->where('id', $id);
			$this->db->set('status', 1);
			$this->db->update('campaigns_comments');
			$this->session->set_flashdata('notification', __("The comment has been approved", $this->template['module']));
			redirect('admin/campaigns/comments');
		}
		
		function suspend($id)
		{
			$this->user->check_level($this->template['module'], LEVEL_EDIT);
			$this->db->where('id', $id);
			$this->db->set('status', 0);
			$this->db->update('campaigns_comments');
			$this->session->set_flashdata('notification', __("The comment has been suspended", $this->template['module']));
			redirect('admin/campaigns/comments');
		}
		

		
		function delete($id, $js = 0)
		{
			$this->user->check_level($this->template['module'], LEVEL_DEL);
			if ( $js > 0 )
			{
				$this->db->where('id', $id);
				$query = $this->db->delete('campaigns_comments');
				
			
				$this->session->set_flashdata('notification', 'The comment has been deleted.');
				redirect('admin/campaigns/comments');
			}
			else
			{
				$this->template['id'] = $id;
				$this->layout->load($this->template, 'comment_delete');
			}
		}
		
	}

?>
