package chen.mingyu.domain;

import java.util.Date;
import java.util.List;

public class News {

 private String n_id;
 //新闻标题
 private String n_title;
 //新闻详情
 private String n_detal;
 //新闻作者
 private String n_author;
 //阅读数
 private int n_number;
 //发布时间
 private String n_dateTime;
 //图片
 private List<Images> ltMage;
	public String getN_id() {
		return n_id;
	}
	public void setN_id(String n_id) {
		this.n_id = n_id;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_detal() {
		return n_detal;
	}
	public void setN_detal(String n_detal) {
		this.n_detal = n_detal;
	}
	public String getN_author() {
		return n_author;
	}
	public void setN_author(String n_author) {
		this.n_author = n_author;
	}
	public int getN_number() {
		return n_number;
	}
	public void setN_number(int n_number) {
		this.n_number = n_number;
	}
	public String getN_dateTime() {
		return n_dateTime;
	}
	public void setN_dateTime(String n_dateTime) {
		this.n_dateTime = n_dateTime;
	}
	public List<Images> getLtMage() {
		return ltMage;
	}
	public void setLtMage(List<Images> ltMage) {
		this.ltMage = ltMage;
	}
	public News(String n_id, String n_title, String n_detal, String n_author, int n_number, String n_dateTime) {
		super();
		this.n_id = n_id;
		this.n_title = n_title;
		this.n_detal = n_detal;
		this.n_author = n_author;
		this.n_number = n_number;
		this.n_dateTime = n_dateTime;
	}
	public News() {
		super();
	}
 
 
 
 
 
}
