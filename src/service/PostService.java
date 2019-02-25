package service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.PostDao;
import entity.Bar;
import entity.Comment;
import entity.MyPost;
import entity.QueryCdt;
import entity.SonComment;
import paging.Page;

@Service
public class PostService {
	@Autowired
	private PostDao postDao;

	// 通过id编号查询贴吧信息
	public Bar SelectBar(int bar_id) {
		return postDao.SelectBar(bar_id);
	}

	// 插入贴吧数据
	public void InsertBar(String bar_name, String img_url) {
		postDao.InsertBar(bar_name, img_url);
	}

	// 根据贴吧id编号更新贴吧信息
	public void UpdateBarById(int bar_id, String bar_name, String img_url) {
		postDao.UpdateBarById(bar_id, bar_name, img_url);
	}

	// 通过bar_id查询分页对象
	public Page<MyPost> SelectMyPostByQueryCdt(QueryCdt cdt) {
		Page<MyPost> page = new Page<>();
		// 初始化分页对象设置每页显示的数量
		cdt.setSize(10);
		if (null != cdt) {
			// 如果条件对象不为空， 初始化分页对象设置每页显示的数量
			page.setSize(cdt.getSize());
			// 将条件对象的当前页设为分页对象的当前页
			page.setPage(cdt.getPage());
			// 通过条件对象的当前页和每页数计算设置开始行
			cdt.setStartRow((cdt.getPage() - 1) * cdt.getSize());
			// 设置总条数
			page.setTotal(postDao.SelectMyPostCount(cdt));
			// 设置结果集
			page.setRows(postDao.SelectMyPostByIdList(cdt));
		}
		return page;
	}

	// 插入发帖的信息
	public MyPost AddPost(int bar_id, String text_title, String text_content, String image_url, int user_id,
			Date time) {
		return postDao.AddPost(bar_id, text_title, text_content, image_url, user_id, time);
	}

	// 根据贴吧页面post_id编号查询帖子信息
	public MyPost SelectMyPostByPostId(int post_id) {
		return postDao.SelectMyPostByPostId(post_id);
	}

	// 查询帖子回复信息list
	public List<Comment> SelectCommentByPostIdList(int post_id) {

		return postDao.SelectCommentByPostIdList(post_id);
	}

	// 插入回复帖子的信息
	public Object InsertComment(int bar_id, int post_id, String text_content, int user_id, String image_url,
			Date time) {
		return postDao.InsertComment(bar_id, post_id, text_content, user_id, image_url, time);
	}

	// 插入子回复的信息
	public Object InsertSonComment(String son_comment_content, int comment_id, int user_id, int post_id, int bar_id,
			int reply_id, Date time) {
		return postDao.InsertSonComment(son_comment_content, comment_id, user_id, post_id, bar_id, reply_id, time);
	}

	// 根据回复的编号查询子回复集合
	public List<SonComment> SelectSonCommentByCommentId(int comment_id) {
		return postDao.SelectSonCommentByCommentId(comment_id);
	}

	// 删除子回复
	public void DeleteSonCommentBySonCommenId(int son_comment_id) {
		postDao.DeleteSonCommentBySonCommenId(son_comment_id);
	}

	// 根据登录保存的用户对象id查询mypost表
	public List<MyPost> SelectCommentByUserId(int user_id) {
		return postDao.SelectCommentByUserId(user_id);
	}

	// 通过user_id查询功能 我的帖子 分页对象
	public Page<MyPost> SelectMyPostByUserId(QueryCdt cdt) {
		Page<MyPost> page = new Page<>();
		// 初始化分页对象设置每页显示的数量
		cdt.setSize(10);
		if (null != cdt) {
			// 如果条件对象不为空， 初始化分页对象设置每页显示的数量
			page.setSize(cdt.getSize());
			// 将条件对象的当前页设为分页对象的当前页
			page.setPage(cdt.getPage());
			// 通过条件对象的当前页和每页数计算设置开始行
			cdt.setStartRow((cdt.getPage() - 1) * cdt.getSize());
			// 设置总条数
			page.setTotal(postDao.SelectMypostByUserIdCount(cdt));
			// 设置结果集
			page.setRows(postDao.SelectMyPostByUserId(cdt));
		}
		return page;
	}

	// 通过user_id查询功能 我的回复 分页对象
	public Page<Comment> SelectCommentByUserId(QueryCdt cdt) {
		Page<Comment> page = new Page<>();
		cdt.setSize(4);
		if (null != cdt) {
			// 如果条件对象不为空， 初始化分页对象设置每页显示的数量
			page.setSize(cdt.getSize());
			// 将条件对象的当前页设为分页对象的当前页
			page.setPage(cdt.getPage());
			// 通过条件对象的当前页和每页数计算设置开始行
			cdt.setStartRow((cdt.getPage() - 1) * 4);
			// 设置总条数
			page.setTotal(postDao.SelectCommentCountByUserId(cdt));
			// 设置结果集
			page.setRows(postDao.SelectCommentList(cdt));
		}
		return page;
	}

}
