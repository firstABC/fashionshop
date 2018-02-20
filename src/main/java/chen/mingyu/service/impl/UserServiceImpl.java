package chen.mingyu.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chen.mingyu.domain.User;
import chen.mingyu.service.UserService;
import chen.mingyu.dao.UserDao;


@Service("userService")
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao userDao;

	/**
	 * 登录
	 */
	public User getLoginUser(User user) {
		user.setIsDelete("0");
		User rsUser = userDao.getLoginUser(user);
		return rsUser;
	}
	/**
	 * 注册
	 */
	public User addUser(User user) {
		//设置id
		user.setUserId(userDao.countUserMaxId()+1);
		//默认未禁用
		user.setIsDelete("0");
		//设置当前注册时间
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		user.setUserDate(sdf.format(date));
		userDao.addUser(user);
		return user;
	}
	/**
	 * 通过用户id获取用户信息
	 */
	public User getUserInfoById(int userId) {
		return userDao.getUserInfoById(userId);
	}
	
	/**
	 * 修改用户信息
	 */
	public void updateUser(User user) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		user.setUserDate(sdf.format(date));
		userDao.updateUser(user);
	}
	
}

