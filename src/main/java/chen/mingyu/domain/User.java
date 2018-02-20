package chen.mingyu.domain;


public class User {
	private Integer userId;		//用户ID
	private String userName;	//账号
	private String userPwd;		//用户密码
	private String userEmail;	//用户邮箱
	private String userPhone;	//用户电话
	private String  userDate;	//注册时间
	private String isDelete;	//是否删除
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public User(String userName, String userPwd) {
		super();
		this.userName = userName;
		this.userPwd = userPwd;
	}

	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserDate() {
		return userDate;
	}
	public void setUserDate(String userDate) {
		this.userDate = userDate;
	}
	public String getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
	
}
