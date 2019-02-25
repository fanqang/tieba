package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Bar;
import entity.Comment;
import entity.MyPost;
import entity.QueryCdt;
import entity.User;

public interface AdminDao {
	//查询所有用户总条数
	public int SelectUserCount();
	//查询所有用户结果集
	public List<User> SelectUserList(QueryCdt cdt);
	//删除单个用户
	public void DeleteUser(int user_id);
	//根据用户id更新用户的信息
	public void UpdateUserByUserId(@Param("user_id")int user_id,@Param("user_name")String user_name,@Param("user_pwd")String user_pwd);
	//查询所有贴吧的总条数
	public int SelectBarCount();
	//查询所有贴吧结果集
	public List<Bar> SelectBarList(QueryCdt cdt);
	//删除单个贴吧
	public void DeleteBar(int bar_id);
	//查询所有帖子的总条数
	public int SelectMyPostCount();
	//查询所有帖子的结果集
	public List<MyPost> SelectMyPostList(QueryCdt cdt);
	//删除单个帖子
	public void DeleteMyPost(int post_id);
	//查询所有帖子回复的总条数
	public int SelectCommentCount();
	//查询所有帖子回复的结果集
	public List<Comment> SelectCommentList(QueryCdt cdt);
	//删除单条回复
	public void DeleteReplies(int comment_id);
}
