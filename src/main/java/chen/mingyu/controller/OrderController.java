package chen.mingyu.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chen.mingyu.dao.GoodsDao;
import chen.mingyu.dao.OrderDao;
import chen.mingyu.domain.Goods;
import chen.mingyu.domain.Orders;

public class OrderController {
	
	@Resource
	private OrderDao orderDao;
	@Resource
	private GoodsDao goodsDao;
	
	@RequestMapping("/toOrder")
	@ResponseBody
	public Map<String,String> toOrder(HttpServletRequest request,HttpSession session){
		String userId = (String) session.getAttribute("userId");
		if(userId!=null){
			String g_id = request.getParameter("g_id");
			int or_number = Integer.parseInt(request.getParameter("or_number"));
			Double or_price  = Double.parseDouble(request.getParameter("or_price"));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String or_date = sdf.format(new Date());
			
			Orders order = new Orders(UUID.randomUUID().toString(),g_id,userId,or_number,or_date,or_price,"A");
			orderDao.insertOrder(order);
		}
		return null;
	}
	
	@RequestMapping("/selectUserOrder")
	@ResponseBody 
	public List<Goods> selectOrdersByUserId(HttpServletRequest request,HttpSession session,@RequestParam("userId")String userId){
		Orders orders = new Orders();
		orders.setUserId(userId);
		List<Orders> ltOrders = orderDao.selectOrdersAll(orders);
		if(ltOrders!=null){
			for(Orders order : ltOrders){
				String g_id = order.getG_id();
				Goods goods = goodsDao.selectByG_id(g_id);
			}
		}
		return null;
	}
}
