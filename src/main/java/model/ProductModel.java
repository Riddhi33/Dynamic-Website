package model;

import java.io.File;
import java.io.Serializable;

import javax.servlet.http.Part;

import util.StringUtils;

/**
 * 
 * This is a Student model that represents a student object
 * 
 * @author 
 */

public class ProductModel implements Serializable {

	private static final long serialVersionUID = 1L;

	private int productID;
	private String productName;
	private String productPrice;
	private String productDescription;
	private String productCategory;
	private String stockQuantity;
	private String imageUrlFromPart;
	private int cartQuantity;

	public ProductModel() {
		super();
	}

	

	public ProductModel( String productName, String productPrice, String productDescription, String productCategory, String stockQuantity, Part imagePart) {
		super();
		
		this.productName=productName;
		this.productPrice=productPrice;
		this.productDescription=productDescription;
		this.productCategory=productCategory;
		this.stockQuantity=stockQuantity;
		
		this.setImageUrlFromPart(getImageUrl(imagePart));
	}
	
	public int getProductID() {
		return productID;
	}



	public void setProductID(int productID) {
		this.productID = productID;
	}
	
	public String getProductName() {
		return productName;
	}



	public void setProductName(String productName) {
		this.productName = productName;
	}



	public String getProductPrice() {
		return productPrice;
	}



	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}



	public String getProductDescription() {
		return productDescription;
	}



	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}



	public String getProductCategory() {
		return productCategory;
	}



	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}



	public String getStockQuantity() {
		return stockQuantity;
	}



	public void setStockQuantity(String stockQuantity) {
		this.stockQuantity = stockQuantity;
	}



	public String getImageUrlFromPart() {
		return imageUrlFromPart;
	}

	public void setImageUrlFromPart(String imageUrlFromPart) {
		this.imageUrlFromPart = imageUrlFromPart;
	}

	
	
	private String getImageUrl(Part part) {
		String savePath = StringUtils.IMAGE_DIR_SAVE_PATH;
		File fileSaveDir = new File(savePath);
		String imageUrlFromPart = null;
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdirs();
		}
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				imageUrlFromPart = s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		if (imageUrlFromPart == null || imageUrlFromPart.isEmpty()) {
			imageUrlFromPart = "download.jpg";
		}
		return imageUrlFromPart;
	}



	public int getCartQuantity() {
		return cartQuantity;
	}



	public void setCartQuantity(int cartQuantity) {
		this.cartQuantity = cartQuantity;
	}


}