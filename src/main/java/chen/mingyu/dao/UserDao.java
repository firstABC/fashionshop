package chen.mingyu.dao;

import java.util.List;

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
	public User getUserInfo(User user);
	
	//修改用户信息
	public void updateUser(User user);
	
	//查询所有用户
	public List<User> getAllUser();
}
