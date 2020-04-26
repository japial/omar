<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Authapi extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->config->load('http_status');
		$this->load->library('form_validation');
		$this->config->load('form_validation');
		$this->load->model('ApiUsers');
	}

	public function login()
	{
		$status = $this->config->item('status');
		if ($_POST) {
			$password = $this->input->post('password');
			$username = $this->input->post('username');
			if ($password && $username) {
				$token = $this->ApiUsers->get_token($username, $password);
				if ($token) {
					$data['status'] = $status['success'];
					$data['data'] = array('token' => $token);
				} else {
					$data['status'] = $status['auth_failed'];
				}
			} else {
				$data['status'] = $status['validation_failed'];
				$data['data'] = array('error' => 'Username and Password Required');
			}
		} else {
			$data = $status['bad_request'];
		}
		echo json_encode($data);
	}
}
