package chen.mingyu.domain;

public class Consult {
	private String consultId;		//评论ID
	private User user;				//评论的用户			需要自己关联 
	private Admin admin;			//回复的管理员	需要自己关联
	private Goods goods;			//提问的商品ID
	private String consultMsg;	//评论
	private String replyMsg;	//回复
	private String consultDate;	//评论时间
	private String replyDate;		//回复时间
	private String isDelete;		//是否删除
	
	public Consult() {
		super();
	}
	public String getConsultId() {
		return consultId;
	}
	public void setConsultId(String consultId) {
		this.consultId = consultId;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public String getConsultMsg() {
		return consultMsg;
	}
	public void setConsultMsg(String consultMsg) {
		this.consultMsg = consultMsg;
	}
	public String getReplyMsg() {
		return replyMsg;
	}
	public void setReplyMsg(String replyMsg) {
		this.replyMsg = replyMsg;
	}
	public String getConsultDate() {
		return consultDate;
	}
	public void setConsultDate(String consultDate) {
		this.consultDate = consultDate;
	}
	public String getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}
	public String getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
}
