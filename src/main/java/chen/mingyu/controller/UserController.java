package chen.mingyu.controller;

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

import chen.mingyu.domain.User;
import chen.mingyu.service.UserService;



@Controller
public class UserController{
		
		private static Logger logger = Logger.getLogger(UserController.class);
	
		@Autowired
		private UserService userService;
		
		private User user;
		
		@RequestMapping(value = "/login", method = RequestMethod.GET) 

		public String myMethod(HttpServletRequest request,HttpServletResponse response,  
		@RequestParam("userName")String userName, @RequestParam("userPwd")String userPwd, 
		Model model) throws Exception { 
			HttpSession session = request.getSession();
			User user = new User(userName,userPwd);
			user.setIsDelete("0");
			User loginUser = userService.getLoginUser(user);
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
				user = userService.addUser(user);
				session.setAttribute("userName", user.getUserName());
				session.setAttribute("userId", user.getUserId());
				return "index";
			}else{
				model.addAttribute("msg", "注册失败!");
				return "register";
			}
		}
		
		@RequestMapping("/getUserInfoById")
		public String getUserInfoById(HttpServletRequest request,@RequestParam("userId")int userId,Model model){
			HttpSession session = request.getSession();
			if(userId != 0){
				user = userService.getUserInfoById(userId);
				session.setAttribute("user", user);
				return "info";
			}else{
				model.addAttribute("msg", "登录超时!");
				return "login";
			}
		}
		@RequestMapping(value="/updateUser", method = RequestMethod.POST)
		public String updateUser(HttpServletRequest request,HttpServletResponse response,User user,Model model){
			HttpSession session = request.getSession();
			if(user.getUserId() != 0){
				userService.updateUser(user);
				session.setAttribute("user", user);
				return "info";
			}else{
				model.addAttribute("msg", "登录超时!");
				return "login";
			}
			
		}
		
}
