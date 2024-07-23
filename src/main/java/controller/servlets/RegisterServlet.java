package controller.servlets;


import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import controller.DatabaseController;
import model.StudentModel;
import util.StringUtils;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = {StringUtils.REGISTER_SERVLET})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	DatabaseController dbController = new DatabaseController();
	
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			
		
		String firstName = request.getParameter(StringUtils.FIRST_NAME);
		if (firstName == null || firstName.isEmpty()) {
		    // Handle error: first name is required
		    response.getWriter().append("first name is required");
		} else if (firstName.matches(".*\\d+.*")) {
		    // Handle error: first name contains digits
		    response.getWriter().append("first name cannot be an integer value");
		} else {
		}

		// Validate lastName
		String lastName = request.getParameter(StringUtils.LAST_NAME);
		if (lastName == null || lastName.isEmpty()) {
		    // Handle error: last name is required
		} else if (lastName.matches(".*\\d+.*")) {
		    // Handle error: last name contains digits
		}

		// Validate birthday
		String birthdayString = request.getParameter(StringUtils.BIRTHDAY);
		LocalDate birthday = null;
		try {
		    birthday = LocalDate.parse(birthdayString);
		} catch (DateTimeParseException e) {
		    // Handle error: birthday is not in valid format
		}
		
		// Validate phoneNumber
				String phoneNumber = request.getParameter(StringUtils.PHONE_NUMBER);
				// You can add more complex validation for phone number according to your requirements
				
				// Validate subject
				String address = request.getParameter(StringUtils.ADDRESS);
		
		

		// Validate gender
		String gender = request.getParameter(StringUtils.GENDER);
		if (gender == null || (!gender.equals("male") && !gender.equals("female") && !gender.equals("other"))) {
		    // Handle error: gender is invalid
		}
		

		// Validate email
		String email = request.getParameter(StringUtils.EMAIL);
		if (email == null || !email.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$")) {
		    // Handle error: email is invalid
		}
		
		// Validate userName
		String userName = request.getParameter(StringUtils.USER_NAME);

		// Validate password and retypePassword
		String password = request.getParameter(StringUtils.PASSWORD);
		String retypePassword = request.getParameter(StringUtils.RETYPE_PASSWORD);
		if (password == null || !password.equals(retypePassword)) {
		    // Handle error: passwords do not match or password is empty
		}
		Part imagePart = request.getPart("image");
		// If all data is valid, proceed to create the StudentModel object and add to the database
		StudentModel studentModel = new StudentModel(firstName, lastName, birthday,phoneNumber,address, gender, email,  userName, password, imagePart);

		// Add student to the database
		
		String savePath = StringUtils.IMAGE_DIR_SAVE_PATH;
		String fileName = studentModel.getImageUrlFromPart();
		if(!fileName.isEmpty() && fileName!=null)
			imagePart.write(savePath + fileName);
		
		if (password.equals(retypePassword)) {
			int result = dbController.addStudent(studentModel);
			System.out.println("Register result ="+result);
			
			switch (result) {
			case 1 -> {
				request.setAttribute(StringUtils.SUCCESS_MESSAGE, StringUtils.SUCCESS_REGISTER_MESSAGE);
			    response.sendRedirect(request.getContextPath() + StringUtils.LOGIN_PAGE);
			}
			case 0 -> {
				request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.REGISTER_ERROR_MESSAGE);
			    request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
			}
			case -1 -> {
				request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.SERVER_ERROR_MESSAGE);
				request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
			}
			case -2 -> {
				request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.USERNAME_ERROR_MESSAGE);
				request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
			}
			case -3 -> {
				request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.EMAIL_ERROR_MESSAGE);
				request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
			}
			case -4 -> {
				request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.PHONE_NUMBER_ERROR_MESSAGFE);
				request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
			}
			default -> {
				request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.SERVER_ERROR_MESSAGE);
				request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
			}
			}
		}else {
			request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.PASSWORD_UNMATCHED_ERROR_MESSAGE);
			request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
		}

		
	}

}
