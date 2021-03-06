<?php


class ApiUsers extends CI_Model
{

	public function get_token($username, $password)
	{
		$user_data = $this->db->get_where('user', array('username' => $username))->row();
		if ($user_data) {
			$encrypted_password = md5($password);
			if ($encrypted_password === $user_data->password) {
				return $this->createUserToken($user_data->id);
			}
		}
		return false;
	}

	public function check_user_token($token = 0)
	{
		if ($token) {
			$user_token = $this->db->get_where('user_tokens', array('token' => $token))->row();
			if ($user_token) {
				return $user_token->user_id;
			}
		}
		return false;
	}

	public function user_details($id)
	{
		$this->db->select('id, username, phone, status, manual');
		$this->db->from('user');
		$this->db->where('id', $id);
		$details = $this->db->get()->row();
		return $details;
	}

	public function createActivity($user_id = 0, $token = NULL, $action)
	{
		if(!$user_id && $token){
			$user_token = $this->db->get_where('user_tokens', array('token' => $token))->row();
			$user_id = $user_token->user_id;
		}
		if ($user_id) {
			if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
				$ip = $_SERVER['HTTP_CLIENT_IP'];
			} elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
				$ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
			} else {
				$ip = $_SERVER['REMOTE_ADDR'];
			}
			$data['action'] = $action;
			$data['user_id'] = $user_id;
			$data['user_ip'] = $ip;
			$data['action_datetime'] = date("Y-m-d H:i:s");
			$this->db->insert('activity_log', $data);
		}
	}

	private function createUserToken($user_id)
	{
		$user_token = $this->db->get_where('user_tokens', array('user_id' => $user_id))->row();
		$data['token'] = $this->generateRandomString(32) . md5($user_id) . rand(1000, 9999);
		if ($user_token) {
			$this->db->update("user_tokens", $data, array('user_id' => $user_id));
		} else {
			$data['user_id'] = $user_id;
			$this->db->insert("user_tokens", $data);
		}
		return $data['token'];
	}

	private function generateRandomString($length = 10)
	{
		$characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
		$charactersLength = strlen($characters);
		$randomString = '';
		for ($i = 0; $i < $length; $i++) {
			$randomString .= $characters[rand(0, $charactersLength - 1)];
		}
		return $randomString;
	}
}
