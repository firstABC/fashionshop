package chen.mingyu.dao;

import org.springframework.stereotype.Repository;

import chen.mingyu.domain.Images;
@Repository("imagesDao")
public interface ImagesDao {

	//添加图片
	public int insertImage(Images iamges);
}
