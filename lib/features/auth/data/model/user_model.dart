class UserModel {
  static const String usersCollection = "Users";

  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? avatarId;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.avatarId,
  });

  factory UserModel.fromJson(Map<String, dynamic>? data) {
    return UserModel(
      id: data?["id"],
      name: data?["name"],
      email: data?["email"],
      phone: data?["phone"],
      avatarId: data?["avatarId"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phone": phone,
      "avatarId": avatarId,
      "createdAt": DateTime.now().millisecondsSinceEpoch,
    };
  }
}
