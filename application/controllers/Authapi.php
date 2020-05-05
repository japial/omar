<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Authapi extends CI_Controller
{
	private $status;
	public function __construct()
	{
		parent::__construct();
		$this->config->load('http_status');
		$this->load->library('form_validation');
		$this->config->load('form_validation');
		$this->load->model('ApiUsers');
		$this->status = $this->config->item('status');
	}

	public function login()
	{
		if ($_POST) {
			$password = $this->input->post('password');
			$username = $this->input->post('username');
			if ($password && $username) {
				$token = $this->ApiUsers->get_token($username, $password);
				if ($token) {
					$this->ApiUsers->createActivity(0, $token, 'User Login Using API');
					$data['status'] = $this->status['success'];
					$data['data'] = array('token' => $token);
				} else {
					$data['status'] = $this->status['auth_failed'];
				}
			} else {
				$data['status'] = $this->status['validation_failed'];
				$data['data'] = array('error' => 'Username and Password Required');
			}
		} else {
			$data = $this->status['bad_request'];
		}
		echo json_encode($data);
	}
	
	public function logout()
	{
		if ($_POST) {
			$user_id = $this->ApiUsers->check_user_token($this->input->post('token'));
			if ($user_id) {
				$this->db->delete('user_tokens', array('user_id' => $user_id));
				$this->ApiUsers->createActivity($user_id, NULL, 'User Logout Using API');
				$data['status'] = $this->status['success'];
			} else {
				$data['status'] = $this->status['auth_failed'];
			}
		} else {
			$data['status'] = $this->status['bad_request'];
		}
		echo json_encode($data);
	}
}
