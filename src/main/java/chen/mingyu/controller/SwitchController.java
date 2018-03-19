package chen.mingyu.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import chen.mingyu.dao.GoodsDao;
import chen.mingyu.dao.MyLikeDao;
import chen.mingyu.dao.NewsDao;
import chen.mingyu.dao.OrderDao;
import chen.mingyu.domain.Goods;
import chen.mingyu.domain.MyLike;
import chen.mingyu.domain.News;
import chen.mingyu.domain.Orders;

@Controller
@RequestMapping("/switch")
public class SwitchController {
	
	@Resource
	private GoodsDao goodsDao;
	@Resource
	private NewsDao newsDao;
	
	@Resource
	private OrderDao orderDao;

	@Resource
	private MyLikeDao myLikeDao;
	
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
		return "/index";
	}
	
	@RequestMapping("/selectUserOrderAndLike")
	public String selectOrdersByUserId(HttpServletRequest request,HttpSession session,@RequestParam("userId")String userId){
		Orders orders = new Orders();
		orders.setUserId(userId);
		List<Orders> ltOrders = orderDao.selectOrdersAll(orders);
		List<Goods> ltgoodsOrder = new ArrayList<Goods>();
		if(ltOrders!=null){
			for(Orders order : ltOrders){
				String g_id = order.getG_id();
				Goods goods = goodsDao.selectByG_id(g_id);
				ltgoodsOrder.add(goods);
			}
		}
		
		List<MyLike> ltMylike = myLikeDao.selectByUserId(userId);
		List<Goods> ltgoodsMylike = new ArrayList<Goods>();
		if(ltMylike!=null){
			for(MyLike myLike : ltMylike){
				String g_id = myLike.getG_id();
				Goods goods = goodsDao.selectByG_id(g_id);
				ltgoodsMylike.add(goods);
			}
		}
		session.setAttribute("ltgoodsOrder", ltgoodsOrder);
		session.setAttribute("ltgoodsMylike", ltgoodsMylike);
		return "/info"; 
	}
}
