package chen.mingyu.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import chen.mingyu.dao.GoodsDao;
import chen.mingyu.domain.Goods;

@Controller
@RequestMapping("/switch")
public class SwitchController {
	
	@Resource
	private GoodsDao goodsDao;
	
	@RequestMapping("/toIdex")
	public String toIndex(HttpServletRequest request,HttpSession session){
		
		List<Goods> ltgoods = goodsDao.selectGoodsAllByNumber();
		if(ltgoods!=null){
			session.setAttribute("ltgoods", ltgoods);
		}
		return "index";
	}
}
