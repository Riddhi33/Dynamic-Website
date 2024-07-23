package controller;
import model.CartModel;

import java.sql.Connection;

import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.CartModel;
import model.PasswordEncryptionWithAes;
import model.ProductModel;

//import com.mysql.cj.util.StringUtils;

import model.StudentModel;
import util.StringUtils;

public class DatabaseController {
	public Connection getConnection() throws SQLException, ClassNotFoundException{
		Class.forName("com.mysql.cj.jdbc.Driver");

		String url = "jdbc:mysql://localhost:3306/login";
		String user = "root";
		String pass = "Riddhi24!@#";
		return DriverManager.getConnection(url, user, pass);
	}

	public int addStudent (StudentModel studentModel) {
		try (Connection con = getConnection()){

			// Check for existing phone number
			PreparedStatement checkPhoneSt = con.prepareStatement(StringUtils.GET_PHONE);
			checkPhoneSt.setString(1, studentModel.getPhoneNumber());
			ResultSet checkPhoneRs = checkPhoneSt.executeQuery();
			checkPhoneRs.next();
			if (checkPhoneRs.getInt(1) > 0) {
				return -4; //Phone number already exists
			}

			// Check for existing email
			PreparedStatement checkEmailSt = con.prepareStatement(StringUtils.GET_EMAIL);
			checkEmailSt.setString(1, studentModel.getEmail());
			ResultSet checkEmailRs = checkEmailSt.executeQuery();
			checkEmailRs.next();
			if (checkEmailRs.getInt(1) > 0) {
				return -3; //Phone number already exists
			}



			PreparedStatement st = con.prepareStatement(StringUtils.INSERT_STUDENT);	


			st.setString(1, studentModel.getFirstName());
			st.setString(2, studentModel.getLastName());
			st.setDate(3, Date.valueOf(studentModel.getBirthday()));
			st.setString(4, studentModel.getPhoneNumber());
			st.setString(5, studentModel.getAddress());
			st.setString(6, studentModel.getGender());
			st.setString(7, studentModel.getEmail());
			st.setString(8, studentModel.getUserName());
			st.setString(9, PasswordEncryptionWithAes.encrypt(studentModel.getUserName(), studentModel.getPassword()));
			st.setString(10, studentModel.getImageUrlFromPart());

			int result = st.executeUpdate();
			return result > 0 ? 1 : 0;

		}catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return -1;
		}
	}
	
	public boolean isExistingUser(String userName) {
        try (Connection con = getConnection()) {
	// Check for existing username
				PreparedStatement checkUsernameSt = con.prepareStatement(StringUtils.GET_USERNAME);
				checkUsernameSt.setString(1, userName);
				ResultSet checkUsernameRs = checkUsernameSt.executeQuery();
				if (checkUsernameRs.next()) {
					return true; //Username already exists
				}
				return false;
				}
        catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            return false; 
        }
    }


	public int getStudentLoginInfo(String userName, String password) {
		try (Connection con = getConnection()){
			PreparedStatement st = con.prepareStatement(StringUtils.GET_LOGIN_STUDENT_INFO);
			st.setString(1, userName);
			ResultSet rs = st.executeQuery();
			
			if (rs.next()) {
				
				String userDb = rs.getString("userName");
				String passwordDb = rs.getString("password");
				String decryptedPwd = PasswordEncryptionWithAes.decrypt(passwordDb, userDb);
				System.out.println(userDb);
				if (decryptedPwd != null && userDb.equals(userName) && decryptedPwd.equals(password)) {
					// User name and password match in the database
					String role = rs.getString("role");
                    return role.equals("user") ? 1 : (role.equals("admin") ? 2 : 0);
                    
				}
			}	
					return 0;
					
		}catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return -1;
		}
	}
	
	public ArrayList<StudentModel> getAllStudentsInfo(){
		try {
			PreparedStatement stmt = getConnection()
					.prepareStatement("SELECT * FROM register");
			ResultSet result = stmt.executeQuery();

			ArrayList<StudentModel> students = new ArrayList<StudentModel>();

			while(result.next()) {
				StudentModel student = new StudentModel();
				student.setFirstName(result.getString("firstName"));
				student.setLastName(result.getString("lastName"));
				student.setBirthday(result.getDate("birthday").toLocalDate());
				student.setPhoneNumber(result.getString("phoneNumber"));
				student.setAddress(result.getString("address"));
				student.setGender(result.getString("gender"));
				student.setEmail(result.getString("email"));
				student.setUserName(result.getString("userName"));
				student.setImageUrlFromPart(result.getString("image"));

				students.add(student);
			}
			return students;
		}catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	
	public StudentModel getUserInfo(String userName) {
		/*
		 * UserProfile user = null; Connection conn = null; PreparedStatement stmt =
		 * null; ResultSet rs = null;
		 */
		try (Connection con = getConnection()){
			PreparedStatement st = con.prepareStatement(StringUtils.GET_USER_DETAIL);
			st.setString(1, userName);
			ResultSet result = st.executeQuery();
			StudentModel student = new StudentModel();
			
			if(result.next()) {
				student.setFirstName(result.getString("firstName"));
				student.setLastName(result.getString("lastName"));
				student.setPhoneNumber(result.getString("phoneNumber"));
				student.setAddress(result.getString("address"));
				student.setEmail(result.getString("email"));
				/* student.setUserName(result.getString("userName")); */
	}
			return student;
		}catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return null;
		}
	}

	public int addProduct (ProductModel productModel) {
		try (Connection con = getConnection()){



			PreparedStatement st = con.prepareStatement(StringUtils.INSERT_PRODUCT);	


			st.setString(1, productModel.getProductName());
			st.setString(2, productModel.getProductPrice());
			st.setString(3, productModel.getProductDescription());
			st.setString(4, productModel.getProductCategory());
			st.setString(5, productModel.getStockQuantity());
			st.setString(6, productModel.getImageUrlFromPart());

			int result = st.executeUpdate();
			return result > 0 ? 1 : 0;

		}catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return -1;
		}
	}
	
	
	public ArrayList<ProductModel> getAllProduct(){
		try {
			PreparedStatement stmt = getConnection()
					.prepareStatement("SELECT * FROM addproduct");
			ResultSet result = stmt.executeQuery();

			ArrayList<ProductModel> products = new ArrayList<ProductModel>();

			while(result.next()) {
				ProductModel product = new ProductModel();
				product.setProductName(result.getString("productName"));
				product.setProductPrice(result.getString("productPrice"));
				product.setProductDescription(result.getString("productDescription"));
				product.setProductCategory(result.getString("productCategory"));
				product.setStockQuantity(result.getString("stockQuantity"));
				product.setImageUrlFromPart(result.getString("productImage"));
				product.setProductID(result.getInt("productID"));

				products.add(product);
			}
			return products;
		}catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return null;
		}

	}



	

	public int deleteProduct(String productName) {
		try (Connection con = getConnection()) {
			PreparedStatement st = con.prepareStatement("Delete from addproduct where productName = ?");
			st.setString(1, productName);
			return st.executeUpdate();
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace(); 
			return -1;
		}
	}
	
	


	public int updateProduct(ProductModel productmodel) {
		try(Connection con=getConnection()){
			PreparedStatement pdt = con.prepareStatement(StringUtils.UPDATE_PRODUCT);
			
			pdt.setString(1, productmodel.getProductName());
			pdt.setString(2, productmodel.getProductPrice());
			pdt.setString(3, productmodel.getProductDescription());
			pdt.setString(4, productmodel.getProductCategory());
			pdt.setString(5, productmodel.getStockQuantity());
			pdt.setInt(6, productmodel.getProductID());
			
			System.out.println("getProductName= " + productmodel.getProductName());

			int result = pdt.executeUpdate();
			
			System.out.println("Result= " + result);

			return result > 0 ? 1: 0;
		}
		catch (SQLException | ClassNotFoundException ex) {
			System.out.println(ex.getMessage());
			ex.printStackTrace(); // Log the exception for debugging
			return -1;
		}
	}	
	
	
	public ProductModel getProductByID(int productID) {
        try {
            PreparedStatement stmt = getConnection()
                    .prepareStatement("SELECT * FROM addproduct WHERE productID = ?");
            stmt.setInt(1, productID);
            ResultSet result = stmt.executeQuery();

            if (result.next()) {
            	ProductModel product = new ProductModel();
            	product.setProductName(result.getString("productName"));
            	product.setProductPrice(result.getString("productPrice"));
            	product.setProductDescription(result.getString("productDescription"));
            	product.setProductCategory(result.getString("productCategory"));
            	product.setStockQuantity(result.getString("stockQuantity"));
            	product.setProductID(result.getInt("productID"));
            	
                return product;
            } else {
                return null; 
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            return null;
        }
    }

	
	
	
	public int updateUser(StudentModel studentmodel) {
		try(Connection con=getConnection()){

			PreparedStatement pdt = con.prepareStatement(StringUtils.UPDATE_PRODUCT);
			
			pdt.setString(1, studentmodel.getFirstName());
			pdt.setString(2, studentmodel.getLastName());
			pdt.setString(3, studentmodel.getPhoneNumber());
			pdt.setString(4, studentmodel.getAddress());
			pdt.setString(5, studentmodel.getEmail());
			pdt.setString(6, studentmodel.getUserName());
			pdt.setInt(7, studentmodel.getUserID());
			
			System.out.println("getUserName= " + studentmodel.getUserName());

			int result = pdt.executeUpdate();
			
			System.out.println("Result= " + result);

			return result > 0 ? 1: 0;
		}
		catch (SQLException | ClassNotFoundException ex) {
			System.out.println(ex.getMessage());
			ex.printStackTrace();
			return -1;
		}
	}
	
	
	
	
	
	
	public StudentModel getUserByID(int userID) {
        try {
            PreparedStatement stmt = getConnection()
                    .prepareStatement("SELECT * FROM register WHERE userID = ?");
            stmt.setInt(1, userID);
            ResultSet result = stmt.executeQuery();

            if (result.next()) {
            	StudentModel student = new StudentModel();
            	student.setFirstName(result.getString("firstName"));
            	student.setLastName(result.getString("lastName"));
            	student.setPhoneNumber(result.getString("phoneNumber"));
            	student.setAddress(result.getString("address"));
            	student.setEmail(result.getString("email"));
            	student.setUserName(result.getString("username"));
                return student;
            } else {
                return null; 
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            return null;
        }
    }
	
	
	public int getUserIdByUsername(String userName) {
	    try (Connection con = getConnection()) {
	        PreparedStatement stmt = con.prepareStatement("SELECT userID FROM register WHERE userName = ?");
	        stmt.setString(1, userName);
	        ResultSet result = stmt.executeQuery();

	        if (result.next()) {
	            return result.getInt("userID");
	        } else {
	            return -1; // User not found
	        }
	    } catch (SQLException | ClassNotFoundException ex) {
	        ex.printStackTrace();
	        return -2; // Error occurred
	    }
	}
	
	public int AddtoCart(int userID, int productID, int cartQuantity) {
		try (Connection con = getConnection()) {
	        PreparedStatement stmt = con.prepareStatement("INSERT INTO cart (productID, cartQuantity, userID) VALUES (?,?, ?)");
	        
	        stmt.setInt(1, productID);
	        stmt.setInt(2, cartQuantity);
			stmt.setInt(3, userID);
	        int result = stmt.executeUpdate();
	        return result > 0 ? 1 : 0;
	}
		catch (SQLException | ClassNotFoundException ex) {
	        ex.printStackTrace();
	        return -1; // Error occurred
	    }
	
	}
	
	
	public ArrayList<ProductModel> getAllCart(){
		try {
			PreparedStatement stmt = getConnection()
					.prepareStatement("SELECT * FROM cart");
			ResultSet result = stmt.executeQuery();

			ArrayList<ProductModel> products = new ArrayList<ProductModel>();

			while(result.next()) {
				ProductModel product = new ProductModel();
				product.setProductID(result.getInt("productID"));
				product.setCartQuantity(result.getInt("cartQuantity"));


				products.add(product);
			}
			return products;
		}catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return null;
		}

	}
	
	public ArrayList<CartModel> getCartItemsByUserId(int userID) {

	    ArrayList<CartModel> cartItems = new ArrayList<>();



	    try {

	    	 String query = "SELECT productID, cartQuantity FROM cart WHERE userID = ?";

	        PreparedStatement statement = getConnection().prepareStatement(query);

	        statement.setInt(1, userID);


	        ResultSet resultSet = statement.executeQuery();


	        while (resultSet.next()) {

	            CartModel cartItem = new CartModel();

	            cartItem.setProductID(resultSet.getInt("productID"));

	            cartItem.setCartQuantity(resultSet.getInt("cartQuantity"));


	            cartItems.add(cartItem);

		      }

	        return cartItems;

	    } catch (SQLException | ClassNotFoundException ex) {

	        ex.printStackTrace();

	        return null;

	    } 

	}
}
	
	
	
