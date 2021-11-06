abstract class LocalDataSource {
  Future<bool> authenticateWithFingerprint();
  Future<bool> hasBiometrics();
}
