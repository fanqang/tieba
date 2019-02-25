package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AdminDao;
import entity.Bar;
import entity.Comment;
import entity.MyPost;
import entity.QueryCdt;
import entity.User;
import paging.Page;

@Service
public class AdminService {
	@Autowired
	private AdminDao adminDao;

	// 查询用户分页对象
	public Page<User> SelectUserByQueryCdt(QueryCdt cdt) {
		Page<User> page = new Page<>();
		// 初始化分页对象设置每页显示的数量
		cdt.setSize(5);
		if (null != cdt) {
			// 如果条件对象不为空， 初始化分页对象设置每页显示的数量
			page.setSize(cdt.getSize());
			// 将条件对象的当前页设为分页对象的当前页
			page.setPage(cdt.getPage());
			// 通过条件对象的当前页和每页数计算设置开始行
			cdt.setStartRow((cdt.getPage() - 1) * cdt.getSize());
			// 设置总条数
			page.setTotal(adminDao.SelectUserCount());
			// 设置结果集
			page.setRows(adminDao.SelectUserList(cdt));
		}
		return page;
	}

	// 删除单个用户
	public void DeleteUser(int user_id) {
		adminDao.DeleteUser(user_id);
	}

	// 根据用户id更新用户的信息
	public void UpdateUserByUserId(int user_id, String user_name, String user_pwd) {
		adminDao.UpdateUserByUserId(user_id, user_name, user_pwd);
	}

	// 查询贴吧分页对象
	public Page<Bar> SelectBarByQueryCdt(QueryCdt cdt) {
		Page<Bar> page = new Page<>();
		// 初始化分页对象设置每页显示的数量
		cdt.setSize(5);
		if (null != cdt) {
			// 如果条件对象不为空， 初始化分页对象设置每页显示的数量
			page.setSize(cdt.getSize());
			// 将条件对象的当前页设为分页对象的当前页
			page.setPage(cdt.getPage());
			// 通过条件对象的当前页和每页数计算设置开始行
			cdt.setStartRow((cdt.getPage() - 1) * cdt.getSize());
			// 设置总条数
			page.setTotal(adminDao.SelectBarCount());
			// 设置结果集
			page.setRows(adminDao.SelectBarList(cdt));
		}
		return page;
	}

	// 删除单个贴吧
	public void DeleteBar(int bar_id) {
		adminDao.DeleteBar(bar_id);
	}

	// 查询贴子分页对象
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
			page.setTotal(adminDao.SelectMyPostCount());
			// 设置结果集
			page.setRows(adminDao.SelectMyPostList(cdt));
		}
		return page;
	}

	// 删除单个帖子
	public void DeleteMyPost(int post_id) {
		adminDao.DeleteMyPost(post_id);
	}

	// 查询回复帖子分页对象
	public Page<Comment> SelectCommentByQueryCdt(QueryCdt cdt) {
		Page<Comment> page = new Page<>();
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
			page.setTotal(adminDao.SelectCommentCount());
			// 设置结果集
			page.setRows(adminDao.SelectCommentList(cdt));
		}
		return page;
	}

	// 删除单条回复
	public void DeleteReplies(int comment_id) {
		adminDao.DeleteReplies(comment_id);
	}
}
