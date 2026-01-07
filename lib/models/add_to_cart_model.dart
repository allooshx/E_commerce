class AddToCartModel {
  final String id;
  final String productId;
  final String title;
  final int price;
  final String image;
  final int discountValue;
  final int quantity;
  final String color;
  final String size;

  AddToCartModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    this.discountValue = 0,
    this.quantity = 1,
    this.color = "Black",
    required this.size,
    required this.productId,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({"id": id});
    result.addAll({"title": title});
    result.addAll({"price": price});
    result.addAll({"image": image});
    result.addAll({"discountValue": discountValue});
    result.addAll({"quantity": quantity});
    result.addAll({"color": color});
    result.addAll({"size": size});
    result.addAll({"productId": productId});

    return result;
  }

  factory AddToCartModel.fromMap(Map<String, dynamic> map, String documentId) {
    return AddToCartModel(
      id: documentId,
      title: map['title'] ?? '',
      price: map['price']?.toInt() ?? 0,
      image: map['image'] ?? '',
      discountValue: map['discountValue']?.toInt() ?? 0,
      quantity: map['quantity']?.toInt() ?? 0,
      color: map['color'] ?? '',
      size: map['size'] ?? '',
      productId: map['productId'] ?? '',
    );
  }
}
