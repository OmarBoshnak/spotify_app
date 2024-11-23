import 'package:dartz/dartz.dart';

import '../../../domain/auth/repository/auth_repoository.dart';
import '../../../service_loactor.dart';
import '../model/create_user_req.dart';
import '../model/signin_user_req.dart';
import '../sources/auth_firebase_service.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    return await sl<AuthFirebaseService>().singin(signinUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    // TODO: implement signup
    return await sl<AuthFirebaseService>().singup(createUserReq);
  }

  @override
  Future<Either> getUser() async {
    // TODO: implement getUser
    return await sl<AuthFirebaseService>().getUser();
  }

  @override
  Future<Either> signout() async {
    // TODO: implement signout
    return await sl<AuthFirebaseService>().signout();
  }
}
