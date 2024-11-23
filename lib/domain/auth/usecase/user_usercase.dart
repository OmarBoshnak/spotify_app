import 'package:dartz/dartz.dart';
import '../../../core/usecase/usecase.dart';
import '../../../data/auth/model/create_user_req.dart';
import '../../../service_loactor.dart';
import '../repository/auth_repoository.dart';

class UserUserCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    // TODO: implement call
    return sl<AuthRepository>().getUser();
  }
}
