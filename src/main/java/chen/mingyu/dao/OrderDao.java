package chen.mingyu.dao;

import java.util.List;

import org.springframework.core.annotation.Order;

import chen.mingyu.domain.Orders;

public interface OrderDao {
	
	//新增订单
	public int insertOrder(Order order);
	//根据订单id来删除订单
	public int deleteOrderById(String or_id);
	//根据查询条件来查询订单
	public List<Orders> selectOrdersAll(Orders orders);
	
}
