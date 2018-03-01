package chen.mingyu.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import chen.mingyu.domain.Goods;
@Repository("goodsDao")
public interface GoodsDao {

	public int insertGoods(Goods goods);
	
	
	public List<Goods> selectGoodsAllByNumber();
	
	//根据性别查询商品
	public List<Goods> selectGoodsBySex(int g_sex);
	
	
	public int alterLike(Goods goods);
	
	
	public int deleteGoods(String g_id);
	
}
