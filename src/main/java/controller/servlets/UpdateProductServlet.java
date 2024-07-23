package controller.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.DatabaseController;
import model.ProductModel;
import util.StringUtils;



//localhost:8080/MySecondProject/UpdateProductServlet?updateId=37

/**
 * Servlet implementation class UpdateProductServlet
 */
@WebServlet("/UpdateProductServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)
public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final DatabaseController dbController;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductServlet() {
       this.dbController = new DatabaseController();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("Getting product Info");
		int productID = Integer.valueOf(request.getParameter("updateId"));
		System.out.println("UpdateProductServlet productName: " + productID);
		ProductModel product = dbController.getProductByID(productID);
		
		request.setAttribute("product", product);
		request.getRequestDispatcher("/Pages/updateProduct.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		System.out.println("Updating product");
		
		String name = request.getParameter("productName");
		String price = request.getParameter("productPrice");
		String description = request.getParameter("productDescription");
		String category = request.getParameter("productCategory");
		String stockquantity = request.getParameter("stockQuantity");
		String productImage = request.getParameter("productImage");
		int productID = Integer.valueOf(request.getParameter("productID"));
		System.out.println(productID);
		ProductModel productModel = new ProductModel();
		
		productModel.setProductName(name);
		productModel.setProductPrice(price);
		
		productModel.setProductDescription(description);
		productModel.setProductCategory(category);
		productModel.setStockQuantity(stockquantity);
		productModel.setImageUrlFromPart(productImage);
		productModel.setProductID(productID);
		
		int result = dbController.updateProduct(productModel);
		System.out.println(""+result);
		response.sendRedirect(request.getContextPath()+"/AddProductlistServlet");
	}

}
