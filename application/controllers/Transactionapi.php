<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Transactionapi extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->config->load('http_status');
		$this->load->library('form_validation');
		$this->config->load('form_validation');
		$this->load->model('ApiUsers');
		$this->load->model('ApiTransactions');
	}

	public function index()
	{
		$status = $this->config->item('status');
		if ($_POST) {
			$user_id = $this->ApiUsers->check_user_token($this->input->post('token'));
			if ($user_id) {
				$userData = $this->ApiUsers->user_details($user_id);
				if ($userData->status == 1) {
					$daily = $this->ApiTransactions->daily_transactions($user_id);
					$weekly = $this->ApiTransactions->weekly_transactions($user_id);
					$data['status'] = $status['success'];
					$data['data'] = array(
						'user' => $userData,
						'daily' => $daily,
						'weekly' => $weekly
					);
				} else {
					$data['status'] = $status['deactivated'];
				}
			} else {
				$data['status'] = $status['auth_failed'];
			}
		} else {
			$data['status'] = $status['bad_request'];
		}
		echo json_encode($data);
	}
}
