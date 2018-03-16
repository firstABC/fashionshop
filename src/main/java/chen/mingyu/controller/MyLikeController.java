package chen.mingyu.controller;

import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chen.mingyu.dao.GoodsDao;
import chen.mingyu.dao.MyLikeDao;

@Controller
@RequestMapping("/myLike")
public class MyLikeController {

	@Resource
	private MyLikeDao myLikeDao;
	@Resource
	private GoodsDao goodsDao;
	
	
	@RequestMapping("/toAdd")
	@ResponseBody
	@Transactional
	public Map<String,String> insertMyLike(HttpServletRequest request,HttpSession session,@RequestParam("g_id")String g_id,@RequestParam("userId")String userId){
		String ml_id = UUID.randomUUID().toString();
		
		return null;
	}
}
