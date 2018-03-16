package chen.mingyu.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import chen.mingyu.domain.Goods;
@Repository("goodsDao")
public interface GoodsDao {

	public int insertGoods(Goods goods);
	
	
	public List<Goods> selectGoodsAllByNumber();
	
	//查询所有商品
	public List<Goods> selectGoodsAll();
	
	//根据性别查询商品
	public List<Goods> selectGoodsBySex(int g_sex);

	//根据状态查询商品详情
	public List<Goods> selectGoodsByStatus(String g_status);
	
	//根据类别查询商品 鞋类还是服装
	public List<Goods> selectGoodsByType(String g_type);
	
	//根据品牌或者商品名
	public List<Goods> selectGoodsByCondition(String condition);
	
	public int alterLike(Goods goods);
	
	public int deleteGoods(String g_id);
	
	//重新编辑商品
	public int editGoods(Goods goods);
	
	//查询商品详情
	public Goods selectByG_id(String g_id);
	
}
