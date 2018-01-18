<?php   if (!defined('BASEPATH')) exit('No direct script access allowed');

//get the new module version from xml file.
$module = 'campaigns';

//update to 1.1.0
$version = "1.1.0";

//compare it with the installed module version 

if ($this->system->modules[$module]['version'] < $version)
{
	
	$this->load->dbforge();
	$fields = array(
		'ordering' => array('type' => 'int', 'default' => 0)
	);
	
	$this->dbforge->add_column('campaigns', $fields);
	
	$this->session->set_flashdata("notification", sprintf(__("Campaigns module updated to %s", $module), $version)) ;
	
	$data = array('version' => $version);
	$this->db->where(array('name'=> $module));
	$this->db->update('modules', $data);
	redirect("admin/module");
}

//update to 1.2.1
$version = "1.2.1";

//compare it with the installed module version 

if ($this->system->modules[$module]['version'] < $version)
{
	
	$this->load->dbforge();
	$fields = array(
		'uri' => array('type' => 'varchar', 'constraint' => 100, 'default' => '')
	);
	
	$this->dbforge->add_column('campaigns_cat', $fields);
	
	$this->load->model('campaigns_model', 'campaigns');
	if($rows = $this->campaigns->get_catlist())
	{
		foreach ($rows as $row)
		{
			$uri = $this->campaigns->generate_cat_uri($row['title']);
			$data = array('uri' => $uri);
			$this->db->where('id', $row['id']);
			$this->db->update('campaigns_cat', $data);

		}
	}	
	
	
	$this->session->set_flashdata("notification", sprintf(__("Campaigns module updated to %s", $module), $version)) ;
	
	$data = array('version' => $version);
	$this->db->where(array('name'=> $module));
	$this->db->update('modules', $data);
	redirect("admin/module");
}

//update to 1.2.2
$version = "1.2.2";

// captcha removed from core and added as plugin filter (so that developpers may add other captcha)

if ($this->system->modules[$module]['version'] < $version)
{
	

	$this->session->set_flashdata("notification", sprintf(__("Campaigns module updated to %s", $module), $version)) ;
	
	$data = array('version' => $version);
	$this->db->where(array('name'=> $module));
	$this->db->update('modules', $data);
	redirect("admin/module");
}


//update to 1.3.0
$version = "1.3.0";

// tags moved to campaigns

if ($this->system->modules[$module]['version'] < $version)
{

$fields = array(
	'id' => array(
			 'type' => 'INT',
			 'constraint' => 5,
			 'unsigned' => TRUE,
			 'auto_increment' => TRUE
	  ),
	'tag' => array(
			 'type' => 'VARCHAR',
			 'constraint' => '255',
	  ),
	'uri' => array(
			 'type' => 'VARCHAR',
			 'constraint' => '255',
	  ),
	'campaigns_id' => array(
			 'type' => 'INT',
			 'constraint' => '5',
	  )
);
$this->load->dbforge();
$this->dbforge->add_field($fields); 
$this->dbforge->add_key('id', TRUE);
$this->dbforge->add_key('tag');
$this->dbforge->create_table('campaigns_tags', TRUE);

	$this->session->set_flashdata("notification", sprintf(__("Campaigns module updated to %s", $module), $version)) ;
	
	$data = array('version' => $version);
	$this->db->where(array('name'=> $module));
	$this->db->update('modules', $data);
	redirect("admin/module");
}

//update to 2.1.0
$version = "2.1.0";

// captcha removed from core and added as plugin filter (so that developpers may add other captcha)

if ($this->system->modules[$module]['version'] < $version)
{
	

	$this->session->set_flashdata("notification", sprintf(__("Campaigns module updated to %s", $module), $version)) ;
	
	$data = array('version' => $version);
	$this->db->where(array('name'=> $module));
	$this->db->update('modules', $data);
	redirect("admin/module");
}
