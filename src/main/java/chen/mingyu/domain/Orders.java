package chen.mingyu.domain;

import java.util.Date;

//订单
public class Orders {
	private String or_id;
	//商品id
	private String g_id;
	//购买数量
	private int or_number;
	//订单日期
	private Date or_date;
	
	public String getOr_id() {
		return or_id;
	}
	public void setOr_id(String or_id) {
		this.or_id = or_id;
	}
	public String getG_id() {
		return g_id;
	}
	public void setG_id(String g_id) {
		this.g_id = g_id;
	}
	public int getOr_number() {
		return or_number;
	}
	public void setOr_number(int or_number) {
		this.or_number = or_number;
	}
	public Date getOr_date() {
		return or_date;
	}
	public void setOr_date(Date or_date) {
		this.or_date = or_date;
	}
	
}
