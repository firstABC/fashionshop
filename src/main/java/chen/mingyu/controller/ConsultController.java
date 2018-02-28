package chen.mingyu.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import chen.mingyu.dao.ConsultDao;
import chen.mingyu.domain.ConsultVO;



@Controller
public class ConsultController{
		
		private static Logger logger = Logger.getLogger(UserController.class);
		
		@Autowired
		private ConsultDao consultVODao;
		
		@RequestMapping(value = "/getConsultByUser/{userId}", method = RequestMethod.GET) 
		public @ResponseBody List<ConsultVO> getConsultByUser(@PathVariable(value = "userId") String userId){
			ConsultVO consultVOVO = new ConsultVO();
			consultVOVO.setUserId(userId);
			List<ConsultVO> cList = consultVODao.getConsultList(consultVOVO);
			return cList; 
		}
		@RequestMapping(value = "/addConsult", method = RequestMethod.POST) 
		public @ResponseBody String addConsult(@RequestBody ConsultVO consultVO){
			if(consultVO != null){
				//设置id
				Integer consultVOId = consultVODao.countConsultMaxId()+1;
				String consultVOIdStr = consultVOId.toString();
				consultVO.setConsultId(consultVOIdStr);
				//默认未禁用
				consultVO.setIsDelete("0");
				//设置评论时间
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				consultVO.setConsultDate(sdf.format(date));
				consultVODao.addConsult(consultVO);
				return null;
			}else{
				return null;
			}
		}
		@RequestMapping(value = "/addReply", method = RequestMethod.POST) 
		public @ResponseBody String addReply(@RequestBody ConsultVO consultVO){
			if(consultVO != null){
				//设置回复时间
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				consultVO.setReplyDate(sdf.format(date));
				consultVODao.addReply(consultVO);
				return null;
			}else{
				return null;
			}
		}
}
