import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/config/ansicolor.dart';
import '../../../../core/constants/backend_point.dart';
import '../../../../core/errors/custom_exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/database_service.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../domain/entity/user_entities.dart';
import '../../domain/repositories/auth_repo.dart';
import '../models/user_model.dart';

class AuthRepoImpl extends AuthRepo {
  final FirbaseAuthService firbaseAuthService;
  final DatabaseService databaseService;
  AuthRepoImpl(
    this.firbaseAuthService,
    this.databaseService,
  );

  @override
  Future<Either<Failure, UserEntities>> creatUserWithEmailAndPassword(
    String name,
    String email,
    String password,
  ) async {
    User? user;
    try {
      user = await firbaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntities(
        uId: user.uid,
        name: name,
        email: email,
      );
      addUserData(
        user: userEntity,
      );
      var fetchedUserEntity = await getUserData(userId: user.uid);

      return Right(fetchedUserEntity);
    } on CustomException catch (e) {
      deleteUser(user);
      return Left(
        ServerFailure(
          e.message,
        ),
      );
    } catch (e) {
      deleteUser(user);
      log(DebugConsoleMessages.error(
          'An Exception occurred in AuthRepoImpl.creatUserWithEmailAndPassword: $e'));
      return Left(
        ServerFailure(
          'حدث خطأ  في الاتصال بالسيرفر, حاول مرة ثانية',
        ),
      );
    }
  }

  void deleteUser(User? user) {
    if (user != null) {
      firbaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntities>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firbaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = await getUserData(userId: user.uid);
      return Right(userEntity);
    } on CustomException catch (e) {
      return Left(
        ServerFailure(
          e.message,
        ),
      );
    } catch (e) {
      log(DebugConsoleMessages.error(
          'An Exception occurred in AuthRepoImpl.signInWithEmailAndPassword: ${e.toString()}'));
      // Return a Left containing a ServerFailure if the operation fails.
      return Left(
        ServerFailure(
          'حدث خطأ  في الاتصال بالسيرفر, حاول مرة ثانية',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntities>> signInWithGoogle() async {
    User? user;
    try {
      user = await firbaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      await syncUserData(user, userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      deleteUser(user);
      log(
        DebugConsoleMessages.error(
            'An Exception occurred in AuthRepoImpl.signInWithGoogle: ${e.toString()}'),
      );
      return Left(
        ServerFailure(
          e.message,
        ),
      );
    }
  }

  /// يتحقق من وجود المستخدم في قاعدة البيانات بعد تسجيل الدخول.
  /// إذا كان المستخدم موجودًا، يتم جلب بياناته من Firestore.
  /// إذا لم يكن موجودًا، يتم إضافة بياناته الجديدة إلى قاعدة البيانات.

  Future<void> syncUserData(User user, UserModel userEntity) async {
    var isUserExist = await databaseService.checkIfDataExists(
        path: BackendPoint.isUserExists, documentId: user.uid);
    if (isUserExist) {
      await getUserData(userId: user.uid);
    } else {}
    await addUserData(
      user: userEntity,
    );
  }

  @override
  Future<Either<Failure, UserEntities>> signInWithFacebook() async {
    User? user;
    try {
      user = await firbaseAuthService.signInWithFacebook();
      var userEntities = UserModel.fromFirebaseUser(user);
      await syncUserData(
        user,
        userEntities,
      );
      return Right(userEntities);
    } on CustomException catch (e) {
      deleteUser(user);
      log(
        DebugConsoleMessages.error(
            'An Exception occurred in AuthRepoImpl.signInWithFacebook: ${e.toString()}'),
      );
      return Left(
        ServerFailure(
          e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntities>> signInWithApple() {
    throw UnimplementedError();
  }

  @override
  Future addUserData({
    required UserEntities user,
  }) async {
    await databaseService.addData(
        path: BackendPoint.addDataToUsersCollection,
        data: user.toMap(),
        documentId: user.uId);
  }

  @override
  Future<UserEntities> getUserData({required String userId}) async {
    var userData = await databaseService.getData(
      path: BackendPoint.getDataFromUsersCollection,
      documentId: userId,
    );
    return UserModel.fromJson(userData);
  }

  @override
  Future signOut() async {
    await firbaseAuthService.signOut();
  }
}
