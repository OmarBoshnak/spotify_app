import 'package:dartz/dartz.dart';
import '../../../data/auth/model/create_user_req.dart';
import '../../../data/auth/model/signin_user_req.dart';

abstract class AuthRepository {
  Future<Either> signin(SigninUserReq signinUserReq);
  Future<Either> signup(CreateUserReq createUserReq);
  Future<Either> signout();
  Future<Either> getUser();
}
