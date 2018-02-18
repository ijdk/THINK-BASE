<?php

/**
 * 系统非常规MD5加密方法
 * @param  string $str 要加密的字符串
 * @return string
 */
function tglx_admin_md5($str, $key = 'ThinkUCenter'){
	return '' === $str ? '' : md5(sha1($str) . $key);
}

/**
 * 检查用户是否已经登陆
 * @return number|Ambigous <number, mixed>
 */
function is_login(){
	$user=session('user_auth');
	if(empty($user)){
		return 0;
	}else{
		return session('user_auth_sign')==data_auth_sign($user) ? $user['uid'] : 0;
	}
}
/**
 * 数据签名认证
 * @param 被认证的数据 $data
 * @return string 签名
 */
function data_auth_sign($data){
	if(!is_array($data)){
		$data=(array)$data;
	}	
	ksort($data);
	$code=http_build_query($data);
	$sign=sha1($code);
	return $sign;
}