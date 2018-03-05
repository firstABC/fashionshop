package chen.mingyu.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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

import chen.mingyu.dao.AdminDao;
import chen.mingyu.domain.ConsultVO;
import chen.mingyu.domain.Admin;



@Controller
public class AdminController{
		
		private static Logger logger = Logger.getLogger(AdminController.class);
		
		@Autowired
		private AdminDao adminDao;
		
		//private Admin admin;
		
		@RequestMapping(value = "/loginAdmin", method = RequestMethod.GET) 

		public String login(HttpServletRequest request,HttpServletResponse response,  
		@RequestParam("adminName")String adminName, @RequestParam("adminPwd")String adminPwd, 
		Model model) throws Exception { 
			HttpSession session = request.getSession();
			Admin admin = new Admin(adminName,adminPwd);
			admin.setIsDelete("0");
			Admin loginAdmin = adminDao.getLoginAdmin(admin);
			if(loginAdmin != null){
				 model.addAttribute("loginAdmin", loginAdmin); 
				 session.setAttribute("adminId", loginAdmin.getAdminId());
				 session.setAttribute("adminName", adminName);
			     return "AdminProduct";
			}
			else{
				request.setAttribute("msg", "登录失败");
				return "loginAdmin";
			}
		}
		@RequestMapping(value = "/outAdmin", method = RequestMethod.GET)
		public String out(HttpServletRequest request) throws Exception{
			HttpSession session = request.getSession();
			session.invalidate();
			return "loginAdmin";
		}
}
