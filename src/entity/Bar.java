package entity;
/**
 * 贴吧类
 * @author 范
 *
 */
public class Bar {
	private int bar_id; //贴吧id 
	private String bar_name; //贴吧名称
	private String img_url; //贴吧图片url

	public int getBar_id() {
		return bar_id;
	}

	public void setBar_id(int bar_id) {
		this.bar_id = bar_id;
	}

	public String getBar_name() {
		return bar_name;
	}

	public void setBar_name(String bar_name) {
		this.bar_name = bar_name;
	}

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

	@Override
	public String toString() {
		return "Bar [bar_id=" + bar_id + ", bar_name=" + bar_name + ", img_url=" + img_url + "]";
	}

}
