package com.ahxh.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;

/**
 * Servlet Filter implementation class UserFilter
 */
public class UserFilter implements Filter {
	/**
	 * Default constructor.
	 */
	public UserFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		HttpSession session = request.getSession();
		String url = request.getRequestURI();// 获取访问的url
		String ctxPath = request.getContextPath();// 获取网站上下文路径
		System.out.println(url);
		// System.out.println(ctxPath); 获取项目名称
		// 判断当前访问的路径是否和需要过滤的路径一致，如果一致则继续判断用户有无登录，没有即拦截重定向到提示页面，有则放行
		if (url.equals("/postbar/post/show") || url.equals("/postbar/post/showPost")
				|| url.equals("/postbar/post/modifyUserImg") || url.equals("/postbar/post/myPost")
				|| url.equals("/postbar/post/myReplay") || url.equals("/postbar/post/show.action")
				|| url.equals("/postbar/post/myPost.action") || url.equals("/postbar/post/myReplay.action")) {
			if (session.getAttribute("log_name") == null) {
				response.sendRedirect(ctxPath + "/user/notLogin");
			} else {
				chain.doFilter(req, res);
			}
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

	public static void main(String[] args) {

	}

}
