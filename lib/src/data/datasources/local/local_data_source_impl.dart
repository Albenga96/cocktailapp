import 'package:cocktailapp/src/data/datasources/local/local_data_source.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalDataSourceImpl implements LocalDataSource {
  final _auth = LocalAuthentication();
  // Authenticate with fingerprint
  @override
  Future<bool> authenticateWithFingerprint() async {
    final isAvailable = await hasBiometrics();
    if (!isAvailable) return false;
    try {
      return await _auth.authenticate(
        biometricOnly: true,
        localizedReason: "Scan fingerprint to Authenticate",
        stickyAuth: true,
        useErrorDialogs: true,
      );
    } on PlatformException catch (e) {
      return false;
    }
  }

  @override
  Future<bool> hasBiometrics() async {
    return await _auth.canCheckBiometrics;
  }
}
