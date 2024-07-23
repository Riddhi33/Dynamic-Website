

package controller.servlets;



import java.io.IOException;

import java.util.List;



import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;



import controller.DatabaseController;

import model.CartModel;

import util.StringUtils;



/**

 * Servlet implementation class DisplayServlet

 */

@WebServlet("/AddToCartListServlet")

public class AddToCartListServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

       

	DatabaseController dbController = new DatabaseController();

    /**

     * @see HttpServlet#HttpServlet()

     */

    public AddToCartListServlet() {

        super();

    }



	/**

	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)

	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		  	HttpSession session = request.getSession();

	        String username = (String) session.getAttribute(StringUtils.USER_NAME);

			System.out.println(username);

			

			int userId = dbController.getUserIdByUsername(username);

			System.out.println(userId);

	        // Fetch cart items for the user

	        List<CartModel> cartItems = dbController.getCartItemsByUserId(userId);

	        

	        request.setAttribute("cartItems", cartItems);


	        // Forward the request to addtocart.jsp

	        request.getRequestDispatcher("/Pages/addtocart.jsp").forward(request, response);

	}



	/**

	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)

	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		doGet(request, response);

	}



}