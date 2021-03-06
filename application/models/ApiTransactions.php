<?php


class ApiTransactions extends CI_Model
{
	public function find_transaction($id)
	{
		$this->db->select('transaction.tran_id, transaction.user_id, transaction.token, transaction.type, transaction.submission_datetime');
		$this->db->from('transaction');
		$this->db->where('transaction.tran_id', $id);
		$this->db->where('transaction.deletion_status', 0);
		return $this->db->get()->row();
	}

	public function daily_transactions($user)
	{
		$this->db->select('transaction.tran_id,	transaction.token, transaction.submission_datetime, transaction_d.code, transaction_d.st, transaction_d.rbl, transaction_d.tran_type');
		$this->db->from('transaction');
		$this->db->join('transaction_d', 'transaction_d.tran_id=transaction.tran_id', 'inner');
		$this->db->where('transaction.type', 1);
		$this->db->where('transaction.user_id', $user);
		$this->db->where('transaction.deletion_status', 0);
		$this->db->order_by('transaction.tran_id', 'DESC');
		return $this->db->get()->result();
	}

	public function weekly_transactions($user)
	{
		$this->db->select('transaction.tran_id,	transaction.token, transaction.submission_datetime, transaction_w.code, transaction_w.st, transaction_w.rbl, transaction_w.tran_type');
		$this->db->from('transaction');
		$this->db->join('transaction_w', 'transaction_w.tran_id=transaction.tran_id', 'inner');
		$this->db->where('transaction.type', 2);
		$this->db->where('transaction.user_id', $user);
		$this->db->where('transaction.deletion_status', 0);
		$this->db->order_by('transaction.tran_id', 'DESC');
		return $this->db->get()->result();
	}

	public function lastTransaction($user, $daily = 0)
	{
		$this->db->select('tran_id,	token, submission_datetime');
		$this->db->from('transaction');
		$this->db->where('user_id', $user);
		$this->db->where('deletion_status', 0);
		if($daily){
			$this->db->where('type', 1);
			$this->db->where('submission_datetime >=', date("Y-m-d 00:00:00"));
			$this->db->where('submission_datetime <=', date("Y-m-d H:i:s"));
		}else{
			$this->db->where('type', 2);
			$this->db->where('submission_datetime >=', date("Y-m-d 00:00:00",  strtotime('monday this week')));
			$this->db->where('submission_datetime <=', date("Y-m-d H:i:s"));
		}
		$this->db->order_by('tran_id', 'DESC');
		$this->db->limit(1);
		return $this->db->get()->row();
	}


}
