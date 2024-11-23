import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spoti_third/core/configs/constants/app_urls.dart';
import 'package:spoti_third/data/auth/model/user_model.dart';
import 'package:spoti_third/domain/auth/entities/user_entity.dart';

import '../model/create_user_req.dart';
import '../model/signin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> singin(SigninUserReq signinUserReq);
  Future<Either> singup(CreateUserReq creteUserReq);
  Future<Either> getUser();
  Future<Either> signout();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> singin(SigninUserReq signinUserReq) async {
    // TODO: implement singin
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserReq.email,
        password: signinUserReq.password,
      );

      return const Right('Signin was successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'Not found for that email';
      } else if (e.code == 'invalid-credential') {
        message = 'wrong password';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> singup(CreateUserReq createUserReq) async {
    // TODO: implement singup
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);
      FirebaseFirestore.instance.collection('Users').doc(data.user?.uid).set({
        'name': createUserReq.fullName,
        'email': data.user?.email,
      });

      return Right('SignUp was Successful');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'weak-password') {
        message = 'The password prodived is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An acoount already exits with that email';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> getUser() async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      var user = await firebaseFirestore
          .collection('User')
          .doc(firebaseAuth.currentUser?.uid)
          .get();
      UserModel userModel = UserModel.fromJson(user.data()!);
      userModel.imageUrl =
          firebaseAuth.currentUser?.photoURL ?? AppURLs.defaultImage;
      UserEntities userEntities = userModel.toEntity();
      return Right(userEntities);
    } catch (e) {
      return left('An Error');
    }
  }

  @override
  Future<Either> signout() async {
    // TODO: implement signout
    try {
      await FirebaseAuth.instance.signOut();
      return Right('SignOut was Sucessful');
    } catch (e) {
      return Left('SignOut failed: ${e.toString()}');
    }
  }
}
