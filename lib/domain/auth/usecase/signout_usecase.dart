import 'package:dartz/dartz.dart';

import '../../../core/usecase/usecase.dart';
import '../../../data/auth/model/signin_user_req.dart';
import '../../../service_loactor.dart';
import '../repository/auth_repoository.dart';

class SignoutUsecase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return sl<AuthRepository>().signout();
  }
}
