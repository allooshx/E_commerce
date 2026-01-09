class UserData {
  final String uid;
  final String email;
  final String name;
  final String phone;
  final String image;
  final String gender;

  UserData({
    required this.uid,
    required this.email,
    required this.name,
    required this.phone,
    required this.image,
    required this.gender,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({"uid": uid});
    result.addAll({"email": email});
    result.addAll({"name": name});
    result.addAll({"phone": phone});
    result.addAll({"image": image});
    result.addAll({"gender": gender});
    return result;
  }

  factory UserData.fromMap(Map<String, dynamic> map, String documentId) {
    return UserData(
      uid: documentId,
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      image: map['image'] ?? '',
      gender: map['gender'] ?? '',
    );
  }
}
