package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Bar;
import entity.User;
import service.UserService;

@RequestMapping(value = "/user")
@Controller
public class UserController {
	private static Log log = LogFactory.getLog(Controller.class);

	@Autowired
	private UserService userService;

	// 登录入口
	@RequestMapping(value = "/login")
	public String login() {
		log.info("欢迎进入登录页面");
		return "login";
	}

	// 鐧诲綍鎿嶄綔
	@ResponseBody // 瑙ｆ瀽鍑簀son
	@RequestMapping(value = "/login.action")
	public Object Login(String user_name, String user_pwd, HttpServletRequest request) {
		HttpSession session = request.getSession(); // 鑾峰彇session瀵硅薄
		HashMap<String, Object> json = new HashMap<>();
		User us = userService.SelectUserByUserNameAndUserPwd(user_name, user_pwd); // 璋冪敤鏌ヨ鐢ㄦ埛鏂规硶
		String log_name = (String) session.getAttribute("log_name"); // 鑾峰彇鐧诲綍瀛樺叆session鐨勭敤鎴峰悕鐢ㄤ簬鐧诲綍楠岃瘉
		if (log_name == null) { // 褰撶敤鎴峰悕涓虹┖鏃惰繘琛屼笅闈㈠垽鏂�
			if (us != null) { // 褰搖ser瀵硅薄涓嶄负绌鸿瘉鏄庢煡璇㈠埌鏁版嵁搴撴湁杩欎釜鐢ㄦ埛鍜屽瘑鐮佸瓧娈�
				if (us.getWeight() == 2) {
					json.put("weight", 2); // 褰撶敤鎴锋潈閲嶄负2璺宠浆鐢ㄦ埛鍓嶇椤甸潰
				} else {
					json.put("weight", 1);// 褰撶敤鎴锋潈閲嶄负1璺宠浆绠＄悊鍛橀〉闈�
				}
				session.setAttribute("us", us); // 鏈�鍚庡皢鐢ㄦ埛瀵硅薄瀛樺叆session
				session.setAttribute("log_name", us.getUser_name());
			} else {
				json.put("message", "error");
			}
		} else {
			json.put("message", "repeat");
		}
		return json;
	}

	// 璺宠浆娉ㄥ唽鐣岄潰
	@RequestMapping(value = "/register")
	public String Register() {
		return "register";
	}

	// 注册操作
	@ResponseBody // 解析json
	@RequestMapping(value = "/register.action")
	public Object Register(String user_name, String user_pwd, String imageurl) {
		HashMap<String, Object> json = new HashMap<>();
		log.info(user_name+"======"+user_pwd+"========"+imageurl);
		if ("".equals(user_name) || user_name == null || "".equals(user_pwd) || user_pwd == null || "".equals(imageurl)
				|| imageurl == null) {
			json.put("message", "error");
		} else {
			User us = userService.SelectUserByUserName(user_name);
			if(us == null) {
				userService.AddUser(user_name, user_pwd, imageurl);
				json.put("message", "ok");
			}else {
				json.put("message", "repeat");
			}
		}
		return json;
	}

	//跳转主页面
	@RequestMapping(value = "/homePage")
	public String Jump(Model model) {
		List<Bar> BarList = userService.SelectBarList();
		model.addAttribute("BarList", BarList);
		return "homePage";
	}
	//用户权重为1跳转管理员页面
	@RequestMapping(value = "/administrators") 
	public String administrators() {
		return "admin";
	}
	//非法登录跳转
	@RequestMapping(value = "/notLogin")
	public String Error(HttpServletRequest request) {
		List<Bar> BarList = userService.SelectBarList();
		request.setAttribute("BarList", BarList);
		return "error";
	}
	//退出用户
	@ResponseBody // 解析json
	@RequestMapping(value = "/loginOut")
	public String loginOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String logname = (String) session.getAttribute("log_name");
		session.invalidate();
		log.info("用户" + logname + "退出成功");
		return "OK";
	}
}
