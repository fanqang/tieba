package entity;

import java.util.Date;

/**
 * 回复类
 * 
 * @author 范
 *
 */
public class Comment {
	private int comment_id; // 回复id
	private int post_id; // 帖子编号
	private int user_id; // 用户id
	private int bar_id; // 贴吧od
	private String text_content; // 回复内容
	private String image_url; // 回复图片的url
	private Date time; // 回复时间
	private String bar_name; // 回复的贴吧名称
	private String text_title; // 回复的帖子标题
	private int reply_count; // 回复数量
	private String user_name;// 回复的用户

	public int getComment_id() {
		return comment_id;
	}

	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}

	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getBar_id() {
		return bar_id;
	}

	public void setBar_id(int bar_id) {
		this.bar_id = bar_id;
	}

	public String getText_content() {
		return text_content;
	}

	public void setText_content(String text_content) {
		this.text_content = text_content;
	}

	public String getImage_url() {
		return image_url;
	}

	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getBar_name() {
		return bar_name;
	}

	public void setBar_name(String bar_name) {
		this.bar_name = bar_name;
	}

	public String getText_title() {
		return text_title;
	}

	public void setText_title(String text_title) {
		this.text_title = text_title;
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

}
