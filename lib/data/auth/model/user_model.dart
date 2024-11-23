import 'package:spoti_third/domain/auth/entities/user_entity.dart';

class UserModel {
  String? fullName;
  String? email;
  String? imageUrl;
  UserModel(
      {required this.fullName, required this.email, required this.imageUrl});
  UserModel.fromJson(Map<String, dynamic> json) {
    fullName = json['name'];
    email = json['email'];
  }
}

extension UserModelX on UserModel {
  UserEntities toEntity() {
    return UserEntities(
      email: email,
      fullName: fullName,
      imageUrl: imageUrl,
    );
  }
}
