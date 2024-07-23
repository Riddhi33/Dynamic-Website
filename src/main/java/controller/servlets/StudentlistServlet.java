package controller.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.DatabaseController;
import model.StudentModel;

/**
 * Servlet implementation class StudentlistServlet
 */
@WebServlet("/StudentlistServlet")
public class StudentlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DatabaseController databaseController = new DatabaseController();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentlistServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Getting all students");
		List<StudentModel> studentList = databaseController.getAllStudentsInfo();
		request.setAttribute("studentList", studentList);
		
		   request.getRequestDispatcher("/Pages/userslist.jsp").forward(request, response);
		 
		/* response.sendRedirect(request.getContextPath() + "/Pages/index.jsp"); */

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
