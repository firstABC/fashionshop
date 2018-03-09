package chen.mingyu.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import chen.mingyu.domain.News;
@Repository("newsDao")
public interface NewsDao {
	//发布消息
	public int insertNews(News news);
	
	//查询所有消息
	public List<News> selectNewsAll(News news);
	
	//删除新闻
	public int deleteNews(String n_id);
	
	//查询新闻详情
	public News selectByN_id(String n_id);
	
	
	//根据阅读数量展示首页信息
	public List<News> selectFiveByNum();
}
