<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Authapi extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->config->load('http_status');
		$this->load->library('form_validation');
		$this->config->load('form_validation');
	}

}
