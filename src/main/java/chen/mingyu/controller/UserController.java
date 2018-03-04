package chen.mingyu.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import chen.mingyu.dao.UserDao;
import chen.mingyu.domain.User;



@Controller
public class UserController{
		
		private static Logger logger = Logger.getLogger(UserController.class);
		
		@Autowired
		private UserDao userDao;
		
		//private User user;
		
		@RequestMapping(value = "/login", method = RequestMethod.GET) 

		public String login(HttpServletRequest request,HttpServletResponse response,  
		@RequestParam("userName")String userName, @RequestParam("userPwd")String userPwd, 
		Model model) throws Exception { 
			HttpSession session = request.getSession();
			User user = new User(userName,userPwd);
			user.setIsDelete("0");
			User loginUser = userDao.getLoginUser(user);
			if(loginUser != null){
				 model.addAttribute("loginUser", loginUser); 
				 session.setAttribute("userId", loginUser.getUserId());
				 session.setAttribute("userName", userName);
			     return "index";
			}
			else{
				model.addAttribute("msg", "登录用户错误");
				return "login";
			}

		}
		@RequestMapping("/out")
		public String out(HttpServletRequest request) throws Exception{
			HttpSession session = request.getSession();
			session.invalidate();
			return "index";
		}
		@RequestMapping("/register")
		public String register(HttpServletRequest request,HttpServletResponse response,User user,Model model){
			HttpSession session = request.getSession();
			if(user != null){
				//设置id
				Integer userId = userDao.countUserMaxId()+1;
				String userIdStr = userId.toString();
				user.setUserId(userIdStr);
				//默认未禁用
				user.setIsDelete("0");
				//设置当前注册时间
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				user.setUserDate(sdf.format(date));
				userDao.addUser(user);
				session.setAttribute("userName", user.getUserName());
				session.setAttribute("userId", user.getUserId());
				return "index";
			}else{
				model.addAttribute("msg", "注册失败!");
				return "register";
			}
		}
		
		@RequestMapping("/getUserInfoById")
		public String getUserInfoById(HttpServletRequest request,@RequestParam("userId")String userId,Model model){
			HttpSession session = request.getSession();
			if(userId != null){
				User user = new User();
				user.setUserId(userId);
				User userResult = userDao.getUserInfo(user);
				session.setAttribute("user", userResult);
				return "info";
			}else{
				model.addAttribute("msg", "登录超时!");
				return "login";
			}
		}
		@RequestMapping(value="/updateUser", method = RequestMethod.POST)
		public String updateUser(HttpServletRequest request,HttpServletResponse response,User user,Model model){
			HttpSession session = request.getSession();
			if(user.getUserId() != null){
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				user.setUserDate(sdf.format(date));
				userDao.updateUser(user);
				session.setAttribute("user", user);
				session.setAttribute("userName", user.getUserName());
				session.setAttribute("userId", user.getUserId());
				return "info";
			}else{
				model.addAttribute("msg", "登录超时!");
				return "login";
			}
			
		}
		@RequestMapping("/getUserCheck")
		public String getUserCheck(HttpServletRequest request,Model model,
				@RequestParam("userName")String userName,
				@RequestParam("userPhone")String userPhone,
				@RequestParam("userEmail")String userEmail){
			
			User user = new User();
			User userResult = new User();
			if(userName != null){
				user.setUserName(userName);
				userResult = userDao.getUserInfo(user);
				if(userResult != null){
					return "用户名重复";
				}else{
					return "true";
				}
			}else if(userPhone != null){
				user.setUserPhone(userPhone);
				userResult = userDao.getUserInfo(user);
				if(userResult != null){
					return "手机号重复";
				}else{
					return "true";
				}
			}else if(userEmail != null){
				user.setUserEmail(userEmail);
				userResult = userDao.getUserInfo(user);
				if(userResult != null){
					return "邮箱重复";
				}else{
					return "true";
				}
			}else{
				user = null;
				return "true";
			}
		}
}
