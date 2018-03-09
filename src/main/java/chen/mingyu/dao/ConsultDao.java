package chen.mingyu.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import chen.mingyu.domain.Consult;
import chen.mingyu.domain.ConsultVO;
import chen.mingyu.domain.Page;

@Repository("consultDao")
public interface ConsultDao {
	
	//查询用户评论
	public List<ConsultVO> getConsultList(Page page);
	
	//查询总数
	public int getConsultCount(Page page);
	
	//用户新增评论
	public void addConsult(ConsultVO consultVO);
	
	//管理员新增回复
	public void addReply(ConsultVO consultVO);
}
