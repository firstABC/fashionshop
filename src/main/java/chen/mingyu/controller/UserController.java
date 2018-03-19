package chen.mingyu.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;




import chen.mingyu.dao.UserDao;
import chen.mingyu.domain.ConsultVO;
import chen.mingyu.domain.Page;
import chen.mingyu.domain.User;



@Controller
public class UserController{
		
		private static Logger logger = Logger.getLogger(UserController.class);
		
		@Autowired
		private UserDao userDao;
		
		//private User user;
		
		@RequestMapping(value = "/login", method = RequestMethod.GET) 

		public String login(HttpServletRequest request,HttpServletResponse response,  
		@RequestParam("userName")String userName, @RequestParam("userPwd")String userPwd) throws Exception { 
			HttpSession session = request.getSession();
			User user = new User(userName,userPwd);
			user.setIsDelete("0");
			User loginUser = userDao.getLoginUser(user);
			if(loginUser != null){
				 session.setAttribute("userId", loginUser.getUserId());
				 session.setAttribute("userName", userName);
			     return "forward:/switch/toIdex";
			}
			else{
				request.setAttribute("msg", "登录失败");
				return "login";
			}
		}
		@RequestMapping("/out")
		public String out(HttpServletRequest request) throws Exception{
			HttpSession session = request.getSession();
			session.invalidate();
			return "forward:/switch/toIdex";
		}
		@RequestMapping("/register")
		public String register(HttpServletRequest request,HttpServletResponse response,User user){
			HttpSession session = request.getSession();
			if(user != null){
				//设置id
				String userIdStr = UUID.randomUUID().toString();
				user.setUserId(userIdStr);
				//默认未禁用
				user.setIsDelete("0");
				//设置当前注册时间
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				user.setUserDate(sdf.format(date));
				User uCons = new User();
				uCons.setUserName(user.getUserName());
				if(userDao.getUserCheck(uCons) >= 1){
					request.setAttribute("msg", "用户名重复!");
					session.setAttribute("user", user);
					return "register";
				}else{
					userDao.addUser(user);
					session.setAttribute("userName", user.getUserName());
					session.setAttribute("userId", user.getUserId());
					return "forward:/switch/toIdex";
				}
			}else{
				request.setAttribute("msg", "注册失败!");
				return "register";
			}
		}
		
		@RequestMapping(value="/getUserInfoById", method = RequestMethod.GET)
		public String getUserInfoById(HttpServletRequest request){
			HttpSession session = request.getSession();
			String userId = request.getParameter("userId");
			if(userId != null){
				User user = new User();
				user.setUserId(userId);
				User userResult = userDao.getUserInfo(user);
				session.setAttribute("user", userResult);
				session.setAttribute("userName", userResult.getUserName());
				session.setAttribute("userId", userResult.getUserId());
				return "forward:/switch/selectUserOrderAndLike";
			}else{
				request.setAttribute("msg", "登录超时!");
				return "login";
			}
		}
		@RequestMapping(value="/updateUser", method = RequestMethod.POST)
		public @ResponseBody String updateUser(HttpServletRequest request,HttpServletResponse response,User user){
			if(user.getUserId() != null){
				User uCons = new User();
				uCons.setUserName(user.getUserName());
				uCons.setUserId(user.getUserId());
				if(userDao.getUserCheck(uCons) >= 1){
					return "warn";
				}else{
					Date date = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					user.setUserDate(sdf.format(date));
					userDao.updateUser(user);
				}
				return "success";
			}else{
				return "error";
			}
			
		}
		@RequestMapping(value="/getUserInfoByIdAdmin", method = RequestMethod.GET)
		public String getUserInfoByIdAdmin(HttpServletRequest request){
			HttpSession session = request.getSession();
			String userId = request.getParameter("userId");
			if(userId != null){
				User user = new User();
				user.setUserId(userId);
				User userResult = userDao.getUserInfo(user);
				session.setAttribute("user", userResult);
				return "AdminUserEdit";
			}else{
				request.setAttribute("msg", "登录超时!");
				return "loginAdmin";
			}
		}
		@RequestMapping(value = "/getAllUser", method = RequestMethod.GET) 
		public @ResponseBody Page getAllUser(HttpServletRequest request){
			Page page = new Page();
			List<User> uList = userDao.getAllUser();
		    page.setData(uList);
		    return page;
		}
		
		@RequestMapping(value="/deleteUser", method = RequestMethod.POST)
		public @ResponseBody String deleteUserInfoById(@RequestParam("userId")String userId){
			if(userId != null){
				User user = new User();
				user.setUserId(userId);
				userDao.deleteUser(user);;
				return "success";
			}else{
				return "error";
			}
		}
		@RequestMapping(value="/addUser", method = RequestMethod.POST)
		public @ResponseBody String addUser(HttpServletRequest request,HttpServletResponse response,User user){
			if(user != null){
				User uCons = new User();
				uCons.setUserName(user.getUserName());
				uCons.setUserId(user.getUserId());
				if(userDao.getUserCheck(uCons) >= 1){
					return "warn";
				}else{
					//设置id
					String userIdStr = UUID.randomUUID().toString();
					user.setUserId(userIdStr);
					//默认未禁用
					user.setIsDelete("0");
					//设置当前注册时间
					Date date = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					user.setUserDate(sdf.format(date));
					userDao.addUser(user);
				}
				return "success";
			}else{
				return "error";
			}
		}
}
