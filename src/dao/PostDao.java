package dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Bar;
import entity.Comment;
import entity.MyPost;
import entity.QueryCdt;
import entity.SonComment;

public interface PostDao {
	// 根据id编号查询贴吧信息
	public Bar SelectBar(int bar_id);
	//插入贴吧数据
	public void InsertBar(@Param("bar_name")String bar_name,@Param("img_url")String img_url);
	// 根据贴吧id编号更新贴吧信息
	public void UpdateBarById(@Param("bar_id")int bar_id,@Param("bar_name")String bar_name,@Param("img_url")String img_url);
	// 总条数
	public int SelectMyPostCount(QueryCdt cdt);
	// 结果集
	public List<MyPost> SelectMyPostByIdList(QueryCdt cdt);
	// 帖子回复数量
	public int SelectCommentCountByPostId(int post_id);
	// 添加发帖的信息
	public MyPost AddPost(@Param("bar_id") int bar_id, @Param("text_title") String text_title,
			@Param("text_content") String text_content,@Param("img_url")String img_url, @Param("user_id") int user_id, @Param("time") Date time);
	// 根据贴吧页面post_id编号查询帖子信息
	public MyPost SelectMyPostByPostId(int post_id);
	// 查询帖子回复信息list
	public List<Comment> SelectCommentByPostIdList(int post_id);
	// 插入回复帖子的信息
	public Object InsertComment(@Param("bar_id") int bar_id, @Param("post_id") int post_id,
			@Param("text_content") String text_content, @Param("user_id") int user_id,
			@Param("image_url") String image_url, @Param("time") Date time);
	//插入子回复的信息
	public Object InsertSonComment(@Param("son_comment_content") String son_comment_content,
			@Param("comment_id") int comment_id,@Param("user_id") int user_id,
			@Param("post_id") int post_id,@Param("bar_id") int bar_id,
			@Param("reply_id") int reply_id,@Param("time") Date time);
	//根据回复的编号查询子回复集合
	public List<SonComment> SelectSonCommentByCommentId(int comment_id);
	//删除子回复
	public void DeleteSonCommentBySonCommenId(int son_comment_id);
	// 根据登录保存的用户对象id查询mypost表
	public List<MyPost> SelectCommentByUserId(int user_id);
	// 根据用户id查询当前登录用户发布帖子的总条数
	public int SelectMypostByUserIdCount(QueryCdt cdt);
	// 根据登录保存的用户对象id查询用户发布帖子的结果集
	public List<MyPost> SelectMyPostByUserId(QueryCdt cdt);
	// 查询用户回复帖子的总条数
	public int SelectCommentCountByUserId(QueryCdt cdt);
	// 根据登录保存的用户对象id查询回复帖子的结果集
	public List<Comment> SelectCommentList(QueryCdt cdt);
}
