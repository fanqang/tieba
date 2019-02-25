package entity;

import java.util.Date;

public class SonComment {
	private int son_comment_id; //子回复id
	private String son_comment_content; //子回复的内容
	private int comment_id; //回复id
	private int bar_id; //所在贴吧id
	private int post_id; //所在帖子的id
	private int user_id; //当前发布用户id
	private int reply_id;//回复子回复的id
	private Date time; //发布时间
	public int getSon_comment_id() {
		return son_comment_id;
	}
	public void setSon_comment_id(int son_comment_id) {
		this.son_comment_id = son_comment_id;
	}
	public String getSon_comment_content() {
		return son_comment_content;
	}
	public void setSon_comment_content(String son_comment_content) {
		this.son_comment_content = son_comment_content;
	}
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public int getBar_id() {
		return bar_id;
	}
	public void setBar_id(int bar_id) {
		this.bar_id = bar_id;
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
	public int getReply_id() {
		return reply_id;
	}
	public void setReply_id(int reply_id) {
		this.reply_id = reply_id;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "SonComment [son_comment_id=" + son_comment_id + ", son_comment_content=" + son_comment_content
				+ ", comment_id=" + comment_id + ", bar_id=" + bar_id + ", post_id=" + post_id + ", user_id=" + user_id
				+ ", reply_id=" + reply_id + ", time=" + time + "]";
	}

	

}
