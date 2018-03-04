package chen.mingyu.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import chen.mingyu.dao.ImagesDao;
import chen.mingyu.dao.NewsDao;
import chen.mingyu.domain.Images;
import chen.mingyu.domain.News;

@Controller
public class NewsController {

	@Resource
	private NewsDao newsDao;
	
	@Resource
	private ImagesDao imagesDao;
	
	@RequestMapping("/pnews")
	@ResponseBody
	public Map<String,String> publicNews(MultipartFile[] file,HttpServletRequest request,HttpSession session) throws IllegalStateException, IOException{
		String userId = (String) session.getAttribute("userId");
		int publicnews = 0;
		int inMages =0;
		if(userId!=null){
			String n_title = (String)request.getParameter("n_title");
			String n_detal = (String)request.getParameter("n_detal");
			String n_author= request.getParameter("n_author");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String n_dateTime = sdf.format(new Date());
			String n_id = UUID.randomUUID().toString();
			News news = new News(n_id,n_title,n_detal,n_author,1,n_dateTime);
			publicnews = newsDao.insertNews(news);
			
			String path = request.getServletContext().getRealPath("/upload");
			if(file!=null&&file.length>0){
				for(int i =0;i<file.length;i++){
					MultipartFile file1 = file[i];
					String name = System.currentTimeMillis()+file1.getOriginalFilename();
					file1.transferTo(new File(path,name));
					
					Images images = new Images();
					images.setGo_id(null);
					images.setIm_id(UUID.randomUUID().toString());
					images.setN_id(n_id);
					images.setPathName(path+"\\"+name);
					inMages = imagesDao.insertImage(images);	
				}		
			}
		}
		Map<String,String> map = new ConcurrentHashMap<String,String>();
		if(publicnews!=0||inMages!=0){
			map.put("message", "success");
		}else{
			map.put("message", "error");
		}
		return map;
	}
	
	@RequestMapping("/toNewsMange")
	public String selectAllNews(HttpServletRequest request,HttpSession session){
		List<News> ltNews = newsDao.selectNewsAll(null);
		if(ltNews!=null){
			session.setAttribute("ltNews", ltNews);
		}
		return "newsMange";
	}
	
	@RequestMapping("/deleteNews")
	@ResponseBody
	public Map deleteNews(HttpServletRequest request,HttpSession session,@RequestParam("n_id")String n_id){
		int isOk = newsDao.deleteNews(n_id);
		Map map = new HashMap();
		if(isOk!=0){
			map.put("message", "success");
		}else{
			map.put("message", "error");
		}
		return map;
	}
	
	@RequestMapping("/newsInfo")
	public String selectNewsInfo(HttpServletRequest request,HttpSession session,@RequestParam("n_id")String n_id){
		News news = newsDao.selectByN_id(n_id);
		if(news!=null){
			session.setAttribute("news", news);
		}
		return "newsInfo";
	}
	
}
