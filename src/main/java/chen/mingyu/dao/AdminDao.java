package chen.mingyu.dao;


import org.springframework.stereotype.Repository;

import chen.mingyu.domain.Admin;

@Repository("adminDao")
public interface AdminDao {
	//登录
	public Admin getLoginAdmin(Admin admin);
	//查询最大Id
	public int countAdminMaxId();
	//注册
	public void addAdmin(Admin admin);
	
	//通过管理员id查询管理员信息
	public Admin getAdminInfoById(int adminId);
	
	//修改管理员信息
	public void updateAdmin(Admin admin);
}
