<?php
namespace Admin\Controller;
use Think\Controller;
use Think\Verify;
class PublicController extends Controller{
	protected $Admin=null;
	protected function _initialize(){
		$this->Admin=D('Admin');
	}
	public function login($username = null, $password = null, $verify = null){
		if(IS_POST){
			/* 检测验证码 */
			if(!check_verify($verify)){
				$this->error('验证码错误！');
			}
			//$Admin=D('Admin');
			$Admin=$this->Admin;
			$uid=$Admin->login($username, $password,1);
			
			if($uid>0){
				$this->success('登录成功！', U('Index/index'));
			}else{
				switch ($uid){
					case -1:$error="用户不存在或者被禁用";break;
					case -2:$error="密码错误！";break;
					default:$error="未知错误!";break;
				}
				$this->error($error);
			}
		}else{
			if(is_login()){
				$this->redirect('Index/index');
			}else{
				$this->display();
			}			
		}
	}
	public function logout(){
		if(is_login()){
			$Admin=$this->Admin;
			$Admin->logout();
			session('[destory]');
			$this->success('退出成功！',U('login'));
		}else{
			$this->redirect('login');
		}
	}
	public function verify(){		
		$verify = new Verify();
		$verify->entry(1);
	}
}