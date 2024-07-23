
package controller.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.DatabaseController;
import util.StringUtils;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = {StringUtils.LOGIN_SERVLET})
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	DatabaseController dbController = new DatabaseController();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
		this.dbController = new DatabaseController();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
	    
	    String userName = request.getParameter("userName");
	    String password = request.getParameter("password");

	    
	    // Checking if the username exists in the database
	    boolean userExists = dbController.isExistingUser(userName);
	 
   if (!userExists) {
	        // if the username doesn't exist, error message is shown
	    	request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.LOGIN_ERROR_MESSAGE);
	    	request.getRequestDispatcher(StringUtils.LOGIN_PAGE).forward(request, response);
	        return; // stop further processing
	    }

	    // if username exist, pw is checked
	    int result = dbController.getStudentLoginInfo(userName, password);
	    System.out.println(result);
	    if (result == 1) {
	        // user login successful
	        HttpSession userSession = request.getSession();
	        userSession.setAttribute("userName", userName);
	        userSession.setMaxInactiveInterval(30*30);
	        
	        Cookie userCookie= new Cookie("user", userName);
	        userCookie.setMaxAge(30*60);
	        response.addCookie(userCookie);
	        
	        response.sendRedirect(request.getContextPath() + StringUtils.HOME_PAGE);
	        
	    } else if (result == 2) {
	        
	        response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PRODUCT_PAGE);
	        
	 }else {
	        // Incorrect password
	    	request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.LOGIN_ERROR_MESSAGE);
		    request.getRequestDispatcher(StringUtils.LOGIN_PAGE).forward(request, response);
	    }
	}

}
