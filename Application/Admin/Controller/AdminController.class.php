<?php
namespace Admin\Controller;
use Think\Controller;
class AdminController extends Controller{
	protected function _initialize(){
		define('UID', is_login());
		if(!UID){
			$this->redirect('Public/login');
		}
	}
}