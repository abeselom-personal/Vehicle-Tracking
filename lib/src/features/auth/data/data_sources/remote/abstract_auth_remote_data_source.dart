abstract class AbstractAuthRemoteDataSource {
  /// signup
  Future<Map<String, dynamic>> signup({
    required String email,
    required String password,
    required String name,
  });

  /// login
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  });
}