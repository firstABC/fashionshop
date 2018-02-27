package chen.mingyu.dao;

import org.springframework.stereotype.Repository;

import chen.mingyu.domain.Images;
@Repository("imagesDao")
public interface ImagesDao {

	//���ͼƬ
	public int insertImage(Images iamges);
}
