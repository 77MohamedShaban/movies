class UserEntity {
  final String? uid;
  final String? email;
  final String? name;
  final String? phone;
  final String? avatarId;

  UserEntity({
    required this.uid,
    required this.email,
    required this.name,
    this.phone,
    this.avatarId,
  });
}
