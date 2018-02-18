<?php
namespace Admin\Model;
use Think\Model;
class AdminModel extends Model{
	protected $_validate=array(
			
	);
	protected $_auto=array(
			
	);
	public function login($uname,$pass,$type=1){
		$where=array();
		switch ($type){
			case 1:
				$where['account']=$uname;
				break;
			case 2:
				$where['email']=$uname;
				break;
			default:return 0;
		}
		$admin=$this->where($where)->find();
		//echo $this->getLastSql();
		//p($admin);die;
		if(is_array($admin) && $admin['status']){
			if(tglx_admin_md5($pass,UC_AUTH_KEY)===$admin['password']){
				
				//记录用户行为
				action_log('user_login','admin',$admin['id'],$admin['id']);
				
				$this->updateLogin($admin['id']);
				
				//记录session
				$auth=array(
					'uid'=>$admin['id'],
					'username'=>$admin['account'],
					'last_login_time'=>$admin['last_login_time'],
				);
				session('user_auth',$auth);
				session('user_auth_sign',data_auth_sign($auth));
				
				
				return $admin['id'];
			}else{
				return -2;
			}
		}else{
			return -1; //用户不存在或者被禁用
		}
	}
	public function logout(){
		session('user_auth',null);
		session('user_auth_sign',null);
	}
	/**
	 * 更新用户登陆信息
	 */
	public function updateLogin($uid){
		$data=array(
			'id'=>$uid,
			'last_login_time'=>NOW_TIME,
			'last_login_ip'=>get_client_ip(1)
		);
		$this->save($data);
	}
}