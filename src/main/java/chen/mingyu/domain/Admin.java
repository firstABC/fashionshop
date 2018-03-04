package chen.mingyu.domain;

public class Admin {
	private String adminId;	//ID
	private String adminName;	//管理员账号
	private String adminPwd;	//管理员密码
	private String isDelete;	//是否删除
	
	public Admin() {
		super();
	}
	public Admin(String adminName, String adminPwd) {
		super();
		this.adminName = adminName;
		this.adminPwd = adminPwd;
	}
	public Admin(String adminId,String adminName, String adminPwd) {
		super();
		this.adminId = adminId;
		this.adminName = adminName;
		this.adminPwd = adminPwd;
	}
	//全部属性构造方法
	public Admin(String adminId, String adminName, String adminPwd,
			String isDelete) {
		super();
		this.adminId = adminId;
		this.adminName = adminName;
		this.adminPwd = adminPwd;
		this.isDelete = isDelete;
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
	public String getAdminPwd() {
		return adminPwd;
	}
	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}
	public String getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
}
