package controller;

import java.io.File;
import java.util.Date;
import java.util.UUID;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import entity.Bar;
import entity.User;
import service.PostService;
import service.UserService;

@RequestMapping(value = "/fileUpload")
@Controller
public class FileUploadController {
	private static Log log = (Log) LogFactory.getLog(Controller.class);
	@Autowired
	private UserService userService;
	@Autowired
	private PostService postService;

	/**
	 * 用户发帖
	 * 
	 * @param pictureFile
	 * @param user_id
	 * @param bar_id
	 * @param text_title
	 * @param text_content
	 * @return
	 * @throws Exception
	 */
	@ResponseBody // 解析json字符串
	@RequestMapping(value = "/postUpload")
	public String postUpload(@RequestParam MultipartFile[] pictureFile, int user_id, int bar_id, String text_title,
			String text_content) throws Exception {
		String name = null;
		String ext = null;
		String url = null;
		String img_url = "";
		log.info(text_content+"---------------------------------------------");
		if ("".equals(text_content) || text_content == null) {
			for (int i = 0; i < pictureFile.length; i++) {
				// 使用UUID给图片重命名，并去掉四个“-”
				name = UUID.randomUUID().toString().replaceAll("-", "");
				// 获取文件的扩展名
				ext = FilenameUtils.getExtension(pictureFile[i].getOriginalFilename());
				// 设置图片上传路径
				url = "D:/PictureUpload/PostImg";
				// 以绝对路径保存重名命后的图片
				pictureFile[i].transferTo(new File(url + "/" + name + "." + ext));
				img_url = img_url + "/post_img/" + name + "." + ext + ",";
			}
			// 插入发帖的信息
			if (ext == "") {
				postService.AddPost(bar_id, text_title, text_title, "", user_id, new Date());
			} else {
				postService.AddPost(bar_id, text_title, text_title, img_url, user_id, new Date());
			}
		} else {
			for (int i = 0; i < pictureFile.length; i++) {
				// 使用UUID给图片重命名，并去掉四个“-”
				name = UUID.randomUUID().toString().replaceAll("-", "");
				// 获取文件的扩展名
				ext = FilenameUtils.getExtension(pictureFile[i].getOriginalFilename());
				// 设置图片上传路径
				url = "D:/PictureUpload/PostImg";
				// 以绝对路径保存重名命后的图片
				pictureFile[i].transferTo(new File(url + "/" + name + "." + ext));
				img_url = img_url + "/post_img/" + name + "." + ext + ",";
			}
			// 插入发帖的信息
			if (ext == "") {
				postService.AddPost(bar_id, text_title, text_content, "", user_id, new Date());
			} else {
				postService.AddPost(bar_id, text_title, text_content, img_url, user_id, new Date());
			}
		}
		return "OK";
	}

	/**
	 * 用户更换头像
	 * 
	 * @param request
	 * @param pictureFile
	 * @param user_name
	 * @param user_pwd
	 * @return
	 * @throws Exception
	 */
	@ResponseBody // 解析json字符串
	@RequestMapping(value = "/upload")
	public String Upload(HttpServletRequest request, MultipartFile pictureFile, int user_id) throws Exception {
		log.info(pictureFile);
		// 使用UUID给图片重命名，并去掉四个“-”
		String name = UUID.randomUUID().toString().replaceAll("-", "");
		// 获取文件的扩展名
		String ext = FilenameUtils.getExtension(pictureFile.getOriginalFilename());
		// 设置图片上传路径
		String url = "D:/PictureUpload/UserImg";
		System.out.println(url);
		// 以绝对路径保存重名命后的图片
		pictureFile.transferTo(new File(url + "/" + name + "." + ext));
		User user = new User();
		// 把图片存储路径保存到数据库并且更新用户表
		user.setImageurl("/user_img/" + name + "." + ext);
		if (ext == "") {
			userService.UpdateUser("", user_id);
		} else {
			userService.UpdateUser(user.getImageurl(), user_id);
		}
		User us = userService.SelectUserById(user_id);
		request.getSession().setAttribute("us", us);
		return "OK";
	}

