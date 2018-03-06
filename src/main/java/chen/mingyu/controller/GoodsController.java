package chen.mingyu.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import chen.mingyu.dao.GoodsDao;
import chen.mingyu.dao.ImagesDao;
import chen.mingyu.dao.MyLikeDao;
import chen.mingyu.domain.Goods;
import chen.mingyu.domain.Images;
import chen.mingyu.domain.MyLike;

@Controller
@RequestMapping("goods")             
public class GoodsController {

	@Resource
	private GoodsDao goodsDao;
	@Resource
	private MyLikeDao myLikeDao;
	@Resource
	private ImagesDao imagesDao;
	
	@RequestMapping("/addLike")
	public String toAddLike(HttpServletRequest request,HttpSession session,@RequestParam("g_id")String g_id){
		Boolean isLogin = session.getAttribute("userId")==null?false:true;
		if(isLogin){
			Goods goods = new Goods();
			goods.setG_id(g_id);
			int isOk = goodsDao.alterLike(goods);
			
			MyLike myLike = new MyLike();
			myLike.setG_id(g_id);
			myLike.setUserId((String) session.getAttribute("userId"));
			myLike.setMl_id(UUID.randomUUID().toString());
			int isOk2 = myLikeDao.insertMyLike(myLike);
		}
		return null;
	}
	
	@RequestMapping("/selGoHo")
	public String selectGoodsOfHot(HttpServletRequest request,HttpSession session){
		
		List<Goods> ltGoods = goodsDao.selectGoodsAllByNumber();
		if(ltGoods!=null){
			session.setAttribute("ltGoods", ltGoods);
		}
		return "/index";
	}
	
	@RequestMapping("/selGoSex")
	public String selectGoodsBySex(HttpServletRequest request,HttpSession session,@RequestParam("g_sex")int g_sex){
		List<Goods> ltGoods = goodsDao.selectGoodsBySex(g_sex);
		if(ltGoods!=null){
			session.setAttribute("ltGoods", ltGoods);
		}
		return "/index";
	}
	
	//发布商品
	@Transactional
	@RequestMapping("/toPublish")
	@ResponseBody
	public Map<String,String> publishGoods(MultipartFile[] file,HttpServletRequest request,HttpSession session) throws IllegalStateException, IOException{
		String g_title = request.getParameter("g_title");
		String g_detail = request.getParameter("g_detail");
		String g_price = request.getParameter("g_price");
		String g_brand = request.getParameter("g_brand");
		int g_inventory = Integer.parseInt(request.getParameter("g_inventory"));
		int g_like = Integer.parseInt(request.getParameter("g_like"));
		int g_sex = Integer.parseInt(request.getParameter("g_sex"));
		String g_status = request.getParameter("g_status");
		String g_id = UUID.randomUUID().toString();
		Goods goods = new Goods(g_id,g_title,g_detail,g_price,g_brand,g_inventory,g_like,g_status,g_sex);
		
		int ispubGo = goodsDao.insertGoods(goods);
		int inMages = 0;
		
		String path = request.getServletContext().getRealPath("/upload");
		if(file!=null&&file.length>0){
			for(int i =0;i<file.length;i++){
				MultipartFile file1 = file[i];
				boolean b = file1.isEmpty();
				String name = System.currentTimeMillis()+file1.getOriginalFilename();
				file1.transferTo(new File(path,name));
				
				Images images = new Images();
				images.setG_id(g_id);;
				images.setIm_id(UUID.randomUUID().toString());
				images.setN_id(null);
				images.setPathName(path+"\\"+name);
				inMages = imagesDao.insertImage(images);	
			}		
		}
		Map<String,String> map = new ConcurrentHashMap<String,String>();
		if(ispubGo!=0||inMages!=0){
			map.put("message", "success");
		}else{
			map.put("message", "error");
		}
		return map;
	}
	
	@RequestMapping("/toEdit")
	@ResponseBody
	public Map editGoods(HttpServletRequest request,HttpSession session){
		String g_title = request.getParameter("g_title");
		String g_detail = request.getParameter("g_detail");
		String g_price = request.getParameter("g_price");
		String g_brand = request.getParameter("g_brand");
		String g_id = request.getParameter("g_id");
		int g_inventory = Integer.parseInt(request.getParameter("g_inventory"));
		int g_sex = Integer.parseInt(request.getParameter("g_sex"));
		String g_status = request.getParameter("g_status");
		Goods goods = new Goods(g_id,g_title,g_detail,g_price,g_brand,g_inventory,1,g_status,g_sex);
		int isOk = goodsDao.editGoods(goods);
		Map map = new HashMap();
		if(isOk!=0){
			map.put("message", "success");
		}else{
			map.put("message", "error");
		}
		return map;
	}
	
	@RequestMapping("/togoodsMange")
	public String selectGoodsAll(HttpServletRequest request,HttpSession session){
		List<Goods> ltGoods= goodsDao.selectGoodsAll();
		if(ltGoods!=null){
			//session.setAttribute("ltGoods", ltGoods);
		}
		return "goodsMange";
	}
	
	@RequestMapping("/toGInfo")
	public String selectGoodsInfo(HttpServletRequest request,HttpSession session,@RequestParam("g_id") String g_id){
		Goods goods= goodsDao.selectByG_id(g_id);
		if(goods!=null){
			session.setAttribute("goods", goods);
		}
		return "goodsInfo";
	}
	
}