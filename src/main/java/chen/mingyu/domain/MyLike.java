package chen.mingyu.domain;

public class MyLike {
	
	private String ml_id;
	private String g_id;
	//用户id
	private String userId;
	public String getMl_id() {
		return ml_id;
	}
	public void setMl_id(String ml_id) {
		this.ml_id = ml_id;
	}
	public String getG_id() {
		return g_id;
	}
	public void setG_id(String g_id) {
		this.g_id = g_id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public MyLike(String ml_id, String g_id, String userId) {
		super();
		this.ml_id = ml_id;
		this.g_id = g_id;
		this.userId = userId;
	}
	public MyLike() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
