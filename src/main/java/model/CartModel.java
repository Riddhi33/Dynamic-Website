package model;

import java.io.Serializable;

public class CartModel implements Serializable {

		private static final long serialVersionUID = 1L;

		private int cartID;
		private int productID;
		private int cartQuantity;
		private int userID;
		
		
		public CartModel() {
			super();
		}

		public CartModel(int productID, int cartQuantity, int userID) {
			
			this.productID=productID;
			this.cartQuantity=cartQuantity;
			this.setUserID(userID);
		}
		
		public int getProductID() {
			return productID;
		}



		public void setProductID(int productID) {
			this.productID = productID;
		}
		
		public int getCartQuantity() {
			return cartQuantity;
		}



		public void setCartQuantity(int cartQuantity) {
			this.cartQuantity = cartQuantity;
		}

		public int getUserID() {
			return userID;
		}

		public void setUserID(int userID) {
			this.userID = userID;
		}

		public int getCartID() {
			return cartID;
		}

		public void setCartID(int cartID) {
			this.cartID = cartID;
		}
		
		
		
}
