package chen.mingyu.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import chen.mingyu.domain.Page;
import chen.mingyu.domain.User;

@Repository("userDao")
public interface UserDao {
	//登录
	public User getLoginUser(User user);
	
	//注册
	public void addUser(User user);
	
	//通过用户id查询用户信息
	public User getUserInfo(User user);
	
	//修改用户信息
	public void updateUser(User user);
	
	//查询总数
	public int getUserCount();
	
	//查询所有用户
	public List<User> getAllUser();
	
	//逻辑删除用户信息
	public void deleteUser(User user);
	
	//查询用户去重
	public int getUserCheck(User user);
}
