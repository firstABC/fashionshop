package chen.mingyu.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import chen.mingyu.domain.News;
@Repository("newsDao")
public interface NewsDao {
	//������Ѷ
	public int insertNews(News news);
	
	//���ݷ�����ʱ������������
	public List<News> selectNewsAll();
}
