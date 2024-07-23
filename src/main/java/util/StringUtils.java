package util;

import java.io.File;

public class StringUtils {
	public static final String INSERT_STUDENT = "INSERT INTO register"
			+ "(firstName,lastName, birthday, phoneNumber, address, gender, email, userName, password, image, role)"
			+ "VALUES (?,?,?,?,?,?,?,?,?,?, 'user')";

	
	  public static final String INSERT_PRODUCT = "INSERT INTO addproduct" +
	 "(productName, productPrice, productDescription, productCategory, stockQuantity, productImage)"
	  + "VALUES (?,?,?,?,?,?)";
	 
	public static final String GET_ALL_STUDENT_INFO = "SELECT * FROM register";

	public static final String GET_LOGIN_STUDENT_INFO = "SELECT * FROM register WHERE userName = ? ";

	public static final String GET_USERNAME = "SELECT COUNT(*) FROM register WHERE userName = ?";

	public static final String GET_PHONE = "SELECT COUNT(*) FROM register WHERE phoneNumber = ?";

	public static final String GET_EMAIL = "SELECT COUNT(*) FROM register WHERE email = ?";
	
	
	
	
	public static final String GET_USER_DETAIL = "SELECT firstName, lastName, phoneNumber, address, email WHERE username = ?";
	
	public static final String GET_ALL_PRODUCT = "SELECT * FROM addproduct";
	public static final String GET_PRODUCTNAME = "SELECT COUNT(*) FROM addproduct WHERE productName = ?";

	
	

	public static final String IMAGE_DIR_USER = "MySecondProject\\src\\main\\webapp\\resources\\images\\user\\";
	public static final String IMAGE_DIR_SAVE_PATH = "D:" + File.separator + IMAGE_DIR_USER;
	
	
	public static final String IMAGE_DIR_PRODUCT = "MySecondProject\\src\\main\\webapp\\resources\\images\\product\\";
	public static final String IMAGE_DIR_PRODUCT_SAVE_PATH = "D:" + File.separator + IMAGE_DIR_PRODUCT;

	public static final String FIRST_NAME = "firstName";
	public static final String LAST_NAME = "lastName";
	public static final String BIRTHDAY = "birthday";
	public static final String PHONE_NUMBER = "phoneNumber";
	public static final String ADDRESS = "address";
	public static final String GENDER = "gender";
	public static final String EMAIL = "email";
	public static final String USER_NAME = "userName";
	public static final String PASSWORD = "password";
	public static final String RETYPE_PASSWORD = "retypePassword";
	
	public static final String PRODUCT_ID = "productID";
	public static final String PRODUCT_NAME = "productName";
	public static final String PRODUCT_PRICE = "productPrice";
	public static final String PRODUCT_DESCRIPTION = "productDescription";
	public static final String PRODUCT_CATEGORY = "productCategory";
	public static final String STOCK_QUANTITY = "stockQuantity";

	
	
	
	

	// Start messages
	public static final String SUCCESS_REGISTER_MESSAGE = "Successfully Registered.";
	public static final String REGISTER_ERROR_MESSAGE = "Please correct the form data.";
	public static final String SERVER_ERROR_MESSAGE = "An unexpected server error occured.";
	public static final String LOGIN_ERROR_MESSAGE = "Username and password does not match";
	public static final String SUCCESS_MESSAGE = "successMessage";
	public static final String SUCCESS_LOGIN_MESSAGE = "Login Successfull.";
	public static final String ERROR_MESSAGE = "errorMessage";
	public static final String USERNAME_ERROR_MESSAGE = "Username is already registered.";
	public static final String EMAIL_ERROR_MESSAGE = "Email is already registered.";
	public static final String PHONE_NUMBER_ERROR_MESSAGFE = "Phone Number is already registered.";
	public static final String PASSWORD_UNMATCHED_ERROR_MESSAGE = "Password is not matched.";
	// End messages

	// Start JSP Route
	
	public static final String LOGIN_PAGE = "/Pages/login.jsp";
	public static final String REGISTER_PAGE = "/Pages/register.jsp";
    public static final String WELCOME_PAGE = "/Pages/welcome.jsp";
	public static final String HOME_PAGE = "/Pages/homepage.jsp";
	public static final String USER_PROFILE_PAGE = "/Pages/userprofile.jsp";
	public static final String ADMIN_PRODUCT_PAGE = "/AddProductlistServlet";
	
	
	public static final String ADD_PRODUCT_PAGE = "/Pages/AddProduct.jsp";
	// End JSP Route

	// Start Servlet Route
	public static final String ADD_TO_CART_SERVLET = "/AddtoCartServlet";
	public static final String USER_PROFILE_SERVLET = "/UserProfileServlet";
	public static final String LOGIN_SERVLET = "/LoginServlet";
	public static final String LOGOUT_SERVLET = "/LogoutServlet";
	public static final String REGISTER_SERVLET = "/RegisterServlet";
	public static final String ADD_PRODUCT_SERVLET = "/AddProductServlet";
	public static final String USER_PRODUCT_SERVLET = "/UserProductServlet";
	
	public static final String QUERY_DELETE_PRODUCT = "DELETE FROM addproduct WHERE productName = ?";
    
    public static final String UPDATE_PRODUCT = "UPDATE addproduct SET  productName=?, productPrice=?, productDescription=?, productCategory=?, stockQuantity=? WHERE productID=?";
    public static final String UPDATE_PROFILE = "UPDATE register SET  firstName=?, lastName=?, phoneNumber=?, address=?, email=?, userName=? WHERE userID=?";
   
    public static final String DELETE_ID= "deleteId";
    public static final String UPDATE_ID= "updateId";
	// End Servlet Route
}
