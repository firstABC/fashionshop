package chen.mingyu.dao;


import org.springframework.stereotype.Repository;

import chen.mingyu.domain.Admin;

@Repository("adminDao")
public interface AdminDao {
	//登录
	public Admin getLoginAdmin(Admin admin);
}
