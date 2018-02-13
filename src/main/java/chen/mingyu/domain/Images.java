package chen.mingyu.domain;

import java.sql.Blob;

public class Images {
	private String im_id;
	//文件路径
	private String pathName;
	//新闻id
	private String n_id;
	//商品id
	private String go_id;
	public String getIm_id() {
		return im_id;
	}
	public void setIm_id(String im_id) {
		this.im_id = im_id;
	}
	public String getPathName() {
		return pathName;
	}
	public void setPathName(String pathName) {
		this.pathName = pathName;
	}
	public String getN_id() {
		return n_id;
	}
	public void setN_id(String n_id) {
		this.n_id = n_id;
	}
	public String getGo_id() {
		return go_id;
	}
	public void setGo_id(String go_id) {
		this.go_id = go_id;
	}
	
	
	
}
