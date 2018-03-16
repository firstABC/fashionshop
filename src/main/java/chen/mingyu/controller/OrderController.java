package chen.mingyu.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
import chen.mingyu.dao.OrderDao;
import chen.mingyu.domain.Goods;
import chen.mingyu.domain.Orders;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Resource
	private OrderDao orderDao;
	@Resource
	private GoodsDao goodsDao;
	
	@RequestMapping("/toOrder")
	@ResponseBody
	@Transactional
	public Map<String,String> toOrder(HttpServletRequest request,HttpSession session){
		String userId = (String) session.getAttribute("userId");
		Map map = new HashMap();
		if(userId!=null){
			String g_id = request.getParameter("g_id");
			int or_number = Integer.parseInt(request.getParameter("or_number"));
			Double or_price  = Double.parseDouble(request.getParameter("or_price"));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String or_date = sdf.format(new Date());
			
			Orders order = new Orders(UUID.randomUUID().toString(),g_id,userId,or_number,or_date,or_price,"A");
			int isOk = orderDao.insertOrder(order);
			if(isOk>0){
				map.put("message", "success");
			}else{
				map.put("message", "faile");
			}
		}
		
		return map;
	}
	
	@RequestMapping("/selectUserOrder")
	@ResponseBody 
	public List<Goods> selectOrdersByUserId(HttpServletRequest request,HttpSession session,@RequestParam("userId")String userId){
		Orders orders = new Orders();
		orders.setUserId(userId);
		List<Orders> ltOrders = orderDao.selectOrdersAll(orders);
		List<Goods> ltgoods = new ArrayList<Goods>();
		if(ltOrders!=null){
			for(Orders order : ltOrders){
				String g_id = order.getG_id();
				Goods goods = goodsDao.selectByG_id(g_id);
				ltgoods.add(goods);
			}
		}
		return ltgoods;
	}
}
