package controller;

import java.util.HashMap;
import java.util.Map;

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
import entity.Comment;
import entity.MyPost;
import entity.QueryCdt;
import entity.User;
import paging.Page;
import service.AdminService;
import service.PostService;
import service.UserService;

@RequestMapping(value = "/admin")
@Controller
public class AdminController {
	private static Log log = LogFactory.getLog(Controller.class);
	@Autowired
	private UserService userService;
	@Autowired
	private PostService postService;
	@Autowired
	private AdminService adminService;

	/**
	 * 跳转用户管理页面分页显示所有数据
	 * 
	 * @param cdt
	 *            分页条件对象
	 * 
	 * @param model
	 *            request域
	 * 
	 * @return
	 */
	@RequestMapping(value = "/userAdmin")
	public String UserAdmin(QueryCdt cdt, Model model) {
		Page<User> page = adminService.SelectUserByQueryCdt(cdt);
		model.addAttribute("page", page);
		model.addAttribute("currentPage", page.getPage());
		model.addAttribute("totalNumber", page.getTotal());
		model.addAttribute("size", page.getSize());
		return "userAdmin";
	}

	/**
	 * 点击修改回显用户数据
	 * 
	 * @param user_id
	 *            用户id
	 * 
	 * @return
	 */
	@ResponseBody // 解析json字符串
	@RequestMapping(value = "/updateUser")
	public Object UpdateUser(int user_id) {
		Map<String, Object> json = new HashMap<>();
		User user = userService.SelectUserById(user_id);
		json.put("user", user);
		return json;
	}

	/**
	 * 修改用户信息操作
	 * 
	 * @param user_id
	 *            用户id
	 * 
	 * @param user_name
	 *            用户名
	 * 
	 * @param user_pwd
	 *            用户密码
	 * 
	 * @return
	 */
	@ResponseBody // 解析json字符串
	@RequestMapping(value = "/updateUser.action")
	public String UpdateUser(int user_id, String user_name, String user_pwd) {
		log.info(user_id + "***" + user_name + "**" + user_pwd);
		adminService.UpdateUserByUserId(user_id, user_name, user_pwd);
		return "OK";
	}

	/**
	 * 删除单个用户
	 * 
	 * @param user_id
	 *            用户id
	 * 
	 * @return
	 */
	@ResponseBody // 解析json字符串
	@RequestMapping(value = "/deleteUser")
	public String DeleteUser(int user_id) {
		adminService.DeleteUser(user_id);
		return "OK";
	}

	/**
	 * 跳转贴吧管理页面并且分页显示所有数据
	 * 
	 * @param cdt
	 *            分页条件对象
	 * 
	 * @param model
	 *            request域
	 * 
	 * @return
	 */
	@RequestMapping(value = "/postBarAdmin")
	public String PostBarAdmin(QueryCdt cdt, Model model) {
		Page<Bar> page = adminService.SelectBarByQueryCdt(cdt);
		model.addAttribute("page", page);
		model.addAttribute("currentPage", page.getPage());
		model.addAttribute("totalNumber", page.getTotal());
		model.addAttribute("size", page.getSize());
		return "postBarAdmin";
	}

	/**
	 * 点击修改回显贴吧数据
	 * 
	 * @param bar_id
	 *            贴吧id
	 * 
	 * @return
	 */
	@ResponseBody // 解析json字符串
	@RequestMapping(value = "/updatePostBar")
	public Object UpdatePostBar(int bar_id) {
		Map<String, Object> json = new HashMap<>();
		Bar bar = postService.SelectBar(bar_id);
		log.info("**************" + bar);
		json.put("bar", bar);
		return json;
	}

	/**
	 * 删除单个贴吧
	 * 
	 * @param bar_id
	 *            贴吧id
	 * @return
	 */
	@ResponseBody // 解析json字符串
	@RequestMapping(value = "/deletePostBar")
	public String DeletePostBar(int bar_id) {
		adminService.DeleteBar(bar_id);
		return "OK";
	}

	/**
	 * 跳转帖子管理页面并且分页显示所有数据
	 * 
	 * @param cdt
	 *            分页条件对象
	 * @param model
	 *            request域
	 * @return
	 */
	@RequestMapping(value = "/postAdmin")
	public String PostAdmin(QueryCdt cdt, Model model) {
		Page<MyPost> page = adminService.SelectMyPostByQueryCdt(cdt);
		model.addAttribute("page", page);
		model.addAttribute("currentPage", page.getPage());
		model.addAttribute("totalNumber", page.getTotal());
		model.addAttribute("size", page.getSize());
		return "postAdmin";
	}

	/**
	 * 删除单个帖子
	 * 
	 * @param post_id
	 *            帖子编号
	 * 
	 * @return
	 */
	@ResponseBody // 解析json字符串
	@RequestMapping(value = "/deletePost")
	public String DeletePost(int post_id) {
		adminService.DeleteMyPost(post_id);
		return "OK";
	}
	/**
	 * 跳转帖子回复管理页面并且分页显示所有数据
	 * @param cdt
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/repliesAdmin")
	public String RepliesAdmin(QueryCdt cdt, Model model) {
		Page<Comment> page = adminService.SelectCommentByQueryCdt(cdt);
		model.addAttribute("page", page);
		model.addAttribute("currentPage", page.getPage());
		model.addAttribute("totalNumber", page.getTotal());
		model.addAttribute("size", page.getSize());
		return "repliesAdmin";
	}
	/**
	 * 删除单个帖子回复
	 * @param comment_id
	 * @return
	 */
	@ResponseBody //解析json字符串
	@RequestMapping(value = "/deleteReplies")
	public String DeleteReplies(int comment_id) {
		adminService.DeleteReplies(comment_id);
		return "OK";
	}
	/**
	 * 退出系统
	 */
	@ResponseBody // 解析json字符串
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String logname = (String) session.getAttribute("log_name");
		session.invalidate();
		log.info("管理员" + logname + "退出成功！");
		return "OK";
	}
}
