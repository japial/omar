<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Transactionapi extends CI_Controller
{
	private $status;
	public function __construct()
	{
		parent::__construct();
		$this->config->load('http_status');
		$this->load->library('form_validation');
		$this->config->load('form_validation');
		$this->load->model('ApiUsers');
		$this->load->model('ApiTransactions');
		$this->status = $this->config->item('status');
	}

	public function index()
	{
		if ($_POST) {
			$user_id = $this->ApiUsers->check_user_token($this->input->post('token'));
			if ($user_id) {
				$this->ApiUsers->createActivity($user_id, NULL, 'Transaction List Viewed');
				$userData = $this->ApiUsers->user_details($user_id);
				if ($userData->status == 1) {
					$daily = $this->ApiTransactions->daily_transactions($user_id);
					$weekly = $this->ApiTransactions->weekly_transactions($user_id);
					$data['status'] = $this->status['success'];
					$data['data'] = array(
						'user' => $userData,
						'daily' => $daily,
						'weekly' => $weekly
					);
				} else {
					$data['status'] = $this->status['deactivated'];
				}
			} else {
				$data['status'] = $this->status['auth_failed'];
			}
		} else {
			$data['status'] = $this->status['bad_request'];
		}
		echo json_encode($data);
	}

	public function create(){
		if ($_POST) {
			$user_id = $this->ApiUsers->check_user_token($this->input->post('token'));
			if ($user_id) {
				$this->ApiUsers->createActivity($user_id, NULL, 'Transaction List Viewed');
				$userData = $this->ApiUsers->user_details($user_id);
				if ($userData->status == 1) {
					$daily = $this->input->post('daily');
					$transaction = $this->createTransaction($userData, $daily);
					if($daily){
						$this->createDailyTransaction($transaction['id']);
					}else{
						$this->createWeeklyTransaction($transaction['id']);
					}
					$data['status'] = $this->status['success'];
					$data['data'] = array(
						'serial_number' => $transaction['serial']
					);
				} else {
					$data['status'] = $this->status['deactivated'];
				}
			} else {
				$data['status'] = $this->status['auth_failed'];
			}
		} else {
			$data['status'] = $this->status['bad_request'];
		}
		echo json_encode($data);
	}

	private function createTransaction($userData, $daily = 0)
	{
		$data['user_id'] = $userData->id;
		if($userData->manual){
			$data['token'] = $this->input->post('manual_serial');
		}else{
			if($daily){
				$data['type'] = 1;
				$data['token'] = $this->makeDailyToken($userData->id);
			}else{
				$data['type'] = 2;
				$data['token'] = $this->makeWeeklyToken($userData->id);
			}
		}
		$data['submission_datetime'] = date("Y-m-d H:i:s");
		$this->db->insert('transaction', $data);
		$tran['id'] = $this->db->insert_id();
		$tran['serial'] = $data['token'];
		return $tran;
	}

	private function createDailyTransaction($tranID)
	{
		$threeDigit = json_decode($this->input->post('three_digit'));
		$twoDigit = json_decode($this->input->post('two_digit'));
		$oneDigit = json_decode($this->input->post('one_digit'));
		foreach ($threeDigit as $item){
			$data['tran_id'] = $tranID;
			$data['tran_type'] = '3-digits';
			$data['code'] = $item->code;
			$data['st'] = $item->st;
			$data['rbl'] = $item->rbl;
			$this->db->insert('transaction_d', $data);
		}
		foreach ($twoDigit as $item){
			$dataTwo['tran_id'] = $tranID;
			$dataTwo['tran_type'] = '2-digits';
			$dataTwo['code'] = $item->code;
			$dataTwo['st'] = $item->st;
			$this->db->insert('transaction_d', $dataTwo);
		}
		foreach ($oneDigit as $item){
			$dataOne['tran_id'] = $tranID;
			$dataOne['tran_type'] = '1-digit';
			$dataOne['code'] = $item->code;
			$dataOne['st'] = $item->st;
			$this->db->insert('transaction_d', $dataOne);
		}
	}

	private function createWeeklyTransaction($tranID)
	{
		$threeDigit = json_decode($this->input->post('three_digit'));
		$twoDigit = json_decode($this->input->post('two_digit'));
		$oneDigit = json_decode($this->input->post('one_digit'));
		foreach ($threeDigit as $item){
			$data['tran_id'] = $tranID;
			$data['tran_type'] = '3-digits';
			$data['code'] = $item->code;
			$data['st'] = $item->st;
			$data['rbl'] = $item->rbl;
			$this->db->insert('transaction_w', $data);
		}
		foreach ($twoDigit as $item){
			$dataTwo['tran_id'] = $tranID;
			$dataTwo['tran_type'] = '2-digits';
			$dataTwo['code'] = $item->code;
			$dataTwo['st'] = $item->st;
			$this->db->insert('transaction_w', $dataTwo);
		}
		foreach ($oneDigit as $item){
			$dataOne['tran_id'] = $tranID;
			$dataOne['tran_type'] = '1-digit';
			$dataOne['code'] = $item->code;
			$dataOne['st'] = $item->st;
			$this->db->insert('transaction_w', $dataOne);
		}
	}

	private function makeDailyToken($user_id){
		$today = $this->ApiTransactions->lastTransaction($user_id, 1);
		if($today){
			$lastTokenNumber = explode("-",$today->token);
			$nextNumber = intval($lastTokenNumber[1]) + 1;
		}else{
			$nextNumber = 1;
		}
		$zeroPadding = sprintf("%03d", $nextNumber);
		return 'D-'.$zeroPadding;
	}

	private function makeWeeklyToken($user_id){
		$today = $this->ApiTransactions->lastTransaction($user_id);
		if($today){
			$lastTokenNumber = explode("-",$today->token);
			$nextNumber = intval($lastTokenNumber[1]) + 1;
		}else{
			$nextNumber = 1;
		}
		$zeroPadding = sprintf("%03d", $nextNumber);
		return 'W-'.$zeroPadding;
	}
}
