package controller.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.DatabaseController;
import model.ProductModel;
import model.StudentModel;
import util.StringUtils;

//localhost:8080/MySecondProject/UpdateProductServlet?updateId=37

/**
 * Servlet implementation class UpdateProductServlet
 */
@WebServlet("/UserProfileServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50)
public class UserProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final DatabaseController dbController;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserProfileServlet() {
		this.dbController = new DatabaseController();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*
		 * response.getWriter().append("Served at: ").append(request.getContextPath());
		 */
        HttpSession session= request.getSession(false);
        String username = (String) session.getAttribute("user");
		System.out.println("Getting user profile Info");
		/* doPost(request, response); */
		/*
		 * String firstName = request.getParameter("firstName"); String lastName =
		 * request.getParameter("lastName"); String phoneNumber =
		 * request.getParameter("phoneNumber"); String address =
		 * request.getParameter("address"); String email =
		 * request.getParameter("email"); String userName =
		 * request.getParameter("userName"); int userID =
		 * Integer.parseInt(request.getParameter("userID"));
		 * 
		 * StudentModel studentModel = new StudentModel();
		 * studentModel.setFirstName(firstName); studentModel.setLastName(lastName);
		 * studentModel.setPhoneNumber(phoneNumber); studentModel.setAddress(address);
		 * studentModel.setEmail(email); studentModel.setUserName(userName);
		 * studentModel.setUserID(userID);
		 */

//		int result = dbController.updateUser(studentModel);
		StudentModel student = dbController.getUserInfo(username);
		int studentmodel = dbController.getUserIdByUsername(username);
		

//		if (result > 0) {
			// Update successful
			HttpSession usersession = request.getSession();
			usersession.setAttribute("userName", username);

			int user = dbController.getUserIdByUsername(username);
			session.setAttribute("userID", user);
			request.setAttribute("student",student);
			request.getRequestDispatcher(StringUtils.USER_PROFILE_PAGE).forward(request, response);
			
			
//		} else {
			// Update failed, handle error
			// You can redirect to an error page or display an error message
//			request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.SERVER_ERROR_MESSAGE);
//		}
	}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
// TODO Auto-generated method stub
		

		/*String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String phoneNumber = request.getParameter("phoneNumber");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String userName = request.getParameter("userName");
		int userID = Integer.parseInt(request.getParameter("userID"));

		StudentModel studentModel = new StudentModel();
		studentModel.setFirstName(firstName);
		studentModel.setLastName(lastName);
		studentModel.setPhoneNumber(phoneNumber);
		studentModel.setAddress(address);
		studentModel.setEmail(email);
		studentModel.setUserName(userName);
		studentModel.setUserID(userID);

		int result = dbController.updateUser(studentModel);

		if (result > 0) {
			// Update successful
			HttpSession session = request.getSession();
			session.setAttribute("userName", userName);

			int user = dbController.getUserIdByUsername(userName);
			session.setAttribute("userID", user);
			request.getRequestDispatcher(StringUtils.USER_PROFILE_SERVLET).forward(request, response);
			
		} else {
			// Update failed, handle error
			// You can redirect to an error page or display an error message
			request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.SERVER_ERROR_MESSAGE);
		}
	}*/
}
}