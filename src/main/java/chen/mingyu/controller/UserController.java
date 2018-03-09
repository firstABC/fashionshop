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
			     return "index";
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
			return "index";
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
				if(userDao.getUserInfo(uCons) != null){
					request.setAttribute("msg", "用户名重复!");
					session.setAttribute("user", user);
					return "register";
				}else{
					userDao.addUser(user);
					session.setAttribute("userName", user.getUserName());
					session.setAttribute("userId", user.getUserId());
					return "index";
				}
			}else{
				request.setAttribute("msg", "注册失败!");
				return "register";
			}
		}
		
		@RequestMapping(value="/getUserInfoById", method = RequestMethod.GET)
		public String getUserInfoById(HttpServletRequest request,@RequestParam("userId")String userId){
			HttpSession session = request.getSession();
			if(userId != null){
				User user = new User();
				user.setUserId(userId);
				User userResult = userDao.getUserInfo(user);
				session.setAttribute("user", userResult);
				session.setAttribute("userName", userResult.getUserName());
				session.setAttribute("userId", userResult.getUserId());
				return "info";
			}else{
				request.setAttribute("msg", "登录超时!");
				return "login";
			}
		}
		@RequestMapping(value="/updateUser", method = RequestMethod.POST)
		public String updateUser(HttpServletRequest request,HttpServletResponse response,User user){
			HttpSession session = request.getSession();
			if(user.getUserId() != null){
				User uCons = new User();
				uCons.setUserName(user.getUserName());
				User uRes = userDao.getUserInfo(uCons);
				if(uRes != null&&uRes.getUserId() != user.getUserId()){
					request.setAttribute("msg", "用户名重复!");
					session.setAttribute("user", user);
				}else{
					Date date = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					user.setUserDate(sdf.format(date));
					userDao.updateUser(user);
				}
				return "info";
			}else{
				request.setAttribute("msg", "登录超时!");
				return "login";
			}
			
		}
		@RequestMapping("/getUserCheck")
		public String getUserCheck(HttpServletRequest request,
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
		@RequestMapping(value = "/getAllUser", method = RequestMethod.GET) 
		public @ResponseBody Page getAllUser(HttpServletRequest request){
			// 获取前端过来的参数,dataTable默认的，不要随便更改 
			String strStart = request.getParameter("start");
			String strLength = request.getParameter("length");
			String strDraw = request.getParameter("draw");
			Integer start = 0;
			Integer length = 10;
			Integer draw = 1;
			if(strStart != null&&strStart!=""
					&&strLength != null&&strLength != ""
					&&strDraw != null&&strDraw != ""){
			start = Integer.valueOf(strStart);// 起始  
			length = Integer.valueOf(strLength);// 每页显示的size 
			draw = Integer.valueOf(strDraw);//总页数
			}
		    Page page = new Page();
		    page.setStartIndex(start);
		    page.setLength(length);
			List<User> uList = userDao.getAllUser(page);
			
			int count = userDao.getUserCount();
			
			int iTotalRecords = count;	//总记录数
			int iTotalDisplayRecords = 0;	//展示的总记录数
			if(count%length > 0){
		    	iTotalDisplayRecords = length;
		    }else{
		    	iTotalDisplayRecords = count;
		    }
			if(count%length > 0){
				 draw = count/length + 1;
		    }else{
		    	draw = count/length;
		    } 
			//page.setDraw(draw);
			page.setiTotalRecords(iTotalRecords);;
	    	page.setiTotalDisplayRecords(iTotalDisplayRecords);
		    page.setRows(uList);
		    return page;
		}
}
