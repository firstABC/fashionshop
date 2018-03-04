package chen.mingyu.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import chen.mingyu.domain.Orders;
@Repository("orderDao")
public interface OrderDao {
	
	//添加订单
	public int insertOrder(Orders order);
	//根据id删除订单
	public int deleteOrderById(String or_id);
	//根据条件查询所有订单
	public List<Orders> selectOrdersAll(Orders orders);
	
}
