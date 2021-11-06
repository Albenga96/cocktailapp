import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class AuthenticationWithFingerprint {
  final _auth = LocalAuthentication();

  // Authenticate with fingerprint

  Future<bool> authenticateWithFingerprint() async {
    final isAvailable = await _hasBiometrics();
    if (!isAvailable) return false;
    try {
      return await _auth.authenticate(
        biometricOnly: false,
        localizedReason: "Scan fingerprint to Authenticate",
        stickyAuth: true,
        useErrorDialogs: true,
      );
    } on PlatformException catch (_) {
      return false;
    }
  }

  Future<bool> _hasBiometrics() async {
    return await _auth.canCheckBiometrics;
  }
}
