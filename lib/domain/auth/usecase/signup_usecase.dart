import 'package:dartz/dartz.dart';
import '../../../core/usecase/usecase.dart';
import '../../../data/auth/model/create_user_req.dart';
import '../../../service_loactor.dart';
import '../repository/auth_repoository.dart';

class SignupUsecase implements Usecase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) async {
    // TODO: implement call
    return sl<AuthRepository>().signup(params!);
  }
}
