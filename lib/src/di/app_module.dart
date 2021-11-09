import 'package:cocktailapp/src/core/utils/auth/auth_with_fingerprint.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';

@module
abstract class AppModule {
  @lazySingleton
  LocalAuthentication get localAuth => LocalAuthentication();

  @lazySingleton
  Dio provideDio() => Dio()
    ..interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestBody: true,
      ),
    );
}
