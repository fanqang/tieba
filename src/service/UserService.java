package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDao;
import entity.Bar;
import entity.User;

@Service
public class UserService {
	@Autowired
	private UserDao userDao;

	// 登录验证查询用户
	public User SelectUserByUserNameAndUserPwd(String user_name, String user_pwd) {
		return userDao.SelectUserByUserNameAndUserPwd(user_name, user_pwd);
	}

	// 注册验证根据用户名查询用户
	public User SelectUserByUserName(String user_name) {
		return userDao.SelectUserByUserName(user_name);
	}

	// 注册用户
	public void AddUser(String user_name, String user_pwd, String imageurl) {
		userDao.AddUser(user_name, user_pwd, imageurl);
	}

	// 查询贴吧所有条目
	public List<Bar> SelectBarList() {
		return userDao.SelectBarList();
	}

	// 更新用户信息
	public Object UpdateUser(String imageurl, int user_id) {
		return userDao.UpdateUser(imageurl, user_id);
	}

	// 根据用户id查询用户
	public User SelectUserById(int user_id) {
		return userDao.SelectUserById(user_id);
	}

}
