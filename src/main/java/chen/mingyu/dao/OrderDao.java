package chen.mingyu.dao;

import java.util.List;

import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Repository;

import chen.mingyu.domain.Orders;
@Repository("orderDao")
public interface OrderDao {
	
	//��������
	public int insertOrder(Order order);
	//���ݶ���id��ɾ������
	public int deleteOrderById(String or_id);
	//���ݲ�ѯ��������ѯ����
	public List<Orders> selectOrdersAll(Orders orders);
	
}
