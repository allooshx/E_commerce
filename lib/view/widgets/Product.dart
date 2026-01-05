class Product {
  final String id;
  final String title;
  final int price;
  final String description;
  final String category;
  final String image;
  final int? rating;
  final int discountValue;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    this.category = "Other",
    required this.image,
    this.rating,
    this.discountValue = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "price": price,
      "description": description,
      "category": category,
      "image": image,
      "rating": rating,
      "discountValue": discountValue,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map, String documentId) {
    return Product(
      id: documentId,
      title: map["title"] as String,
      price: map["price"] as int,
      description: map["description"] as String,
      category: map["category"] as String,
      image: map["image"] as String,
      rating: map["rating"] as int,
      discountValue: map["discountValue"] as int,
    );
  }
}

