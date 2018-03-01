package chen.mingyu.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import chen.mingyu.dao.GoodsDao;
import chen.mingyu.domain.Goods;

@Controller
public class GoodsController {

	@Resource
	private GoodsDao goodsDao;
	//给商品点赞
	@RequestMapping("/addLike")
	public String toAddLike(HttpServletRequest request,HttpSession session,@RequestParam("g_id")String g_id){
		Boolean isLogin = session.getAttribute("userId")==null?false:true;
		if(isLogin){
			Goods goods = new Goods();
			goods.setG_id(g_id);
			int isOk = goodsDao.alterLike(goods);
		}
		return null;
	}
	
	//热门推荐前六
	@RequestMapping("/selGoHo")
	public String selectGoodsOfHot(HttpServletRequest request,HttpSession session){
		
		List<Goods> ltGoods = goodsDao.selectGoodsAllByNumber();
		if(ltGoods!=null){
			session.setAttribute("ltGoods", ltGoods);
		}
		return "/index";
	}
	
	//根据性别分类查询商品
	@RequestMapping("/selGoSex")
	public String selectGoodsBySex(HttpServletRequest request,HttpSession session,@RequestParam("g_sex")int g_sex){
		List<Goods> ltGoods = goodsDao.selectGoodsBySex(g_sex);
		if(ltGoods!=null){
			session.setAttribute("ltGoods", ltGoods);
		}
		return "/index";
	}
	
}