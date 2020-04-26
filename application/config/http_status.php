<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$config['status'] = array(
    "success" => array(
        'code' => 200,
        'msg' => "Success"
    ),
    "auth_failed" => array(
        "code" => 214, 
        "msg" => "Authentication Failed"
    ),
    "validation_failed" => array(
        "code" => 213, 
        "msg" => "Validation Failed"
    ),
	"deactivated" => array(
		"code" => 215,
		"msg" => "Account Deactivated"
	),
    "system_error" => array(
        "code" => 500, 
        "msg" => "Something Went Wrong"
    ),
    "bad_request" => array(
        "code" => 400, 
        "msg" => "Bad Request"
    )
    ,
    "not_found" => array(
        "code" => 404, 
        "msg" => "Not Found"
    ),
    "access_denied" => array(
        "code" => 502, 
        "msg" => "Access Denied"
    ),
);
