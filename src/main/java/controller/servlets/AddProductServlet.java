package controller.servlets;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import controller.DatabaseController;
import model.ProductModel;

import util.StringUtils;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = {StringUtils.ADD_PRODUCT_SERVLET})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	DatabaseController dbController = new DatabaseController();



	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddProductServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productName = request.getParameter(StringUtils.PRODUCT_NAME);
		if (productName == null || productName.isEmpty()) {
			// Handle error: product name is required
			response.getWriter().append("Product name is required");
		} else if (productName.matches(".*\\d+.*")) {
			// Handle error: product name doesnot contains digits
			response.getWriter().append("Product name cannot be an integer value");
		} else {
		}


		String productPrice = request.getParameter(StringUtils.PRODUCT_PRICE);
		String productDescription = request.getParameter(StringUtils.PRODUCT_DESCRIPTION);
		String productCategory = request.getParameter(StringUtils.PRODUCT_CATEGORY);
		String stockQuantity = request.getParameter(StringUtils.STOCK_QUANTITY);

		Part imagePart = request.getPart("productImage");
		ProductModel productModel = new ProductModel(productName, productPrice, productDescription, productCategory, stockQuantity, imagePart);

		String savePath = StringUtils.IMAGE_DIR_PRODUCT_SAVE_PATH; 
		String fileName = productModel.getImageUrlFromPart(); 

		if(!fileName.isEmpty() && fileName!=null)
			imagePart.write(savePath + fileName);


		int result = dbController.addProduct(productModel);

		if (result > 0) {
			response.sendRedirect(request.getContextPath() + "/AddProductlistServlet");
		} else {
			response.sendRedirect(request.getContextPath() + "/Pages/AddProduct.jsp");
		}
	}
}

