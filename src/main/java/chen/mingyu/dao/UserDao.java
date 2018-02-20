package chen.mingyu.dao;

import org.springframework.stereotype.Repository;

import chen.mingyu.domain.User;


@Repository("userDao")
public interface UserDao {
	//登录
	public User getLoginUser(User user);
	//查询最大Id
	public int countUserMaxId();
	//注册
	public void addUser(User user);
	
	//通过用户id查询用户信息
	public User getUserInfoById(int userId);
	
	//修改用户信息
	public void updateUser(User user);
}
