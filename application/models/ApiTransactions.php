<?php


class ApiTransactions extends CI_Model
{
	public function daily_transactions($user)
	{
		$this->db->select('transaction.tran_id,	transaction.token, transaction.submission_datetime, transaction_d.code,	transaction_d.st, transaction_d.rbl');
		$this->db->from('transaction');
		$this->db->join('transaction_d', 'transaction_d.tran_id=transaction.tran_id', 'inner');
		$this->db->where('transaction.tran_type', 1);
		$this->db->where('transaction.user_id', $user);
		return $this->db->get()->result();
	}

	public function weekly_transactions($user)
	{
		$this->db->select('transaction.tran_id,	transaction.token, transaction.submission_datetime, transaction_d.code,	transaction_d.st, transaction_d.rbl');
		$this->db->from('transaction');
		$this->db->join('transaction_d', 'transaction_d.tran_id=transaction.tran_id', 'inner');
		$this->db->where('transaction.tran_type', 2);
		$this->db->where('transaction.user_id', $user);
		return $this->db->get()->result();
	}

}
