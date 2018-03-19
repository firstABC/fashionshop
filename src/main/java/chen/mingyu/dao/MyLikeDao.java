package chen.mingyu.dao;


import java.util.List;

import chen.mingyu.domain.MyLike;

public interface MyLikeDao {

	//添加喜欢
	public int insertMyLike(MyLike myLike);
	
	//查询一个物品只能喜欢一次
	public MyLike selectByUserIdAndGid(MyLike myLike);
	
	//查询用户所有喜欢的东西
	public List<MyLike> selectByUserId(String userId);
}
