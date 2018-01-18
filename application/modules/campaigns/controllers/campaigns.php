<?php   if (!defined('BASEPATH')) exit('No direct script access allowed');
	
	class Campaigns extends MX_Controller {
		
		var $settings = array();
		var $template = array();
		
		function __construct()
		{
			parent::__construct();
			//$this->output->enable_profiler(true);
			$this->template['module'] = "campaigns";

			$this->settings = isset($this->system->campaigns_settings) ? unserialize($this->system->campaigns_settings) : array();

			$this->load->model('campaigns_model', 'campaigns');
			//$this->lang = $this->session->userdata('lang');
		}
		
		function comment()
		{
			//settings
			$campaigns = $this->campaigns->get_campaigns($this->input->post('uri'));
			
			$this->plugin->do_action('campaigns_save_comment');
			
			$fields = array('campaigns_id', 'author', 'email', 'website', 'body');
			$data = array();
			$data['ip'] = $this->input->ip_address();
			foreach ($fields as $field)
			{
				$data[$field] = $this->input->post($field);
			}
			
			if ($this->settings['approve_comments'])
			{
				$data['status'] = 1;
				if ($campaigns['notify'] == 1 && $campaigns['email'])
				{
					$this->load->library('email');

					$this->email->from($campaigns['email'], $this->system->site_name );
					$this->email->to($campaigns['email']);

					$this->email->subject('[' . $this->system->site_name . '] '. __("Comment Notification", $this->template['module']));
					
					$smsg = __("
Hello,

A new comment has been sent to the campaigns
%s


If you don't want to receive other notification, go to
%s

and disable notification.
");
					$msg = sprintf($smsg, 
							site_url('campaigns/' . $campaigns['uri']),
							site_url('admin/campaigns/create/' . $campaigns['id'])
						);
						
					$this->email->message($msg);

					$this->email->send();
					
					//notify admin
				
				}

				if (isset($this->settings['notify_admin']) && $this->settings['notify_admin'] === true)
				{
					$this->load->library('email');

					$this->email->from($campaigns['email'], $this->system->site_name );
					$this->email->to($campaigns['email']);

					$this->email->subject('[' . $this->system->site_name . '] '. __("Comment Notification", $this->template['module']));
					$msg = __("
Hello,

A new comment has been sent to the campaigns
%s


If you don't want to receive other notification, go to
%s

and disable notification.
", "campaigns");
					$msg = sprintf($msg,
							site_url('campaigns/' . $campaigns['uri']),
							site_url('admin/campaigns/settings#two')
						);
					$this->email->to($this->system->admin_email);
					$this->email->message($msg);
					$this->email->send();
				}
				
			}
			else
			{
				
				if ($campaigns['email'] != '')
				{
					$this->load->library('email');

					$this->email->from($campaigns['email'], $this->system->site_name );
					$this->email->to($campaigns['email']);

					$this->email->subject('[' . $this->system->site_name . '] '. __("Comment to approve", $this->template['module']));
					
					$msg = __("
Hello,

A new comment has been sent to the campaigns
%s
To approve it click the link below 
%s

If you don't want to receive other notification, go to
%s

and set to approve comments automatically.
", "campaigns");
					$msg = sprintf($msg, 
							site_url('campaigns/' . $campaigns['uri']),
							site_url('admin/campaigns/comments/approve/' . $campaigns['id']),
							site_url('admin/campaigns/settings#two')
						);
						
					$this->email->message($msg);

					$this->email->send();

				}
				
				$this->session->set_flashdata('notification', __("Thank you for your comment. In this site, the comments need to be approved by the administrator. Once approved, you will see it listed here.", $this->template['module']));
			}
			
			$data = $this->plugin->apply_filters('comment_filter', $data);
			
			
			$this->db->insert('campaigns_comments', $data);
			redirect('campaigns/' . $this->input->post('uri'), 'refresh');
		}
	
		function read($uri = null)
		{
			if (is_null($uri))
			{
				redirect('campaigns/list');
			}
			else
			{
				
				if($campaigns = $this->campaigns->get_campaigns($uri))
				{
					//if draft it should not be red
					
					if($campaigns['status'] == 0 && $campaigns['author'] != $this->user->username)
					{
					
						$this->template['title'] = __("Not allowed", $this->template['module']);
						$this->layout->load($this->template, '403');
						return;
					
					}
					//pagination for comments
					$this->template['comments'] = $this->campaigns->get_comments($campaigns['id']);
					
					//debug
					
					//hits
					if ($this->session->userdata('campaigns'.$campaigns['id']) != $campaigns['id'])
					{
						$this->session->set_userdata('campaigns'.$campaigns['id'], $campaigns['id']);
						$this->db->where('id', $campaigns['id']);
						$this->db->set('hit', 'hit+1', FALSE);
						
						$this->db->update('campaigns');
						$this->cache->remove('campaigns'.$this->user->lang, 'campaigns');
					}
					
					//var_dump($rows->result_array());
					
					$this->template['title'] = $campaigns['title'];
					$this->template['campaigns'] = $campaigns;
					$this->template['settings'] = $this->settings;
					$this->layout->load($this->template, 'read');
				
				}
				else
				{
					$this->template['title'] = __("No campaigns found", $this->template['module']);
					$this->layout->load($this->template, '404');
				}
			}
		}
		
		
		function index($start = 0)
		{
			$per_page = 20;
			
			$params['limit'] = $per_page;
			$params['start'] = $start;
			$params['where'] = array('campaigns.lang' => $this->user->lang);
			
			
			$this->load->library('pagination');
			
			$config['uri_segment'] = 3;
			$config['first_link'] = __('First', 'campaigns');
			$config['last_link'] = __('Last', 'campaigns');
			$config['base_url'] = site_url('campaigns/list');
			$config['total_rows'] = $this->campaigns->get_total_published($params);
			$config['per_page'] = $per_page; 	
			$this->pagination->initialize($config); 

			$this->template['rows'] = $this->campaigns->get_list($params);
			$this->template['start'] = $start;
			$this->template['total_rows'] = $config['total_rows'];
			$this->template['pager'] = $this->pagination->create_links();		

			$this->template['title'] = __("All campaigns", $this->template['module']);
			
			$this->layout->load($this->template, 'index');
		}
		
		
		function cat ()
		{
			$uri = $this->uri->segment(3);
			$start = $this->uri->segment(4);
			$per_page = 20;
			
			$params['limit'] = $per_page;
			$params['start'] = $start;
			if(is_null($uri))
			{
				$params['where'] = array('campaigns.lang' => $this->user->lang, 'cat' => 0);
				$this->template['category'] = array('title' => __("No category", "campaigns"));
				$config['uri_segment'] = 3;
				$config['base_url'] = site_url('campaigns/cat');
			}
			else
			{
				$cat = $this->campaigns->get_cat(array('uri' => $uri, 'lang' => $this->user->lang));

				$params['where'] = array('campaigns.lang' => $this->user->lang, 'cat' => $cat['id']);
				$this->template['category'] = $cat;
				$config['uri_segment'] = 4;
				$config['base_url'] = site_url('campaigns/cat/' . $uri);
			}
			
			
			$this->load->library('pagination');
			
			$config['first_link'] = __('First', 'campaigns');
			$config['last_link'] = __('Last', 'campaigns');
			$config['total_rows'] = $this->campaigns->get_total_published($params);
			$config['per_page'] = $per_page; 	
			$this->pagination->initialize($config); 

			$this->template['rows'] = $this->campaigns->get_list($params);

			$this->template['start'] = $start;
			$this->template['total_rows'] = $config['total_rows'];
			$this->template['pager'] = $this->pagination->create_links();
			if(isset($cat))
			{
				$this->template['title'] = sprintf(__("Campaigns in %s", $this->template['module']), $cat['title']);
			}
			else
			{
				$this->template['title'] = __("Other campaigns", $this->template['module']);			
			}

			
			$this->layout->load($this->template, 'index');
			
		}
	
		function tag ()
		{
			
			$tag = $this->uri->segment(3);
			$start = $this->uri->segment(4);
			$per_page = 20;
			
			
			
			if(is_null($tag))
			{
				$this->template['title'] = __("Tag list", "campaigns");
				$this->template['rows'] = $this->campaigns->get_tags();
				$this->layout->load($this->template, 'tag_list');
				return;
			}
			else
			{
				$this->template['title'] = sprintf(__("Campaigns tagged with %s ", "campaigns"), $tag);
				$per_page = 20;
				
				$params['limit'] = $per_page;
				$params['start'] = $start;
				$params['where'] = array('campaigns.lang' => $this->user->lang);
				$params['where']['campaigns_tags.uri'] = $tag;
				$params['order_by'] = 'campaigns.id DESC';
				
				
				$this->load->library('pagination');
				
				$config['uri_segment'] = 4;
				$config['first_link'] = __('First', 'campaigns');
				$config['last_link'] = __('Last', 'campaigns');
				$config['base_url'] = site_url('campaigns/tag/' . $tag);
				$config['total_rows'] = $this->campaigns->get_total_campaigns_by_tag($params);
				$config['per_page'] = $per_page; 	
				$this->pagination->initialize($config); 

				$this->template['rows'] = $this->campaigns->get_campaigns_by_tag($params);
				$this->template['start'] = $start;
				$this->template['total_rows'] = $config['total_rows'];
				$this->template['pager'] = $this->pagination->create_links();		
			
				$this->layout->load($this->template, 'index');
			}
		}		
	
	
	}

?>
