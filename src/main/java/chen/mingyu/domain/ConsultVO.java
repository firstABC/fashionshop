package chen.mingyu.domain;

public class ConsultVO {
	private String consultId;		//评论Id
	private String userId;			//评论用户的Id
	private String userName;		//用户名
	private String adminId;		//回答问题的管理员Id
	private String adminName;		//管理员名
	private String goodsId;		//所评论商品的Id
	private String goodsName;		//商品名称
	private String consultMsg;	//评论
	private String replyMsg;	//回复
	private String consultDate;		//评论时间
	private String replyDate;		//回复时间
	private String isDelete;		//是否删除
	
	public ConsultVO() {
		super();
	}

	public String getConsultId() {
		return consultId;
	}
	public void setConsultId(String consultId) {
		this.consultId = consultId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
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
	
	
	
	
}
