package chen.mingyu.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import chen.mingyu.dao.GoodsDao;
import chen.mingyu.dao.NewsDao;
import chen.mingyu.domain.Goods;
import chen.mingyu.domain.News;

@Controller
@RequestMapping("/switch")
public class SwitchController {
	
	@Resource
	private GoodsDao goodsDao;
	@Resource
	private NewsDao newsDao;
	
	@RequestMapping("/toIdex")
	public String toIndex(HttpServletRequest request,HttpSession session){
		
		List<Goods> ltgoodsM = goodsDao.selectGoodsBySex(0);//0 男  1 女
		List<Goods> ltgoodsW = goodsDao.selectGoodsBySex(1);//0 男  1 女
		List<Goods> ltgoodsN = goodsDao.selectGoodsByStatus("C");// C 新品预定
		List<News>  ltNews = newsDao.selectFiveByNum(); //新闻
	//	newsDao
		if(ltgoodsM!=null){
			session.setAttribute("ltgoodsM", ltgoodsM);
		}
		if(ltgoodsW!=null){
			session.setAttribute("ltgoodsW", ltgoodsW);
		}
		if(ltgoodsN!=null){
			session.setAttribute("ltgoodsN", ltgoodsN);
		}
		if(ltNews!=null){
			session.setAttribute("ltNews", ltNews);
		}
		return "index";
	}
}
