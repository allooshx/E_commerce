class ApiPath {
  static String products() => 'products/';
  static String users(String uid) => 'users/$uid';
  static String addToCart(String uid,String addToCartID)=>"cart/$uid/cart/$addToCartID";

}
