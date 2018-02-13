package chen.mingyu.dao;

import java.util.List;

import chen.mingyu.domain.Goods;

public interface GoodsDao {

	public int insertGoods(Goods goods);
	
	//根据浏览次数查询所有商品
	public List<Goods> selectGoodsAllByNumber();
	
}
