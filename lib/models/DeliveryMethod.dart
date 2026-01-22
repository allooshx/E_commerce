class DeliveryMethod {
  final String id;
  final String name;
  final String price;
  final String imageUrl;
  final String days;

  DeliveryMethod({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.days,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'price': price});
    result.addAll({'imageUrl': imageUrl});
    result.addAll({'days': days});
    return result;
  }

  factory DeliveryMethod.fromMap(Map<String, dynamic> map,String documentId) {
    return DeliveryMethod(
      id: documentId,
      name: map['name'] ?? '',
      price: map['price'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      days: map['days'] ?? '',
    );
  }
}
