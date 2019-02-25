package entity;

import java.util.Date;

/**
 * 帖子类
 * 
 * @author 范
 *
 */
public class MyPost {
	private int post_id; // 帖子编号
	private int bar_id; // 贴吧id
	private String text_title; // 帖子标题
	private String text_content; // 帖子内容
	private int user_id; // 用户id
	private String img_url;// 用户发布的图片url
	private Date time; // 发布时间
	private int reply_count; // 回复数量
	private String user_name; // 用户名称
	private String bar_name; // 贴吧名称

	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}

	public int getBar_id() {
		return bar_id;
	}

	public void setBar_id(int bar_id) {
		this.bar_id = bar_id;
	}

	public String getText_title() {
		return text_title;
	}

	public void setText_title(String text_title) {
		this.text_title = text_title;
	}

	public String getText_content() {
		return text_content;
	}

	public void setText_content(String text_content) {
		this.text_content = text_content;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public int getReply_count() {
		return reply_count;
	}

	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getBar_name() {
		return bar_name;
	}

	public void setBar_name(String bar_name) {
		this.bar_name = bar_name;
	}

	@Override
	public String toString() {
		return "MyPost [post_id=" + post_id + ", bar_id=" + bar_id + ", text_title=" + text_title + ", text_content="
				+ text_content + ", user_id=" + user_id + ", time=" + time + ", reply_count=" + reply_count
				+ ", user_name=" + user_name + ", bar_name=" + bar_name + "]";
	}

}
