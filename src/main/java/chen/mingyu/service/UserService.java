package chen.mingyu.service;

import chen.mingyu.domain.User;

public interface UserService {
	//登录
	public User getLoginUser(User user);
	
	//注册
	public User addUser(User user);
	
	//通过用户id查询用户信息
	public User getUserInfoById(int userId);
	
	//修改用户信息
	public void updateUser(User user);
}
