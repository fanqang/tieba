package entity;

/**
 * 分页公共类
 * 
 * @author 范
 *
 */
public class QueryCdt {
	// 贴吧id
	private int bar_id;
	// 用户id
	private int user_id;
	// 当前页
	private int page = 1;
	// 每页数
	private int size = 0;
	// 开始行
	private int startRow = 0;

	public int getBar_id() {
		return bar_id;
	}

	public void setBar_id(int bar_id) {
		this.bar_id = bar_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

}