	/**
	 * 帖子回复
	 * 
	 * @param request
	 * @param pictureFile
	 * @param text_content
	 * @param id
	 * @param post_id
	 * @param publisher
	 * @return
	 * @throws Exception
	 */
	@ResponseBody // 解析json字符串
	@RequestMapping(value = "/replyUpload")
	public String ReplyUpload(@RequestParam MultipartFile[] pictureFile, String text_content, int bar_id, int post_id,
			int user_id) throws Exception {
		String name = null;
		String ext = null;
		String url = null;
		String img_url = "";
		for (int i = 0; i < pictureFile.length; i++) {
			// 使用UUID给图片重命名，并去掉四个“-”
			name = UUID.randomUUID().toString().replaceAll("-", "");
			// 获取文件的扩展名
			ext = FilenameUtils.getExtension(pictureFile[i].getOriginalFilename());
			// 设置图片上传路径
			url = "D:/PictureUpload/ReplyImg";
			// 以绝对路径保存重名命后的图片
			pictureFile[i].transferTo(new File(url + "/" + name + "." + ext));
			img_url = img_url + "/reply_img/" + name + "." + ext + ",";
		}
		if (ext == "") {
			postService.InsertComment(bar_id, post_id, text_content, user_id, "", new Date());
		} else {
			postService.InsertComment(bar_id, post_id, text_content, user_id, img_url, new Date());
		}
		return "OK";
	}

	/**
	 * 更新贴吧管理页面贴吧的信息
	 * 
	 * @param bar_id
	 * @param bar_name
	 * @param pictureFile
	 * @return
	 * @throws Exception
	 */
	@ResponseBody // 解析json字符串
	@RequestMapping(value = "/updatePostBar")
	public String UpdatePostBar(int bar_id, String bar_name, MultipartFile pictureFile) throws Exception {
		// 使用UUID给图片重命名，并去掉四个“-”
		String name = UUID.randomUUID().toString().replaceAll("-", "");
		// 获取文件的扩展名
		String ext = FilenameUtils.getExtension(pictureFile.getOriginalFilename());
		// 设置图片上传路径
		String url = "D:/PictureUpload/BarImg";
		// 以绝对路径保存重名命后的图片
		pictureFile.transferTo(new File(url + "/" + name + "." + ext));
		Bar bar = new Bar();
		// 把图片存储路径保存到数据库并且更新贴吧表bar_name,img_url字段
		bar.setImg_url("/bar_img/" + name + "." + ext);
		if (ext == "") {
			postService.UpdateBarById(bar_id, bar_name, "");
		} else {
			postService.UpdateBarById(bar_id, bar_name, bar.getImg_url());
		}
		return "OK";
	}

	/**
	 * 添加贴吧管理页面贴吧的信息
	 * 
	 * @param bar_name
	 * @param pictureFile
	 * @return
	 * @throws Exception
	 */
	@ResponseBody // 解析json字符串
	@RequestMapping(value = "/addPostBar")
	public String AddPostBar(String bar_name, MultipartFile pictureFile) throws Exception {
		// 使用UUID给图片重命名，并去掉四个“-”
		String name = UUID.randomUUID().toString().replaceAll("-", "");
		// 获取文件的扩展名
		String ext = FilenameUtils.getExtension(pictureFile.getOriginalFilename());
		// 设置图片上传路径
		String url = "D:/PictureUpload/BarImg";
		// 以绝对路径保存重名命后的图片
		pictureFile.transferTo(new File(url + "/" + name + "." + ext));
		Bar bar = new Bar();
		// 把图片存储路径保存到数据库并且更新贴吧表bar_name,img_url字段
		bar.setImg_url("/bar_img/" + name + "." + ext);
		if (ext == "") {
			postService.InsertBar(bar_name, "");
		} else {
			postService.InsertBar(bar_name, bar.getImg_url());
		}
		return "OK";
	}
}
