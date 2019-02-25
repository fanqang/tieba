package controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import entity.SonComment;
import entity.User;
import paging.Page;
import service.PostService;
import service.UserService;

@RequestMapping(value = "/post")
@Controller
public class PostController {
	private static Log log = LogFactory.getLog(Controller.class);
	@Autowired
	private PostService postService;
	@Autowired
	private UserService userService;

	/**
	 * 进入我的贴吧显示所有的数据
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/show")
	public String ShowMyBar(QueryCdt cdt, Model model, HttpServletRequest request,HttpServletResponse response) {
		Bar bar = postService.SelectBar(cdt.getBar_id());// 通过贴吧id查询贴吧信息
		Page<MyPost> page = postService.SelectMyPostByQueryCdt(cdt); // 设置分页对象
		log.info(page.getRows() + "**********************");
		model.addAttribute("bar", bar); // 将贴吧对象加入request域中
		model.addAttribute("page", page);// 将分页对象加入request域中
		model.addAttribute("currentPage", page.getPage());
		model.addAttribute("totalNumber", page.getTotal());
		return "myBar";
	}

	/**
	 * 用户点击帖子标题进入帖子详情页面
	 * 
	 * @param post_id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/showPost")
	public String ShowPost(int bar_id, int post_id, Model model) {
		Bar bar = postService.SelectBar(bar_id); // 根据页面传递过来的贴吧id查询贴吧对象
		MyPost myPost = postService.SelectMyPostByPostId(post_id); // 根据页面传递过来的post_id编号查询贴子对象
		User louzhu = userService.SelectUserById(myPost.getUser_id()); // 根据帖子对象的用户id查询到用户的名称
		List<Comment> commentList = postService.SelectCommentByPostIdList(post_id); // 根据帖子编号查询到回复信息的list集合
		List<Map<String, Object>> replyList = new ArrayList<>(); // 创建一个List<Map<String, Object>> 集合用于存储最后映射页面的数据
		List<Map<String, Object>> sonReplayList; // 声明一个子回复list集合
		Map<String, Object> maps = null; // 初始化map为空
		int i = 1; // 声明一个变量i，页面上回复的楼数就是通过此变量来判断
		int j = 0; // 声明一个变量j，页面上子回复的楼数就是通过此变量来判断
		log.info(commentList);
		for (Comment comment : commentList) { // 遍历回复list
			i++;
			maps = new HashMap<>(); // 创建一个map集合用于存储需要的数据
			sonReplayList = new ArrayList<>();// 创建一个子回复集合
			int user_id = comment.getUser_id(); // 获取用户id
			User user = userService.SelectUserById(user_id);// 通过用户id查询用户对象
			List<SonComment> sonCommentList = postService.SelectSonCommentByCommentId(comment.getComment_id());
			// 以下都是map进行添加最后映射页面需要的最终数据
			maps.put("user_name", user.getUser_name());
			maps.put("user_imageurl", user.getImageurl());
			maps.put("text_content", comment.getText_content());
			maps.put("comment_id", comment.getComment_id());
			maps.put("text_content_imageurl", comment.getImage_url());
			maps.put("time", comment.getTime());
			maps.put("i", i);
			maps.put("sonReplayList", sonReplayList);
			replyList.add(maps); // 最后将map添加进映射页面的replyList集合
			for (SonComment sonComment : sonCommentList) {
				j++;
				HashMap<String, Object> map = new HashMap<>();
				map.put("us", userService.SelectUserById(sonComment.getUser_id()));
				map.put("son_comment_content", sonComment.getSon_comment_content());
				map.put("son_comment_id", sonComment.getSon_comment_id());
				map.put("reply_id", sonComment.getReply_id());
				map.put("time", sonComment.getTime());
				map.put("j", j);
				sonReplayList.add(map);
			}
		}
		log.info(replyList);
		// 下面是将需要的数据添加进request域，不解释了
		model.addAttribute("bar", bar);
		model.addAttribute("louzhu", louzhu);
		model.addAttribute("mypost", myPost);
		model.addAttribute("replyList", replyList);
		return "showPost";
	}

	/**
	 * 添加子回复
	 * 
	 * @param son_comment_content
	 * @param comment_id
	 * @param post_id
	 * @param user_id
	 * @return
	 */
	@ResponseBody // 解析json字符串
	@RequestMapping(value = "/sonComment")
	public String AddSonComment(String son_comment_content, int comment_id, int bar_id, int post_id, int user_id,
			int reply_id) {
		postService.InsertSonComment(son_comment_content, comment_id, user_id, post_id, bar_id, reply_id, new Date());
		return "OK";
	}

	@ResponseBody // 解析json字符串
	@RequestMapping(value = "/deleteSonReplay")
	public Object DeleteSonReplay(String son_comment_id) {
		HashMap<String, Object> json = new HashMap<>();
		if ("".equals(son_comment_id) || son_comment_id == null) {
			json.put("message", "删除失败");
		} else {
			postService.DeleteSonCommentBySonCommenId(Integer.parseInt(son_comment_id));
			json.put("message", "删除成功");
		}
		return json;
	}

	/**
	 * 跳转修改用户头相页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/modifyUserImg")
	public String ModifyUser() {
		return "modifyUserImg";
	}

	/**
	 * 跳转我的帖子页面
	 */
	@RequestMapping(value = "/myPost")
	public String MyPost(int user_id, QueryCdt cdt, Model model) {
		cdt.setUser_id(user_id); // 将用户id存入查询条件类对象中
		Page<MyPost> page = postService.SelectMyPostByUserId(cdt); // 获取分页对象
		model.addAttribute("page", page); // 添加分页对象到request域中
		model.addAttribute("currentPage", page.getPage());
		model.addAttribute("totalNumber", page.getTotal());
		return "myPost";
	}

	/**
	 * 跳转到我的回复页面
	 */
	@RequestMapping(value = "/myReplay")
	public String MyReplay(int user_id, QueryCdt cdt, Model model) {
		cdt.setUser_id(user_id); // 将用户id存入查询条件类对象中
		Page<Comment> page = postService.SelectCommentByUserId(cdt);
		model.addAttribute("page", page);
		model.addAttribute("currentPage", page.getPage());
		model.addAttribute("totalNumber", page.getTotal());
		return "myReplay";
	}
}
