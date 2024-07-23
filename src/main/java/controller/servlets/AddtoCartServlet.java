package controller.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.DatabaseController;
import model.CartModel;
import model.ProductModel;
import util.StringUtils;

@WebServlet(asyncSupported = true, urlPatterns = { "/AddtoCartServlet" })
public class AddtoCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	DatabaseController dbController = new DatabaseController();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddtoCartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();

		String username = (String) session.getAttribute(StringUtils.USER_NAME);

		System.out.println(username);

		

		int userID = dbController.getUserIdByUsername(username);

		System.out.println(userID);

		int productID = Integer.parseInt(request.getParameter("productID"));

		System.out.println(productID);
		
		

        int cartQuantity = Integer.parseInt(request.getParameter("cartQuantity"));

        System.out.println(cartQuantity);

        

        // Create CartModel object and set values

        CartModel cartItem = new CartModel();

        cartItem.setProductID(productID);

        cartItem.setCartQuantity(cartQuantity);

        

        // Add cart item to the database
        int result = dbController.AddtoCart( userID,  productID,  cartQuantity);

        

        if (result > 0) {

        	response.sendRedirect(request.getContextPath() + "/AddToCartListServlet");

        } else {

            // Handle error

        	request.setAttribute(StringUtils.ERROR_MESSAGE, "Error Occured");

            request.getRequestDispatcher(StringUtils.LOGIN_PAGE).forward(request, response);

        }

	}
		
}	
