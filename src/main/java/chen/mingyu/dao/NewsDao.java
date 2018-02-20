package chen.mingyu.dao;

import java.util.List;

import chen.mingyu.domain.News;

public interface NewsDao {
	//发布资讯
	public int insertNews(News news);
	
	//根据法发布时间来倒序排列
	public List<News> selectNewsAll();
}
