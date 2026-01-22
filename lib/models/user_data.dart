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
    return {
      "uid": uid,
      "email": email,
      "name": name,
      "phone": phone,
      "image": image,
      "gender": gender,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map, String documentId) {
    return UserData(
      uid: documentId,
      email: map['email'] as String,
      name: map['name'] as String,
      phone: map['phone'] as String,
      image: map['image'] as String,
      gender: map['gender'] as String,
    );
  }
}
