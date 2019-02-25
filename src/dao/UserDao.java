package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Bar;
import entity.User;

public interface UserDao {
	//登录验证查询用户
	public User SelectUserByUserNameAndUserPwd(@Param("user_name")String user_name,@Param("user_pwd")String user_pwd);
	//注册验证根据用户名查询用户
	public User SelectUserByUserName(String user_name);
	//注册用户
	public void AddUser(@Param("user_name")String user_name,@Param("user_pwd") String user_pwd,@Param("imageurl") String imageurl);
	//根据用户id查询用户
	public User SelectUserById(int user_id);
	//查询贴吧所有条目
	public List<Bar> SelectBarList();
	//更新用户信息
	public Object UpdateUser(@Param("imageurl")String imageurl,@Param("user_id")int user_id);
}
