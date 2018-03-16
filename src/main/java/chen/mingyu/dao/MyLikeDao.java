package chen.mingyu.dao;

import chen.mingyu.domain.MyLike;

public interface MyLikeDao {

	//添加喜欢
	public int insertMyLike(MyLike myLike);
	
	//查询一个物品只能喜欢一次
	public MyLike selectByUserIdAndGid(MyLike myLike);
}
